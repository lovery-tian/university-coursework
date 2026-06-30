// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu May 28 14:47:18 2026
// Host        : sw running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/FPGAcam/udp_cam/udp_cam.srcs/sources_1/bd/system_1/ip/system_1_uidelay_0_0/system_1_uidelay_0_0_sim_netlist.v
// Design      : system_1_uidelay_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_1_uidelay_0_0,uidelay,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "uidelay,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module system_1_uidelay_0_0
   (clk_i,
    rstn_i,
    rst_o);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_i CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_i, ASSOCIATED_RESET rstn_i, FREQ_HZ 24000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clk_i;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn_i RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn_i, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rstn_i;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_o RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_o, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output rst_o;

  wire clk_i;
  wire rst_o;
  wire rstn_i;

  system_1_uidelay_0_0_uidelay inst
       (.clk_i(clk_i),
        .rst_o(rst_o),
        .rstn_i(rstn_i));
endmodule

(* ORIG_REF_NAME = "uidelay" *) 
module system_1_uidelay_0_0_uidelay
   (rst_o,
    clk_i,
    rstn_i);
  output rst_o;
  input clk_i;
  input rstn_i;

  wire clk_i;
  wire [16:0]cnt;
  wire \cnt0_inferred__0/i__carry__0_n_0 ;
  wire \cnt0_inferred__0/i__carry__0_n_1 ;
  wire \cnt0_inferred__0/i__carry__0_n_2 ;
  wire \cnt0_inferred__0/i__carry__0_n_3 ;
  wire \cnt0_inferred__0/i__carry__1_n_0 ;
  wire \cnt0_inferred__0/i__carry__1_n_1 ;
  wire \cnt0_inferred__0/i__carry__1_n_2 ;
  wire \cnt0_inferred__0/i__carry__1_n_3 ;
  wire \cnt0_inferred__0/i__carry__2_n_1 ;
  wire \cnt0_inferred__0/i__carry__2_n_2 ;
  wire \cnt0_inferred__0/i__carry__2_n_3 ;
  wire \cnt0_inferred__0/i__carry_n_0 ;
  wire \cnt0_inferred__0/i__carry_n_1 ;
  wire \cnt0_inferred__0/i__carry_n_2 ;
  wire \cnt0_inferred__0/i__carry_n_3 ;
  wire \cnt[16]_i_2_n_0 ;
  wire p_0_in;
  wire [16:0]p_1_in;
  wire rst_d0_i_1_n_0;
  wire rst_d0_i_2_n_0;
  wire rst_d0_i_3_n_0;
  wire rst_d0_i_4_n_0;
  wire rst_d0_i_5_n_0;
  wire rst_o;
  wire rstn_i;
  wire [3:3]\NLW_cnt0_inferred__0/i__carry__2_CO_UNCONNECTED ;

  CARRY4 \cnt0_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\cnt0_inferred__0/i__carry_n_0 ,\cnt0_inferred__0/i__carry_n_1 ,\cnt0_inferred__0/i__carry_n_2 ,\cnt0_inferred__0/i__carry_n_3 }),
        .CYINIT(cnt[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[4:1]),
        .S(cnt[4:1]));
  CARRY4 \cnt0_inferred__0/i__carry__0 
       (.CI(\cnt0_inferred__0/i__carry_n_0 ),
        .CO({\cnt0_inferred__0/i__carry__0_n_0 ,\cnt0_inferred__0/i__carry__0_n_1 ,\cnt0_inferred__0/i__carry__0_n_2 ,\cnt0_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[8:5]),
        .S(cnt[8:5]));
  CARRY4 \cnt0_inferred__0/i__carry__1 
       (.CI(\cnt0_inferred__0/i__carry__0_n_0 ),
        .CO({\cnt0_inferred__0/i__carry__1_n_0 ,\cnt0_inferred__0/i__carry__1_n_1 ,\cnt0_inferred__0/i__carry__1_n_2 ,\cnt0_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[12:9]),
        .S(cnt[12:9]));
  CARRY4 \cnt0_inferred__0/i__carry__2 
       (.CI(\cnt0_inferred__0/i__carry__1_n_0 ),
        .CO({\NLW_cnt0_inferred__0/i__carry__2_CO_UNCONNECTED [3],\cnt0_inferred__0/i__carry__2_n_1 ,\cnt0_inferred__0/i__carry__2_n_2 ,\cnt0_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[16:13]),
        .S(cnt[16:13]));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt[0]),
        .O(p_1_in[0]));
  LUT6 #(
    .INIT(64'h8888888A8A8A8A8A)) 
    \cnt[16]_i_1 
       (.I0(\cnt[16]_i_2_n_0 ),
        .I1(rst_d0_i_4_n_0),
        .I2(cnt[8]),
        .I3(cnt[5]),
        .I4(cnt[6]),
        .I5(cnt[7]),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'h777777777777777F)) 
    \cnt[16]_i_2 
       (.I0(cnt[15]),
        .I1(cnt[16]),
        .I2(cnt[14]),
        .I3(cnt[11]),
        .I4(cnt[13]),
        .I5(cnt[12]),
        .O(\cnt[16]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[0]),
        .Q(cnt[0]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[10] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[10]),
        .Q(cnt[10]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[11] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[11]),
        .Q(cnt[11]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[12] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[12]),
        .Q(cnt[12]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[13] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[13]),
        .Q(cnt[13]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[14] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[14]),
        .Q(cnt[14]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[15] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[15]),
        .Q(cnt[15]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[16] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[16]),
        .Q(cnt[16]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[1]),
        .Q(cnt[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[2]),
        .Q(cnt[2]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[3]),
        .Q(cnt[3]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[4]),
        .Q(cnt[4]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[5]),
        .Q(cnt[5]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[6]),
        .Q(cnt[6]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[7]),
        .Q(cnt[7]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[8]),
        .Q(cnt[8]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg[9] 
       (.C(clk_i),
        .CE(p_0_in),
        .CLR(rst_d0_i_2_n_0),
        .D(p_1_in[9]),
        .Q(cnt[9]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    rst_d0_i_1
       (.I0(rst_d0_i_3_n_0),
        .I1(rst_d0_i_4_n_0),
        .I2(cnt[8]),
        .I3(cnt[1]),
        .I4(cnt[6]),
        .I5(rst_d0_i_5_n_0),
        .O(rst_d0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    rst_d0_i_2
       (.I0(rstn_i),
        .O(rst_d0_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    rst_d0_i_3
       (.I0(cnt[4]),
        .I1(cnt[0]),
        .I2(cnt[3]),
        .I3(cnt[5]),
        .I4(cnt[2]),
        .I5(cnt[7]),
        .O(rst_d0_i_3_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    rst_d0_i_4
       (.I0(cnt[15]),
        .I1(cnt[16]),
        .I2(cnt[9]),
        .I3(cnt[10]),
        .O(rst_d0_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    rst_d0_i_5
       (.I0(cnt[12]),
        .I1(cnt[13]),
        .I2(cnt[11]),
        .I3(cnt[14]),
        .O(rst_d0_i_5_n_0));
  FDCE rst_d0_reg
       (.C(clk_i),
        .CE(1'b1),
        .CLR(rst_d0_i_2_n_0),
        .D(rst_d0_i_1_n_0),
        .Q(rst_o));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
