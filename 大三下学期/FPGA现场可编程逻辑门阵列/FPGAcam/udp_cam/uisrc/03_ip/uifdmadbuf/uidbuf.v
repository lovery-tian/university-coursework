
/*******************************MILIANKE*******************************
*Company : MiLianKe Electronic Technology Co., Ltd.
*WebSite:https://www.milianke.com
*TechWeb:https://www.uisrc.com
*tmall-shop:https://milianke.tmall.com
*jd-shop:https://milianke.jd.com
*taobao-shop1: https://milianke.taobao.com
*Create Date: 2021/10/15
*File Name: uidbuf.v
*Description: 
*Declaration:
*The reference demo provided by Milianke is only used for learning. 
*We cannot ensure that the demo itself is free of bugs, so users 
*should be responsible for the technical problems and consequences
*caused by the use of their own products.
*Copyright: Copyright (c) MiLianKe
*All rights reserved.
*Revision: 3.1
*Signal description
*1) _i input
*2) _o output
*3) _n activ low
*4) _dg debug signal 
*5) _r delay or register
*6) _s state mechine
*********************************************************************/

/*********uidbuf(fdma data buffer controller)基于FDMA信号时序的缓存控制器***********
--版本号3.1
--以下是米联客设计的uidbuf(fdma data buffer controller)基于FDMA信号时序的缓存控制器
--1.代码简洁，占用极少逻辑资源，代码结构清晰，逻辑设计严谨
--2.读写通道独立，FIFO大小，数据位宽可以灵活设置，适合用于基于RGB时序的视频数据或者数据流传输
*********************************************************************/

