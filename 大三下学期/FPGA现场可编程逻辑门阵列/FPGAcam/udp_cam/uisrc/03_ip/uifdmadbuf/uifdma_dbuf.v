
/*******************************MILIANKE*******************************
*Company : MiLianKe Electronic Technology Co., Ltd.
*WebSite:https://www.milianke.com
*TechWeb:https://www.uisrc.com
*tmall-shop:https://milianke.tmall.com
*jd-shop:https://milianke.jd.com
*taobao-shop: https://milianke.taobao.com
*Create Date: 2022/09/25
*Module Name:
*File Name:
*Description: 
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
--3.通过AXI-LITE接口，可以用于中断的标识位读取，以及清除
*********************************************************************/

`timescale 1ns / 1ns//仿真时间刻度/精度


module uifdma_dbuf#(
parameter  integer                          AXI_Lite       = 1,    //是否使能AXI-LITE接口
parameter  integer                          VIDEO_ENABLE   = 1,    //使能视频帧支持功能
parameter  integer                          ENABLE_WRITE   = 1,    //使能写通道 
parameter  integer                          ENABLE_READ    = 1,    //使能读通道

parameter  integer                          AXI_DATA_WIDTH = 128,  //AXI总线数据位宽
parameter  integer                          AXI_ADDR_WIDTH = 32,   //AXI总线地址位宽

parameter  integer                          W_BUFDEPTH     = 2048, //写通道AXI设置FIFO缓存大小
parameter  integer                          W_DATAWIDTH    = 32,   //写通道AXI设置数据位宽大小
parameter  [AXI_ADDR_WIDTH -1'b1: 0]        W_BASEADDR     = 0,    //写通道设置内存起始地址
parameter  integer                          W_DSIZEBITS    = 24,   //写通道设置缓存数据的增量地址大小，用于FDMA DBUF 计算帧缓存起始地址
parameter  integer                          W_XSIZE        = 1920, //写通道设置X方向的数据大小，代表了每次FDMA 传输的数据长度
parameter  integer                          W_XSTRIDE      = 1920, //写通道设置X方向的Stride值，主要用于图形缓存应用
parameter  integer                          W_YSIZE        = 1080, //写通道设置Y方向值，代表了进行了多少次XSIZE传输
parameter  integer                          W_XDIV         = 2,    //写通道对X方向数据拆分为XDIV次传输，减少FIFO的使用
parameter  integer                          W_BUFSIZE      = 3,    //写通道设置帧缓存大小，目前最大支持128帧，可以修改参数支持更缓存数

parameter  integer                          R_BUFDEPTH     = 2048, //读通道AXI设置FIFO缓存大小
parameter  integer                          R_DATAWIDTH    = 32,   //读通道AXI设置数据位宽大小
parameter  [AXI_ADDR_WIDTH -1'b1: 0]        R_BASEADDR     = 0,    //读通道设置内存起始地址
parameter  integer                          R_DSIZEBITS    = 24,   //读通道设置缓存数据的增量地址大小，用于FDMA DBUF 计算帧缓存起始地址
parameter  integer                          R_XSIZE        = 1920, //读通道设置X方向的数据大小，代表了每次FDMA 传输的数据长度
parameter  integer                          R_XSTRIDE      = 1920, //读通道设置X方向的Stride值，主要用于图形缓存应用
parameter  integer                          R_YSIZE        = 1080, //读通道设置Y方向值，代表了进行了多少次XSIZE传输
parameter  integer                          R_XDIV         = 2,    //读通道对X方向数据拆分为XDIV次传输，减少FIFO的使用
parameter  integer                          R_BUFSIZE      = 3     //读通道设置帧缓存大小，目前最大支持128帧，可以修改参数支持更缓存数
)
(
//AXI-LITE接口总线信号，AXI_Lite  = 1,  改接口才有效
input  wire                                 S_AXI_ACLK,
input  wire                                 S_AXI_ARESETN,
input  wire  [3 : 0]                        S_AXI_AWADDR,
input  wire  [2 : 0]                        S_AXI_AWPROT,
input  wire                                 S_AXI_AWVALID,
output wire                                 S_AXI_AWREADY,
input  wire  [31: 0]                        S_AXI_WDATA,  
input  wire  [3 : 0]                        S_AXI_WSTRB,
input  wire                                 S_AXI_WVALID,
output wire                                 S_AXI_WREADY,
output wire  [1 : 0]                        S_AXI_BRESP,
output wire                                 S_AXI_BVALID,
input  wire                                 S_AXI_BREADY,
input  wire  [3 : 0]                        S_AXI_ARADDR,
input  wire  [2 : 0]                        S_AXI_ARPROT,
input  wire                                 S_AXI_ARVALID,
output wire                                 S_AXI_ARREADY,
output wire  [31: 0]                        S_AXI_RDATA,
output wire  [1 : 0]                        S_AXI_RRESP,
output wire                                 S_AXI_RVALID,
input  wire                                 S_AXI_RREADY,

input  wire                                 ud_wclk,  //用户写数据接口时钟
input  wire                                 ud_wvs,   //用户写数据接口同步信号，对于非视频帧一般设置为1
input  wire                                 ud_wde,   //用户写数据使能
input  wire [W_DATAWIDTH - 1'b1: 0]         ud_wdata, //用户写数据
output wire [7 : 0]                         wbuf_sync_o,//写通道BUF帧同步输出
input  wire [7 : 0]                         wbuf_sync_i,//写通道BUF帧同步输入
output wire                                 ud_wfull,   //写通道BUF FIFO满信号

input  wire                                 ud_rclk,  //用户读数据接口时钟
input  wire                                 ud_rvs,   //用户读数据接口同步信号，对于非视频帧一般设置1
input  wire                                 ud_rde,   //用户读数据使能
output wire [R_DATAWIDTH - 1'b1: 0]         ud_rdata, //用户读数据
output wire [7 : 0]                         rbuf_sync_o, //读通道BUF帧同步输出
input  wire [7 : 0]                         rbuf_sync_i, //写通道BUF帧同步输入
output wire                                 ud_rempty,   //读通道BUF FIFO空信号
//----------fdma signals write-------       
output wire [AXI_ADDR_WIDTH-1'b1: 0]        fdma_waddr,  //FDMA写通道地址
output wire                                 fdma_wareq,  //FDMA写通道请求
output wire [15: 0]                         fdma_wsize,  //FDMA写通道一次FDMA的传输大小                                    
input  wire                                 fdma_wbusy,	 //FDMA处于BUSY状态，AXI总线正在写操作 	
output wire [AXI_DATA_WIDTH-1'b1:0]         fdma_wdata,  //FDMA写数据
input  wire                                 fdma_wvalid, //FDMA 写有效
output wire                                 fdma_wready, //FDMA写准备好，用户可以写数据
output wire [7 : 0]                         fdma_wbuf,   //FDMA的写帧缓存号输出
output wire                                 fdma_wirq,   //FDMA一次写完成的数据传输完成后，产生中断  		
//----------fdma signals read-------  
output wire [AXI_ADDR_WIDTH-1'b1: 0]        fdma_raddr,  //FDMA读通道地址
output wire                                 fdma_rareq,  //FDMA读通道请求
output wire [15: 0]                         fdma_rsize,  //FDMA读通道一次FDMA的传输大小                                    
input  wire                                 fdma_rbusy,	 //FDMA处于BUSY状态，AXI总线正在读操作 		
input  wire [AXI_DATA_WIDTH-1'b1:0]         fdma_rdata,  //FDMA读数据
input  wire                                 fdma_rvalid, //FDMA读有效
output wire                                 fdma_rready	,//FDMA读准备好，用户可以写数据
output wire [7 : 0]                         fdma_rbuf,   //FDMA的读帧缓存号输出
output wire                                 fdma_rirq	 //FDMA一次读完成的数据传输完成后，产生中断
);

//例化uidbuf 控制器
uidbuf # (
.VIDEO_ENABLE(VIDEO_ENABLE),  
.ENABLE_WRITE(ENABLE_WRITE), 
.ENABLE_READ(ENABLE_READ), 
.AXI_DATA_WIDTH(AXI_DATA_WIDTH),
.AXI_ADDR_WIDTH(AXI_ADDR_WIDTH),

.W_BUFDEPTH(W_BUFDEPTH),
.W_DATAWIDTH(W_DATAWIDTH),
.W_BASEADDR(W_BASEADDR),
.W_DSIZEBITS(W_DSIZEBITS),
.W_XSIZE(W_XSIZE),
.W_XSTRIDE(W_XSTRIDE),
.W_YSIZE(W_YSIZE),
.W_XDIV(W_XDIV),
.W_BUFSIZE(W_BUFSIZE),

.R_BUFDEPTH(R_BUFDEPTH),
.R_DATAWIDTH(R_DATAWIDTH),
.R_BASEADDR(R_BASEADDR),
.R_DSIZEBITS(R_DSIZEBITS),
.R_XSIZE(R_XSIZE),
.R_XSTRIDE(R_XSTRIDE),
.R_YSIZE(R_YSIZE),
.R_XDIV(R_XDIV),
.R_BUFSIZE(R_BUFSIZE)
)uidbuf_u0
(
.ui_clk(S_AXI_ACLK),
.ui_rstn(S_AXI_ARESETN),

.W_FS_i(ud_wvs),
.W_wclk_i(ud_wclk),
.W_wren_i(ud_wde),
.W_data_i(ud_wdata), 
.W_sync_cnt_o(wbuf_sync_o),
.W_buf_i(wbuf_sync_i),
.W_full(ud_wfull),

.R_FS_i(ud_rvs),
.R_rclk_i(ud_rclk),
.R_rden_i(ud_rde),
.R_data_o(ud_rdata),
.R_sync_cnt_o(rbuf_sync_o),
.R_buf_i(rbuf_sync_i),
.R_empty(ud_rempty),
       
.fdma_waddr(fdma_waddr)  ,
.fdma_wareq(fdma_wareq)  ,
.fdma_wsize(fdma_wsize)  ,                                     
.fdma_wbusy(fdma_wbusy)  ,			
.fdma_wdata(fdma_wdata)	 ,
.fdma_wvalid(fdma_wvalid),
.fdma_wready(fdma_wready),
.fdma_raddr(fdma_raddr)  ,
.fdma_rareq(fdma_rareq)  ,
.fdma_rsize(fdma_rsize)  ,                                     
.fdma_rbusy(fdma_rbusy)  ,			
.fdma_rdata(fdma_rdata)	 ,
.fdma_rvalid(fdma_rvalid),
.fdma_rready(fdma_rready),
.fmda_wbuf  (fdma_wbuf),	
.fdma_wirq  (fdma_wirq),		
.fmda_rbuf  (fdma_rbuf),	
.fdma_rirq  (fdma_rirq)
 ); 

//例化uidbufirq 中断控制器
uidbufirq uidbufirq_inst(
.S_AXI_ACLK     (S_AXI_ACLK),
.S_AXI_ARESETN  (S_AXI_ARESETN),
.S_AXI_AWADDR   (S_AXI_AWADDR),
.S_AXI_AWPROT   (S_AXI_AWPROT),
.S_AXI_AWVALID  (S_AXI_AWVALID),
.S_AXI_AWREADY  (S_AXI_AWREADY),
.S_AXI_WDATA    (S_AXI_WDATA),  
.S_AXI_WSTRB    (S_AXI_WSTRB),
.S_AXI_WVALID   (S_AXI_WVALID),
.S_AXI_WREADY   (S_AXI_WREADY),
.S_AXI_BRESP    (S_AXI_BRESP),
.S_AXI_BVALID   (S_AXI_BVALID),
.S_AXI_BREADY   (S_AXI_BREADY),
.S_AXI_ARADDR   (S_AXI_ARADDR),
.S_AXI_ARPROT   (S_AXI_ARPROT),
.S_AXI_ARVALID  (S_AXI_ARVALID),
.S_AXI_ARREADY  (S_AXI_ARREADY),
.S_AXI_RDATA    (S_AXI_RDATA),
.S_AXI_RRESP    (S_AXI_RRESP),
.S_AXI_RVALID   (S_AXI_RVALID),
.S_AXI_RREADY   (S_AXI_RREADY),	
.fdma_wbuf      (fdma_wbuf),	
.fdma_wirq      (fdma_wirq),
.fdma_rbuf      (fdma_rbuf),
.fdma_rirq      (fdma_rirq)
);   
    
endmodule
