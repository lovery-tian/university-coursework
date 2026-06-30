/*******************************MILIANKE*******************************
*Company : MiLianKe Electronic Technology Co., Ltd.
*WebSite:https://www.milianke.com
*TechWeb:https://www.uisrc.com
*tmall-shop:https://milianke.tmall.com
*jd-shop:https://milianke.jd.com
*taobao-shop1: https://milianke.taobao.com
*Create Date: 2019/12/17
*Module Name:udp_loop_back
*File Name:udp_loop_back.v
*Description: 
*The reference demo provided by Milianke is only used for learning. 
*We cannot ensure that the demo itself is free of bugs, so users 
*should be responsible for the technical problems and consequences
*caused by the use of their own products.
*Copyright: Copyright (c) MiLianKe
*All rights reserved.
*Revision: 1.0
*Signal description
*1) _i input
*2) _o output
*3) _n activ low
*4) _dg debug signal 
*5) _r delay or register
*6) _s state mechine
*********************************************************************/
`timescale 1ns / 1ps

module udp_camera
(	
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
output         cam_scl,
inout          cam_sda,
output         cam_xclk_o,
input  [7:0]   cam_data_i,
input          cam_href_i,
input          cam_pclk_i,
input          cam_vsync_i,
input          sys_clk_i,
output         phy_rst_o,
//PHYA        
input [3:0]    PHYA_rgmii_rxd,
input          PHYA_rgmii_rx_ctl,
input          PHYA_rgmii_rxc,
output[3:0]    PHYA_rgmii_txd,
output         PHYA_rgmii_tx_ctl,
output         PHYA_rgmii_txc				                    									   
);

wire      reset;
wire      locked;

reg [15:0] delay_cnt;
wire     clk_15_625;
wire     clk_200;
wire     clk_125;
wire     clk_25;

assign  phy_rst_o = (delay_cnt == 10'd100)? 1'b1 : 1'b0;

always @(posedge clk_25) begin
   if(!locked) 
         delay_cnt <= 10'd0;
   else begin
		 if(delay_cnt == 10'd100)
			delay_cnt <= delay_cnt;
		 else
		    delay_cnt <= delay_cnt + 1'b1;
   end
end


clk_wiz_0 clk_wiz_0(
.clk_in1      (sys_clk_i),   
.clk_out1     (clk_15_625),
.clk_out2     (clk_200),
.clk_out3     (clk_125),
.clk_out4     (clk_25),							  
.locked       (locked)
); 
	
master_ch  cha_inst
(
.DDR3_addr    (DDR3_addr),
.DDR3_ba      (DDR3_ba),
.DDR3_cas_n   (DDR3_cas_n),
.DDR3_ck_n    (DDR3_ck_n),
.DDR3_ck_p    (DDR3_ck_p),
.DDR3_cke     (DDR3_cke),
.DDR3_cs_n    (DDR3_cs_n),
.DDR3_dm      (DDR3_dm),
.DDR3_dq      (DDR3_dq),
.DDR3_dqs_n   (DDR3_dqs_n),
.DDR3_dqs_p   (DDR3_dqs_p),
.DDR3_odt     (DDR3_odt),
.DDR3_ras_n   (DDR3_ras_n),
.DDR3_reset_n (DDR3_reset_n),
.DDR3_we_n    (DDR3_we_n),

//.power_en     (power_en),
.cam_scl     (cam_scl),
.cam_sda     (cam_sda),
.cam_xclk_o  (cam_xclk_o),  
.cam_pclk_i  (cam_pclk_i),
.cam_vsync_i (cam_vsync_i),
.cam_href_i  (cam_href_i),
.cam_data_i  (cam_data_i),

.clk_15_625   (clk_15_625),
.clk_200      (clk_200),
.clk_125      (clk_125), 
.reset        (1'b0),
.dcm_locked   (locked),

   
.rgmii_rxd    (PHYA_rgmii_rxd),
.rgmii_rx_ctl (PHYA_rgmii_rx_ctl),
.rgmii_rxc    (PHYA_rgmii_rxc),
        
.rgmii_txd    (PHYA_rgmii_txd),
.rgmii_tx_ctl (PHYA_rgmii_tx_ctl),
.rgmii_txc    (PHYA_rgmii_txc)                          
);


endmodule