`timescale 1ns / 1ns

module uidbuf#(
parameter  integer                   VIDEO_ENABLE   = 1,//使能视频帧支持功能
parameter  integer                   ENABLE_WRITE   = 1,//使能写通道
parameter  integer                   ENABLE_READ    = 1,//使能读通道

parameter  integer                   AXI_DATA_WIDTH = 128,//AXI总线数据位宽
parameter  integer                   AXI_ADDR_WIDTH = 32, //AXI总线地址位宽

parameter  integer                   W_BUFDEPTH     = 2048, //写通道AXI设置FIFO缓存大小
parameter  integer                   W_DATAWIDTH    = 32,  //写通道AXI设置数据位宽大小
parameter  [AXI_ADDR_WIDTH -1'b1: 0] W_BASEADDR     = 0, //写通道设置内存起始地址
parameter  integer                   W_DSIZEBITS    = 24, //写通道设置缓存数据的增量地址大小，用于FDMA DBUF 计算帧缓存起始地址
parameter  integer                   W_XSIZE        = 1920, //写通道设置X方向的数据大小，代表了每次FDMA 传输的数据长度
parameter  integer                   W_XSTRIDE      = 1920, //写通道设置X方向的Stride值，主要用于图形缓存应用
parameter  integer                   W_YSIZE        = 1080, //写通道设置Y方向值，代表了进行了多少次XSIZE传输
parameter  integer                   W_XDIV         = 2, //写通道对X方向数据拆分为XDIV次传输，减少FIFO的使用
parameter  integer                   W_BUFSIZE      = 3, //写通道设置帧缓存大小，目前最大支持128帧，可以修改参数支持更缓存数

parameter  integer                   R_BUFDEPTH     = 2048, //读通道AXI设置FIFO缓存大小
parameter  integer                   R_DATAWIDTH    = 32, //读通道AXI设置数据位宽大小
parameter  [AXI_ADDR_WIDTH -1'b1: 0] R_BASEADDR     = 0, //读通道设置内存起始地址
parameter  integer                   R_DSIZEBITS    = 24, //读通道设置缓存数据的增量地址大小，用于FDMA DBUF 计算帧缓存起始地址
parameter  integer                   R_XSIZE        = 1920, //读通道设置X方向的数据大小，代表了每次FDMA 传输的数据长度
parameter  integer                   R_XSTRIDE      = 1920, //读通道设置X方向的Stride值，主要用于图形缓存应用
parameter  integer                   R_YSIZE        = 1080, //读通道设置Y方向值，代表了进行了多少次XSIZE传输
parameter  integer                   R_XDIV         = 2, //读通道对X方向数据拆分为XDIV次传输，减少FIFO的使用
parameter  integer                   R_BUFSIZE      = 3 //读通道设置帧缓存大小，目前最大支持128帧，可以修改参数支持更缓存数
)
(
input wire                                  ui_clk, //和FDMA AXI总线时钟一致
input wire                                  ui_rstn, //和FDMA AXI复位一致
//sensor input -W_FIFO--------------
input wire                                  W_wclk_i, //用户写数据接口时钟 
input wire                                  W_FS_i, //用户写数据接口同步信号，对于非视频帧一般设置为1
input wire                                  W_wren_i, //用户写数据使能
input wire     [W_DATAWIDTH-1'b1 : 0]       W_data_i, //用户写数据
output reg     [7   :0]                     W_sync_cnt_o =0, //写通道BUF帧同步输出
input  wire    [7   :0]                     W_buf_i, // 写通道BUF帧同步输入
output wire                                  W_full,

//----------fdma signals write-------       
output wire    [AXI_ADDR_WIDTH-1'b1: 0]     fdma_waddr, //FDMA写通道地址
output wire                                 fdma_wareq, //FDMA写通道请求
output wire    [15  :0]                     fdma_wsize, //FDMA写通道一次FDMA的传输大小                                     
input  wire                                 fdma_wbusy, //FDMA处于BUSY状态，AXI总线正在写操作   
output wire    [AXI_DATA_WIDTH-1'b1:0]      fdma_wdata, //FDMA写数据
input  wire                                 fdma_wvalid, //FDMA 写有效
output wire                                 fdma_wready, //FDMA写准备好，用户可以写数据
output reg     [7   :0]                     fmda_wbuf =0, //FDMA的写帧缓存号输出
output wire                                 fdma_wirq, //FDMA一次写完成的数据传输完成后，产生中断。   
//----------fdma signals read-------  
input  wire                                 R_rclk_i, //用户读数据接口时钟
input  wire                                 R_FS_i, //用户读数据接口同步信号，对于非视频帧一般设置1
input  wire                                 R_rden_i, //用户读数据使能
output wire    [AXI_DATA_WIDTH-1'b1 : 0]       R_data_o, //用户读数据
output reg     [7   :0]                     R_sync_cnt_o =0, //读通道BUF帧同步输出
input  wire    [7   :0]                     R_buf_i, //写通道BUF帧同步输入
output wire                                 R_empty,
output wire                                 R_rdy_o,

output wire    [AXI_ADDR_WIDTH-1'b1: 0]     fdma_raddr, // FDMA读通道地址
output wire                                 fdma_rareq, // FDMA读通道请求
output wire    [15: 0]                      fdma_rsize, // FDMA读通道一次FDMA的传输大小                                     
input  wire                                 fdma_rbusy, // FDMA处于BUSY状态，AXI总线正在读操作     
input  wire    [AXI_DATA_WIDTH-1'b1:0]      fdma_rdata, // FDMA读数据
input  wire                                 fdma_rvalid, // FDMA 读有效
output wire                                 fdma_rready, // FDMA读准备好，用户可以读数据
output reg     [7  :0]                      fmda_rbuf =0, // FDMA的读帧缓存号输出
output wire                                 fdma_rirq // FDMA一次读完成的数据传输完成后，产生中断
);    

// 计算Log2
function integer clog2;
  input integer value;
  begin 
    value = value-1;
    for (clog2=0; value>0; clog2=clog2+1)
      value = value>>1;
    end 
  endfunction

//FDMA读写状态机的状态值，一般4个状态值即可 
localparam S_IDLE  =  2'd0;  
localparam S_RST   =  2'd1;  
localparam S_DATA1 =  2'd2;   
localparam S_DATA2 =  2'd3; 

// 通过设置通道使能，可以优化代码的利用率
generate  if(ENABLE_WRITE == 1)begin : FDMA_WRITE_ENABLE

localparam WFIFO_DEPTH = W_BUFDEPTH; //写通道FIFO深度
localparam W_WR_DATA_COUNT_WIDTH = clog2(WFIFO_DEPTH)+1; //计算FIFO的写通道位宽
localparam W_RD_DATA_COUNT_WIDTH = clog2(WFIFO_DEPTH*W_DATAWIDTH/AXI_DATA_WIDTH)+1;//clog2(WFIFO_DEPTH/(AXI_DATA_WIDTH/W_DATAWIDTH))+1;

localparam WYBUF_SIZE           = (W_BUFSIZE - 1'b1); //写通道需要完成多少次XSIZE操作
localparam WY_BURST_TIMES       = (W_YSIZE*W_XDIV); //写通道需要完成的FDMA burst 操作次数，XDIV用于把XSIZE分解多次传输
localparam FDMA_WX_BURST        = (W_XSIZE*W_DATAWIDTH/AXI_DATA_WIDTH)/W_XDIV; //FDMA BURST 一次的大小
localparam WX_BURST_ADDR_INC    = (W_XSIZE*(W_DATAWIDTH/8))/W_XDIV; //FDMA每次burst之后的地址增加
localparam WX_LAST_ADDR_INC     = (W_XSTRIDE-W_XSIZE)*(W_DATAWIDTH/8) + WX_BURST_ADDR_INC; //根据stride值计算出来最后一次地址

(*mark_debug = "true"*) (* KEEP = "TRUE" *) wire  W_wren_ri = W_wren_i; 

assign                                  fdma_wready = 1'b1;
reg                                     fdma_wareq_r= 1'b0;
reg                                     W_FIFO_Rst=0; 
(*mark_debug = "true"*) (* KEEP = "TRUE" *)wire                                    W_FS;
(*mark_debug = "true"*) (* KEEP = "TRUE" *)reg [1 :0]                              W_MS=0; 
reg [W_DSIZEBITS-1'b1:0]                W_addr=0; 
(*mark_debug = "true"*) (* KEEP = "TRUE" *)reg [15:0]                              W_bcnt=0; 
(*mark_debug = "true"*) (* KEEP = "TRUE" *)wire[W_RD_DATA_COUNT_WIDTH-1'b1 :0]     W_rcnt;
(*mark_debug = "true"*) (* KEEP = "TRUE" *)reg                                     W_REQ=0; 
(*mark_debug = "true"*) (* KEEP = "TRUE" *)reg [5 :0]                              wirq_dly_cnt =0;
reg [3 :0]                              wdiv_cnt =0;
reg [7 :0]                              wrst_cnt =0;
reg [7 :0]                              fmda_wbufn;

(*mark_debug = "true"*) (* KEEP = "TRUE" *) wire wirq= fdma_wirq;

assign fdma_wsize = FDMA_WX_BURST;
assign fdma_wirq = (wirq_dly_cnt>0);

assign fdma_waddr = W_BASEADDR + {fmda_wbufn,W_addr};//由于FPGA逻辑做乘法比较复杂，因此通过设置高位地址实现缓存设置

reg [1:0] W_MS_r =0;
always @(posedge ui_clk) W_MS_r <= W_MS;

//每次FDMA DBUF 完成一帧数据传输后，产生中断，这个中断持续60个周期的uiclk,这里的延迟必须足够ZYNQ IP核识别到这个中断
always @(posedge ui_clk) begin
    if(ui_rstn == 1'b0)begin
        wirq_dly_cnt <= 6'd0;
        fmda_wbuf <=0;
    end
    else if((W_MS_r == S_DATA2) && (W_MS == S_IDLE))begin
        wirq_dly_cnt <= 60;
        fmda_wbuf <= fmda_wbufn;
    end
    else if(wirq_dly_cnt >0)
        wirq_dly_cnt <= wirq_dly_cnt - 1'b1;
end

//帧同步，对于视频有效
fs_cap #
(
.VIDEO_ENABLE(VIDEO_ENABLE)
)
fs_cap_W0
(
 .clk_i(ui_clk),
 .rstn_i(ui_rstn),
 .vs_i(W_FS_i),
 .fs_cap_o(W_FS)
);

assign fdma_wareq = fdma_wareq_r;

//写通道状态机，采用4个状态值描述
 always @(posedge ui_clk) begin
    if(!ui_rstn)begin
        W_MS         <= S_IDLE;
        W_FIFO_Rst   <= 0;
        W_addr       <= 0;
        W_sync_cnt_o <= 0;
        W_bcnt       <= 0;
        wrst_cnt     <= 0;
        wdiv_cnt     <= 0;
        fmda_wbufn    <= 0;
        fdma_wareq_r <= 1'd0;
    end   
    else begin
      case(W_MS)
        S_IDLE:begin
          W_addr <= 0;
          W_bcnt <= 0;
          wrst_cnt <= 0;
          wdiv_cnt <=0;
          if(W_FS) begin //帧同步，对于非视频数据一般常量为1
            W_MS <= S_RST;
            if(W_sync_cnt_o < WYBUF_SIZE) //输出帧同步计数器
                W_sync_cnt_o <= W_sync_cnt_o + 1'b1; 
            else 
                W_sync_cnt_o <= 0;  
          end
       end
       S_RST:begin//帧同步，对于非视频数据直接跳过,对于视频数据，会同步每一帧，并且复位数据FIFO
           fmda_wbufn <= W_buf_i;
           wrst_cnt <= wrst_cnt + 1'b1;
           if((VIDEO_ENABLE == 1) && (wrst_cnt < 40))
                W_FIFO_Rst <= 1;
           else if((VIDEO_ENABLE == 1) && (wrst_cnt < 100))
                W_FIFO_Rst <= 0;
           else if(fdma_wirq == 1'b0) begin
                W_MS <= S_DATA1;
           end
       end
        S_DATA1:begin //发送写FDMA请求
          if(fdma_wbusy == 1'b0 && W_REQ )begin
             fdma_wareq_r  <= 1'b1; 
          end 
          else if(fdma_wbusy == 1'b1) begin
             fdma_wareq_r  <= 1'b0;
             W_MS    <= S_DATA2;
          end          
         end
        S_DATA2:begin //写有效数据
            if(fdma_wbusy == 1'b0)begin
                if(W_bcnt == WY_BURST_TIMES - 1'b1) //判断是否传输完毕
                    W_MS <= S_IDLE;
                else begin
                    if(wdiv_cnt < W_XDIV - 1'b1)begin//如果对XSIZE做了分次传输，一个XSIZE也需要XDIV次FDMA完成传输
                        W_addr <= W_addr +  WX_BURST_ADDR_INC;  //计算地址增量
                        wdiv_cnt <= wdiv_cnt + 1'b1;
                     end
                    else begin
                        W_addr <= W_addr + WX_LAST_ADDR_INC; //计算最后一次地址增量，最后一次地址根据stride 计算
                        wdiv_cnt <= 0;
                    end
                    W_bcnt <= W_bcnt + 1'b1;
                    W_MS    <= S_DATA1;
                end 
            end
         end
         default: W_MS <= S_IDLE; 
       endcase
    end
 end 

//写通道的数据FIFO，采用了原语调用xpm_fifo_async fifo，当FIFO存储的数据阈值达到一定量，一般满足一次FDMA的burst即可发出请求
wire W_rbusy;
always@(posedge ui_clk)     
     W_REQ  <= (W_rcnt > FDMA_WX_BURST - 2)&&(~W_rbusy); 
     
xpm_fifo_async # (
  .FIFO_MEMORY_TYPE          ("auto"),           //string; "auto", "block", or "distributed";
  .ECC_MODE                  ("no_ecc"),         //string; "no_ecc" or "en_ecc";
  .RELATED_CLOCKS            (0),                //positive integer; 0 or 1
  .FIFO_WRITE_DEPTH          (WFIFO_DEPTH),     //positive integer
  .WRITE_DATA_WIDTH          (AXI_DATA_WIDTH/4),               //positive integer
  .WR_DATA_COUNT_WIDTH       (W_WR_DATA_COUNT_WIDTH),               //positive integer
  .PROG_FULL_THRESH          (100),               //positive integer
  .FULL_RESET_VALUE          (0),                //positive integer; 0 or 1
  .USE_ADV_FEATURES          ("0707"),           //string; "0000" to "1F1F"; 
  .READ_MODE                 ("fwft"),            //string; "std" or "fwft";
  .FIFO_READ_LATENCY         (0),                //positive integer;
  .READ_DATA_WIDTH           (AXI_DATA_WIDTH),               //positive integer
  .RD_DATA_COUNT_WIDTH       (W_RD_DATA_COUNT_WIDTH),               //positive integer
  .PROG_EMPTY_THRESH         (10),               //positive integer
  .DOUT_RESET_VALUE          ("0"),              //string
  .CDC_SYNC_STAGES           (2),                //positive integer
  .WAKEUP_TIME               (0)                 //positive integer; 0 or 2;
) xpm_fifo_W_inst (
      .rst              ((ui_rstn == 1'b0) || (W_FIFO_Rst == 1'b1)),
      .wr_clk           (W_wclk_i),
      .wr_en            (W_wren_i),
      .din              (W_data_i),
      .full             (W_full),
      .overflow         (),
      .prog_full        (),
      .wr_data_count    (),
      .almost_full      (),
      .wr_ack           (),
      .wr_rst_busy      (),
      .rd_clk           (ui_clk),
      .rd_en            (fdma_wvalid),
      .dout             (fdma_wdata),
      .empty            (),
      .underflow        (),
      .rd_rst_busy      (W_rbusy),
      .prog_empty       (),
      .rd_data_count    (W_rcnt),
      .almost_empty     (),
      .data_valid       (W_dvalid),
      .sleep            (1'b0),
      .injectsbiterr    (1'b0),
      .injectdbiterr    (1'b0),
      .sbiterr          (),
      .dbiterr          ()

);
end
else begin : FDMA_WRITE_DISABLE

//----------fdma signals write-------       
assign fdma_waddr = 0;
assign fdma_wareq = 0;
assign fdma_wsize = 0;                                    
assign fdma_wdata = 0;
assign fdma_wready = 0;
assign fdma_wirq = 0; 
assign W_full = 0;

end
endgenerate

generate  if(ENABLE_READ == 1)begin : FDMA_READ// 通过设置通道使能，可以优化代码的利用率
localparam RYBUF_SIZE           = (R_BUFSIZE - 1'b1); //读通道需要完成多少次XSIZE操作
localparam RY_BURST_TIMES       = (R_YSIZE*R_XDIV); //读通道需要完成的FDMA burst 操作次数，XDIV用于把XSIZE分解多次传输
localparam FDMA_RX_BURST        = (R_XSIZE*R_DATAWIDTH/AXI_DATA_WIDTH)/R_XDIV; //FDMA BURST 一次的大小
localparam RX_BURST_ADDR_INC    = (R_XSIZE*(R_DATAWIDTH/8))/R_XDIV; //FDMA每次burst之后的地址增加
localparam RX_LAST_ADDR_INC     = (R_XSTRIDE-R_XSIZE)*(R_DATAWIDTH/8) + RX_BURST_ADDR_INC; //根据stride值计算出来最后一次地址

localparam RFIFO_DEPTH = R_BUFDEPTH*R_DATAWIDTH/AXI_DATA_WIDTH;//R_BUFDEPTH/(AXI_DATA_WIDTH/R_DATAWIDTH);
localparam R_WR_DATA_COUNT_WIDTH = clog2(RFIFO_DEPTH)+1; //读通道FIFO 输入部分深度
localparam R_RD_DATA_COUNT_WIDTH = clog2(RFIFO_DEPTH)+1; //写通道FIFO输出部分深度

assign                                  fdma_rready = 1'b1;
reg                                     fdma_rareq_r= 1'b0;
reg                                     R_FIFO_Rst=0; 
wire                                    R_FS;
reg [1 :0]                              R_MS=0; 
reg [R_DSIZEBITS-1'b1:0]                R_addr=0; 
reg [15:0]                              R_bcnt=0; 
wire[R_WR_DATA_COUNT_WIDTH-1'b1 :0]     R_wcnt;
reg                                     R_REQ=0; 
reg [5 :0]                              rirq_dly_cnt =0;
reg [3 :0]                              rdiv_cnt =0;
reg [7 :0]                              rrst_cnt =0;
reg [7 :0]                              fmda_rbufn;
assign fdma_rsize = FDMA_RX_BURST;
assign fdma_rirq = (rirq_dly_cnt>0);

assign fdma_raddr = R_BASEADDR + {fmda_rbufn,R_addr};//由于FPGA逻辑做乘法比较复杂，因此通过设置高位地址实现缓存设置

reg [1:0] R_MS_r =0;
always @(posedge ui_clk) R_MS_r <= R_MS;

//每次FDMA DBUF 完成一帧数据传输后，产生中断，这个中断持续60个周期的uiclk,这里的延迟必须足够ZYNQ IP核识别到这个中断
always @(posedge ui_clk) begin
    if(ui_rstn == 1'b0)begin
        rirq_dly_cnt <= 6'd0;
        fmda_rbuf <=0;
    end
    else if((R_MS_r == S_DATA2) && (R_MS == S_IDLE))begin
        rirq_dly_cnt <= 60;
        fmda_rbuf <= fmda_rbufn;
    end
    else if(rirq_dly_cnt >0)
        rirq_dly_cnt <= rirq_dly_cnt - 1'b1;
end

//帧同步，对于视频有效
fs_cap #
(
.VIDEO_ENABLE(VIDEO_ENABLE)
)
fs_cap_R0
(
  .clk_i(ui_clk),
  .rstn_i(ui_rstn),
  .vs_i(R_FS_i),
  .fs_cap_o(R_FS)
);

assign fdma_rareq = fdma_rareq_r;

//读通道状态机，采用4个状态值描述
 always @(posedge ui_clk) begin
   if(!ui_rstn)begin
        R_MS          <= S_IDLE;
        R_FIFO_Rst   <= 0;
        R_addr       <= 0;
        R_sync_cnt_o <= 0;
        R_bcnt       <= 0;
        rrst_cnt     <= 0;
        rdiv_cnt      <= 0;
        fmda_rbufn    <= 0;
        fdma_rareq_r  <= 1'd0;
    end   
    else begin
      case(R_MS) //帧同步，对于非视频数据一般常量为1
        S_IDLE:begin
          R_addr <= 0;
          R_bcnt <= 0;
          rrst_cnt <= 0;
          rdiv_cnt <=0;
          if(R_FS) begin
            R_MS <= S_RST;
            if(R_sync_cnt_o < RYBUF_SIZE) //输出帧同步计数器，当需要用读通道做帧同步的时候使用
                R_sync_cnt_o <= R_sync_cnt_o + 1'b1; 
            else 
                R_sync_cnt_o <= 0;  
          end
       end
       S_RST:begin//帧同步，对于非视频数据直接跳过,对于视频数据，会同步每一帧，并且复位数据FIFO
           fmda_rbufn <= R_buf_i;
           rrst_cnt <= rrst_cnt + 1'b1;
           if((VIDEO_ENABLE == 1) && (rrst_cnt < 40))
                R_FIFO_Rst <= 1;
           else if((VIDEO_ENABLE == 1) && (rrst_cnt < 100))
                R_FIFO_Rst <= 0;
           else if(fdma_rirq == 1'b0) begin
                R_MS <= S_DATA1;
           end
       end
       S_DATA1:begin 
         if(fdma_rbusy == 1'b0 && R_REQ)begin
            fdma_rareq_r  <= 1'b1;  
         end
         else if(fdma_rbusy == 1'b1) begin
            fdma_rareq_r  <= 1'b0;
            R_MS    <= S_DATA2;
         end         
        end
        S_DATA2:begin //写有效数据
            if(fdma_rbusy == 1'b0)begin
                if(R_bcnt == RY_BURST_TIMES - 1'b1) //判断是否传输完毕
                    R_MS <= S_IDLE;
                else begin
                    if(rdiv_cnt < R_XDIV - 1'b1)begin//如果对XSIZE做了分次传输，一个XSIZE也需要XDIV次FDMA完成传输
                        R_addr <= R_addr +  RX_BURST_ADDR_INC;  //计算地址增量
                        rdiv_cnt <= rdiv_cnt + 1'b1;
                     end
                    else begin
                        R_addr <= R_addr + RX_LAST_ADDR_INC; //计算最后一次地址增量，最后一次地址根据stride 计算
                        rdiv_cnt <= 0;
                    end
                    R_bcnt <= R_bcnt + 1'b1;
                    R_MS    <= S_DATA1;
                end 
            end
         end
         default:R_MS <= S_IDLE;
      endcase
   end
end 

//读通道的数据FIFO，采用了原语调用xpm_fifo_async fifo，当FIFO存储可以存储的空间，一般满足一次FDMA的burst，即可发出读请求
wire R_wbusy;
always@(posedge ui_clk)      
     R_REQ  <= (R_wcnt < FDMA_RX_BURST - 2)&&(~R_wbusy);
wire [9:0]R_rcnt;
assign R_rdy_o = (R_wcnt > FDMA_RX_BURST - 10) && (~R_FIFO_Rst);  

xpm_fifo_async # (
  .FIFO_MEMORY_TYPE          ("auto"),           //string; "auto", "block", or "distributed";
  .ECC_MODE                  ("no_ecc"),         //string; "no_ecc" or "en_ecc";
  .RELATED_CLOCKS            (0),                //positive integer; 0 or 1
  .FIFO_WRITE_DEPTH          (RFIFO_DEPTH),     //positive integer
  .WRITE_DATA_WIDTH          (AXI_DATA_WIDTH),               //positive integer
  .WR_DATA_COUNT_WIDTH       (R_WR_DATA_COUNT_WIDTH),               //positive integer
  .PROG_FULL_THRESH          (20),               //positive integer
  .FULL_RESET_VALUE          (0),                //positive integer; 0 or 1
  .USE_ADV_FEATURES          ("0707"),           //string; "0000" to "1F1F"; 
  .READ_MODE                 ("fwft"),            //string; "std" or "fwft";
  .FIFO_READ_LATENCY         (0),                //positive integer;
  .READ_DATA_WIDTH           (AXI_DATA_WIDTH),               //positive integer
  .RD_DATA_COUNT_WIDTH       (R_RD_DATA_COUNT_WIDTH),               //positive integer
  .PROG_EMPTY_THRESH         (10),               //positive integer
  .DOUT_RESET_VALUE          ("0"),              //string
  .CDC_SYNC_STAGES           (2),                //positive integer
  .WAKEUP_TIME               (0)                 //positive integer; 0 or 2;
) xpm_fifo_R_inst (
      .rst              ((ui_rstn == 1'b0) || (W_FIFO_Rst == 1'b1)),
      .wr_clk           (ui_clk),
      .wr_en            (fdma_rvalid),
      .din              (fdma_rdata),
      .full             (),
      .overflow         (),
      .prog_full        (),
      .wr_data_count    (R_wcnt),
      .almost_full      (),
      .wr_ack           (),
      .wr_rst_busy      (R_wbusy),
      .rd_clk           (R_rclk_i),
      .rd_en            (R_rden_i),
      .dout             (R_data_o),
      .empty            (R_empty),
      .underflow        (),
      .rd_rst_busy      (),
      .prog_empty       (),
      .rd_data_count    (),
      .almost_empty     (),
      .data_valid       (),
      .sleep            (1'b0),
      .injectsbiterr    (1'b0),
      .injectdbiterr    (1'b0),
      .sbiterr          (),
      .dbiterr          ()

);
end
else begin : FDMA_READ_DISABLE
   
assign fdma_raddr = 0;
assign fdma_rareq = 0;
assign fdma_rsize = 0;                                    
assign fdma_rdata = 0;
assign fdma_rready = 0;
assign fdma_rirq = 0; 
assign R_empty   = 1'b0;

end
endgenerate

endmodule

