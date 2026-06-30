`timescale 1ns / 1ps
/*
Company : Liyang Milian Electronic Technology Co., Ltd.
Brand: ������(msxbo)
Technical forum:uisrc.com
taobao: osrc.taobao.com
Create Date: 2019/12/17
Module Name: master_ch
Description: 
Copyright: Copyright (c) msxbo
Revision: 1.0
Signal description:
1) _i input
2) _o output
3) _n activ low
4) _dg debug signal 
5) _r delay or register
6) _s state mechine
*/
//////////////////////////////////////////////////////////////////////////////////


module master_ch(
output [13:0]       DDR3_addr,
output [2 :0]       DDR3_ba,
output              DDR3_cas_n,
output [0 :0]       DDR3_ck_n,
output [0 :0]       DDR3_ck_p,
output [0 :0]       DDR3_cke,
output [0 :0]       DDR3_cs_n,
output [1 :0]       DDR3_dm,
inout  [15:0]       DDR3_dq,
inout  [1 :0]       DDR3_dqs_n,
inout  [1 :0]       DDR3_dqs_p,
output [0 :0]       DDR3_odt,
output              DDR3_ras_n,
output              DDR3_reset_n,
output              DDR3_we_n,
//output [0:0]        power_en,
output              cam_scl,
inout               cam_sda,
output              cam_xclk_o,
input  [7:0]        cam_data_i,
input               cam_href_i,
input               cam_pclk_i,
input               cam_vsync_i,

input               clk_15_625,
input               clk_200,
input               clk_125,  
input               reset,

input          	    dcm_locked,
input [3:0]         rgmii_rxd,
input               rgmii_rx_ctl,
input               rgmii_rxc,
    
output wire[3:0]   rgmii_txd,
output wire        rgmii_tx_ctl,
output wire        rgmii_txc
);



wire            udp_tx_ready;
wire            app_tx_ack;
reg [64:0]      app_tx_data;
reg             app_tx_data_req;
reg             app_tx_data_valid;
reg             app_tx_data_last;
reg [7 :0]      app_tx_header_cnt;
reg [11:0]      app_tx_data_cnt;
wire            dst_ip_unreachable;
wire            core_reset;    

reg [2 :0]     UDP_MS           = 3'd0;
localparam      S_SYNC_1        = 3'd0;
localparam      S_SYNC_2        = 3'd1;
localparam      S_SYNC_3        = 3'd2;
localparam      S_UDP_WAIT      = 3'd3;
localparam      S_UDP_ACK       = 3'd4;
localparam      S_IMG_HEADER    = 3'd5;
localparam      S_IMG_DATA      = 3'd6;
localparam      S_IMG_END       = 3'd7;

localparam       IMG_HEADER     = 32'hAA0055FF;
localparam       IMG_WIDTH       = 32'd640; 
localparam       IMG_HEIGHT      = 32'd480; 
localparam       IMG_TOTAL       = IMG_WIDTH*IMG_HEIGHT*3;
localparam       IMG_FRAMSIZE    = 32'd640;
localparam       IMG_FRAMTOTAL   = IMG_HEIGHT*3;
localparam       IMG_HEADER_LEN  = 6'd32;//4��64bit
reg  [31 :0]    IMG_FRAMSEQ;
reg  [31 :0]    IMG_PICSEQ; 
wire [31 :0]    IMG_OFFSET      = (IMG_FRAMSEQ-1'b1) * IMG_FRAMSIZE;
wire [255:0]    STHEADER_X86    = {IMG_FRAMSIZE,IMG_FRAMSEQ,IMG_PICSEQ,IMG_OFFSET,IMG_TOTAL,IMG_HEIGHT,IMG_WIDTH,IMG_HEADER};
                                   
wire [0 :0]     ui_rstn;
wire            ui_clk;
wire            fdma_rstn;
wire            R0_rclk_i = clk_15_625;
wire [127:0]    R0_data_o;
reg  [127:0]    R0_data_r;
wire            R0_rdy_o;
wire            R0_rden_i;
reg             R0_FS_i;
reg  [1 :0]     R0_INDEX;



always@(posedge clk_15_625 or posedge core_reset)begin
    if(core_reset) begin
        app_tx_data <= 64'd0;
        R0_data_r   <= 128'd0;
    end
    else begin
        if(UDP_MS == S_UDP_ACK || UDP_MS == S_IMG_HEADER)begin
            app_tx_data <= STHEADER_X86[app_tx_header_cnt*8 +: 64];
        end
        else if(UDP_MS == S_IMG_DATA)begin
            R0_data_r <= R0_data_o;
            case(R0_INDEX)
            0:begin app_tx_data <={R0_data_o[47 : 40],R0_data_o[55 : 48],R0_data_o[71 : 64],R0_data_o[79 : 72],R0_data_o[87 : 80],R0_data_o[103: 96],R0_data_o[111:104],R0_data_o[119:112]};end
            1:begin app_tx_data <={R0_data_o[87 : 80],R0_data_o[103: 96],R0_data_o[111:104],R0_data_o[119:112],R0_data_r[7  :  0],R0_data_r[15 : 8 ],R0_data_r[23 : 16],R0_data_r[39 : 32]};end
            2:begin app_tx_data <={R0_data_r[7  :  0],R0_data_r[15 : 8 ],R0_data_r[23 : 16],R0_data_r[39 : 32],R0_data_r[47 : 40],R0_data_r[55 : 48],R0_data_r[71 : 64],R0_data_r[79 : 72]};end
            default:begin app_tx_data <= app_tx_data; end
            endcase
        end
        else begin
            app_tx_data <= app_tx_data;
        end
    end
end



reg  [11:0] vstout_cnt;
wire [15:0] PACKET_INTERVAL;
reg  [15:0] delay_cnt;

always@(posedge clk_15_625 or posedge core_reset)
begin
    if(core_reset) begin
        delay_cnt <= 16'd0;
    end
    else begin
        if(delay_cnt < PACKET_INTERVAL)
            delay_cnt <= delay_cnt + 1'b1;
        else 
            delay_cnt <= 16'd0;
    end
end

wire pkg_tx_en = (delay_cnt == PACKET_INTERVAL);
vio_0 vio_debug(.clk(clk_15_625),.probe_out0(PACKET_INTERVAL));

assign R0_rden_i = (R0_INDEX == 2'd0 || R0_INDEX == 2'd2)&& (UDP_MS == S_IMG_DATA );

always@(posedge clk_15_625 or posedge core_reset)
begin
    if(core_reset) begin
       app_tx_data_valid <= 1'b0;
       app_tx_header_cnt <= 8'd0;
       app_tx_data_cnt   <= 12'd0;
       app_tx_data_last  <= 1'b0; 
       R0_FS_i           <= 1'b0; 
       IMG_PICSEQ        <= 32'd0;
       IMG_FRAMSEQ       <= 32'd0;
       vstout_cnt        <= 12'd0;
       UDP_MS            <= S_SYNC_1;
    end
    else begin
       case(UDP_MS)
       S_SYNC_1:begin
         vstout_cnt  <= 12'd0;
         R0_INDEX    <= 2'd0;
         R0_FS_i     <= 1'b0;
         IMG_FRAMSEQ <= 32'd0;
         IMG_PICSEQ  <= IMG_PICSEQ + 1'b1;
         UDP_MS      <= S_SYNC_2;
       end
       S_SYNC_2:begin
         UDP_MS      <= S_SYNC_3;
       end
       S_SYNC_3:begin
         R0_FS_i     <= 1'b1;
         vstout_cnt <= vstout_cnt + 1'b1;
         if(R0_rdy_o)begin
            UDP_MS      <= S_UDP_WAIT;
         end
         else if(vstout_cnt[11])
            UDP_MS <= S_SYNC_1;
       end
       S_UDP_WAIT:begin
          app_tx_header_cnt <= 8'd0;
          app_tx_data_cnt   <= 12'd0; 
          if(udp_tx_ready&&pkg_tx_en) begin
              app_tx_data_req <= 1'b1;UDP_MS <= S_UDP_ACK;
           end
           else begin
               app_tx_data_req <= 1'b0;UDP_MS <= S_UDP_WAIT;
           end
       end
       
       S_UDP_ACK:begin
          if(app_tx_ack) begin
               app_tx_data_req     <= 1'b0;
               app_tx_data_valid   <= 1'b1;
               app_tx_header_cnt   <= app_tx_header_cnt + 8;
               IMG_FRAMSEQ         <= IMG_FRAMSEQ + 1'b1;
               UDP_MS <= S_IMG_HEADER;
           end
           else if(dst_ip_unreachable) begin
               app_tx_data_req   <= 1'b0;app_tx_data_valid <= 1'b0;UDP_MS <= S_SYNC_1;
           end
           else begin
               app_tx_data_req   <= 1'b1;app_tx_data_valid <= 1'b0;UDP_MS <= S_UDP_ACK;
            end
         end
         
         S_IMG_HEADER:begin
            app_tx_data_valid   <= 1'b1;
            app_tx_header_cnt   <= app_tx_header_cnt + 8;
            if((app_tx_header_cnt + 8) >= IMG_HEADER_LEN )  
                 UDP_MS <= S_IMG_DATA; 
            else UDP_MS <= S_IMG_HEADER;
         end
         
         S_IMG_DATA:begin
            app_tx_data_valid <= 1'b1;
            app_tx_data_cnt   <= app_tx_data_cnt + 8;
            if(R0_INDEX[1:0] == 2'd2) 
                R0_INDEX[1:0] <= 2'd0;
             else
                R0_INDEX[1:0] <= R0_INDEX[1:0]  + 1'b1;
            if((app_tx_data_cnt + 8) >= IMG_FRAMSIZE) begin        
                app_tx_data_last <= 1'b1; UDP_MS <= S_IMG_END;
            end     
            else UDP_MS <= S_IMG_DATA;            
         end
         
         S_IMG_END:begin
            app_tx_data_valid <= 1'b0;
            app_tx_data_last  <= 1'b0;      
            if(IMG_FRAMSEQ >= IMG_FRAMTOTAL)begin 
                  UDP_MS <= S_SYNC_1;
            end
            else begin
                UDP_MS  <= S_UDP_WAIT; 
            end
          end
          default: UDP_MS <= S_SYNC_1;
        endcase
    end
end      
wire [14:0]     DDR_addr;
wire [2:0]      DDR_ba;
wire            DDR_cas_n;
wire            DDR_ck_n;
wire            DDR_ck_p;
wire            DDR_cke;
wire            DDR_cs_n;
wire [3:0]      DDR_dm;
wire [31:0]     DDR_dq;
wire [3:0]      DDR_dqs_n;
wire [3:0]      DDR_dqs_p;
wire            DDR_odt;
wire            DDR_ras_n;
wire            DDR_reset_n;
wire            DDR_we_n;
wire            FIXED_IO_ddr_vrn;
wire            FIXED_IO_ddr_vrp;
wire [53:0]     FIXED_IO_mio;
wire            FIXED_IO_ps_clk;
wire            FIXED_IO_ps_porb;
wire            FIXED_IO_ps_srstb;
  
wire            cam_de_o;
wire            cam_vs_o;
wire [23 :0]    cam_rgb_o;

wire     [31 :0] fdma_waddr;
wire             fdma_wareq;
wire     [15 :0] fdma_wsize;                                     
wire             fdma_wbusy;		
wire     [127:0] fdma_wdata;
wire             fdma_wvalid;
wire             fdma_wready;

wire     [31: 0] fdma_raddr;
wire             fdma_rareq;
wire     [15: 0] fdma_rsize;                                    
wire             fdma_rbusy;			
wire     [127:0] fdma_rdata;
wire             fdma_rvalid;
wire             fdma_rready;



wire[127:0] R0_data;
assign R0_data_o = {R0_data[31:0], R0_data[63:32],R0_data[95:64],R0_data[127:96]};

uidbuf # (
.VIDEO_ENABLE     ( 1	),   
.ENABLE_WRITE     ( 1	),   
.ENABLE_READ      ( 1	),   

.AXI_DATA_WIDTH   ( 128	), 
.AXI_ADDR_WIDTH   ( 32	),  

.W_BUFDEPTH       ( 2048),
.W_DATAWIDTH      ( 32	), 
.W_BASEADDR       (32'h0100_0000),  
.W_DSIZEBITS      ( 24	),  
.W_XSIZE          ( 640),
.W_XSTRIDE        ( 640),
.W_YSIZE          ( 480 ),
.W_XDIV           ( 2	),   
.W_BUFSIZE        ( 3	),   

.R_BUFDEPTH       ( 2048),
.R_DATAWIDTH      ( 32	),  
.R_BASEADDR       (32'h0100_0000),  
.R_DSIZEBITS      ( 24	),  
.R_XSIZE          ( 640),
.R_XSTRIDE        ( 640),
.R_YSIZE          ( 480 ),
.R_XDIV           ( 2	),   
.R_BUFSIZE        ( 3   ) 
)uidbuf_u0
(
.ui_clk         (ui_clk),
.ui_rstn        (fdma_rstn),

.W_FS_i        (cam_vs_o),
.W_wclk_i      (cam_pclk_i),
.W_wren_i      (cam_de_o),
.W_data_i      (cam_rgb_o),
.W_sync_cnt_o  (bufn_i),
.W_buf_i       (bufn_i),

.R_FS_i        (R0_FS_i),
.R_rclk_i      (R0_rclk_i),
.R_rden_i      (R0_rden_i),
.R_data_o      (R0_data),	
.R_sync_cnt_o  (),
.R_buf_i       (bufn_o),
.R_rdy_o       (R0_rdy_o),


.fdma_waddr     (fdma_waddr)  ,
.fdma_wareq     (fdma_wareq)  ,
.fdma_wsize     (fdma_wsize)  ,                                     
.fdma_wbusy     (fdma_wbusy)  ,			
.fdma_wdata     (fdma_wdata)  ,
.fdma_wvalid    (fdma_wvalid),
.fdma_wready    (fdma_wready),
.fmda_wbuf      (),
.fdma_wirq      (),
.fdma_raddr     (fdma_raddr),
.fdma_rareq     (fdma_rareq),
.fdma_rsize     (fdma_rsize),
.fdma_rbusy     (fdma_rbusy),
.fdma_rdata     (fdma_rdata),
.fdma_rvalid    (fdma_rvalid),
.fdma_rready    (fdma_rready),
.fmda_rbuf      (),
.fdma_rirq      ()
 );
uisetvbuf_0 uisetvbuf_0 (
  .bufn_i(bufn_i),  // input wire [3 : 0] bufn_i
  .bufn_o(bufn_o)  // output wire [3 : 0] bufn_o
);
system_1 system_1
(
.DDR3_addr(DDR3_addr),
.DDR3_ba(DDR3_ba),
.DDR3_cas_n(DDR3_cas_n),
.DDR3_ck_n(DDR3_ck_n),
.DDR3_ck_p(DDR3_ck_p),
.DDR3_cke(DDR3_cke),
.DDR3_cs_n(DDR3_cs_n),
.DDR3_dm(DDR3_dm),
.DDR3_dq(DDR3_dq),
.DDR3_dqs_n(DDR3_dqs_n),
.DDR3_dqs_p(DDR3_dqs_p),
.DDR3_odt(DDR3_odt),
.DDR3_ras_n(DDR3_ras_n),
.DDR3_reset_n(DDR3_reset_n),
.DDR3_we_n(DDR3_we_n),
       
.FDMA_S_0_fdma_raddr    (fdma_raddr),
.FDMA_S_0_fdma_rareq    (fdma_rareq),
.FDMA_S_0_fdma_rbusy    (fdma_rbusy),
.FDMA_S_0_fdma_rdata    (fdma_rdata),
.FDMA_S_0_fdma_rready   (fdma_rready),
.FDMA_S_0_fdma_rsize    (fdma_rsize),
.FDMA_S_0_fdma_rvalid   (fdma_rvalid),
.FDMA_S_0_fdma_waddr    (fdma_waddr),
.FDMA_S_0_fdma_wareq    (fdma_wareq),
.FDMA_S_0_fdma_wbusy    (fdma_wbusy),
.FDMA_S_0_fdma_wdata    (fdma_wdata),
.FDMA_S_0_fdma_wready   (fdma_wready),
.FDMA_S_0_fdma_wsize    (fdma_wsize),
.FDMA_S_0_fdma_wvalid   (fdma_wvalid),

.cam_scl                (cam_scl),
.cam_sda                (cam_sda),
.cam_xclk_o             (cam_xclk_o),  
.cam_pclk_i             (cam_pclk_i),
.cam_vsync_i            (cam_vsync_i),
.cam_href_i             (cam_href_i),
.cam_data_i             (cam_data_i),
.cam_de_o               (cam_de_o),
.cam_vs_o               (cam_vs_o),
.cam_rgb_o              (cam_rgb_o),
.fdma_rstn              (fdma_rstn), 
.sysclk_i               (clk_125),
.ui_clk                 (ui_clk)
);

 master_wrapper master_wrapper_inst
(
.LOCAL_PORT_NUM      (16'd8002),
.LOCAL_IP_ADDRESS    (32'hc0a88902),
.LOCAL_MAC_ADDRESS   (48'h000a35000102),
.DST_PORT_NUM        (16'd8001),
.DST_IP_ADDRESS      (32'hc0a88901),
.ICMP_EN             (1'b1),
.ARP_REPLY_EN        (1'b1),
.ARP_REQUEST_EN      (1'b1),
.ARP_TIMEOUT_VALUE   (30'd20_000_000),
.ARP_RETRY_NUM       (4'd2),

.reset               (reset),
.dcm_locked          (dcm_locked),
.refclk              (clk_200),
.udp_core_clk        (clk_15_625),
.gtx_clk             (clk_125),
.core_reset          (core_reset),
.gtx_clk_out         (),
.gtx_clk90_out       (),

.udp_tx_ready        (udp_tx_ready),
.app_tx_ack          (app_tx_ack),
		
.app_tx_request      (app_tx_data_req),
.app_tx_data_valid   (app_tx_data_valid),
.app_tx_data         (app_tx_data),
.app_tx_data_keep    (8'hff),
.app_tx_data_last    (app_tx_data_last),
.app_tx_data_length  (12'd672),	
.dst_ip_unreachable  (dst_ip_unreachable),		
.app_rx_data_valid   (),
.app_rx_data         (),
.app_rx_data_keep    (),
.app_rx_data_last    (),
.app_rx_data_length  (),
.app_rx_port_num     (),
.udp_rx_error        (),

.rgmii_rxd           (rgmii_rxd),
.rgmii_rx_ctl        (rgmii_rx_ctl),
.rgmii_rxc           (rgmii_rxc),
    
.rgmii_txd           (rgmii_txd),
.rgmii_tx_ctl        (rgmii_tx_ctl),
.rgmii_txc           (rgmii_txc)
                                   
);
    
endmodule
