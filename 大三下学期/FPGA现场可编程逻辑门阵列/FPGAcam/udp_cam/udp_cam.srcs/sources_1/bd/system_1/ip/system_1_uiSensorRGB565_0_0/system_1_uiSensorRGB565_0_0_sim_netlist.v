// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu May 28 14:47:56 2026
// Host        : sw running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/FPGAcam/udp_cam/udp_cam.srcs/sources_1/bd/system_1/ip/system_1_uiSensorRGB565_0_0/system_1_uiSensorRGB565_0_0_sim_netlist.v
// Design      : system_1_uiSensorRGB565_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_1_uiSensorRGB565_0_0,uiSensorRGB565,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "uiSensorRGB565,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module system_1_uiSensorRGB565_0_0
   (rstn_i,
    cmos_clk_i,
    cmos_pclk_i,
    cmos_href_i,
    cmos_vsync_i,
    cmos_data_i,
    cmos_xclk_o,
    rgb_o,
    de_o,
    vs_o,
    hs_o);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn_i RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn_i, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rstn_i;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 cmos_clk_i CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cmos_clk_i, ASSOCIATED_RESET rstn_i, FREQ_HZ 24000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input cmos_clk_i;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 cmos_pclk_i CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cmos_pclk_i, ASSOCIATED_RESET rstn_i, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_1_cmos_pclk_i_1, INSERT_VIP 0" *) input cmos_pclk_i;
  input cmos_href_i;
  input cmos_vsync_i;
  input [7:0]cmos_data_i;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 cmos_xclk_o CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME cmos_xclk_o, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_1_uiSensorRGB565_0_0_cmos_xclk_o, INSERT_VIP 0" *) output cmos_xclk_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 svidout DATA" *) output [23:0]rgb_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 svidout ACTIVE_VIDEO" *) output de_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 svidout VSYNC" *) output vs_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 svidout HSYNC" *) output hs_o;

  wire \<const0> ;
  wire cmos_clk_i;
  wire [7:0]cmos_data_i;
  wire cmos_href_i;
  wire cmos_pclk_i;
  wire cmos_vsync_i;
  wire de_o;
  wire hs_o;
  wire [23:3]\^rgb_o ;
  wire rstn_i;
  wire vs_o;

  assign cmos_xclk_o = cmos_clk_i;
  assign rgb_o[23:19] = \^rgb_o [23:19];
  assign rgb_o[18] = \<const0> ;
  assign rgb_o[17] = \<const0> ;
  assign rgb_o[16] = \<const0> ;
  assign rgb_o[15:10] = \^rgb_o [15:10];
  assign rgb_o[9] = \<const0> ;
  assign rgb_o[8] = \<const0> ;
  assign rgb_o[7:3] = \^rgb_o [7:3];
  assign rgb_o[2] = \<const0> ;
  assign rgb_o[1] = \<const0> ;
  assign rgb_o[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  system_1_uiSensorRGB565_0_0_uiSensorRGB565 inst
       (.cmos_data_i(cmos_data_i),
        .cmos_href_i(cmos_href_i),
        .cmos_pclk_i(cmos_pclk_i),
        .cmos_vsync_i(cmos_vsync_i),
        .de_o(de_o),
        .hs_o(hs_o),
        .rgb_o({\^rgb_o [23:19],\^rgb_o [15:10],\^rgb_o [7:3]}),
        .rstn_i(rstn_i),
        .vs_o(vs_o));
endmodule

(* ORIG_REF_NAME = "uiSensorRGB565" *) 
module system_1_uiSensorRGB565_0_0_uiSensorRGB565
   (rgb_o,
    de_o,
    vs_o,
    hs_o,
    cmos_pclk_i,
    cmos_href_i,
    cmos_data_i,
    cmos_vsync_i,
    rstn_i);
  output [15:0]rgb_o;
  output de_o;
  output vs_o;
  output hs_o;
  input cmos_pclk_i;
  input cmos_href_i;
  input [7:0]cmos_data_i;
  input cmos_vsync_i;
  input rstn_i;

  wire clear;
  wire [7:0]cmos_data_i;
  wire [7:0]cmos_data_r1;
  wire [7:0]cmos_data_r2;
  wire cmos_href_i;
  wire cmos_href_r1;
  wire cmos_href_r2;
  wire cmos_href_r3;
  wire cmos_pclk_i;
  wire cmos_vsync_i;
  wire cmos_vsync_r1;
  wire cmos_vsync_r2;
  wire data_en;
  wire data_en_i_1_n_0;
  wire de_o;
  wire href_cnt;
  wire href_cnt_i_1_n_0;
  wire hs_o;
  wire out_en__2;
  wire p_0_in;
  wire [4:0]p_0_in__0;
  wire \rgb2[15]_i_1_n_0 ;
  wire [15:0]rgb_o;
  wire rstn1;
  wire rstn1_i_1_n_0;
  wire rstn2;
  wire rstn_i;
  wire vs_cnt;
  wire [4:0]vs_cnt_reg;
  wire vs_o;

  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r1_reg[0] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_i[0]),
        .Q(cmos_data_r1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r1_reg[1] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_i[1]),
        .Q(cmos_data_r1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r1_reg[2] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_i[2]),
        .Q(cmos_data_r1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r1_reg[3] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_i[3]),
        .Q(cmos_data_r1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r1_reg[4] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_i[4]),
        .Q(cmos_data_r1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r1_reg[5] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_i[5]),
        .Q(cmos_data_r1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r1_reg[6] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_i[6]),
        .Q(cmos_data_r1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r1_reg[7] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_i[7]),
        .Q(cmos_data_r1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r2_reg[0] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_r1[0]),
        .Q(cmos_data_r2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r2_reg[1] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_r1[1]),
        .Q(cmos_data_r2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r2_reg[2] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_r1[2]),
        .Q(cmos_data_r2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r2_reg[3] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_r1[3]),
        .Q(cmos_data_r2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r2_reg[4] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_r1[4]),
        .Q(cmos_data_r2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r2_reg[5] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_r1[5]),
        .Q(cmos_data_r2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r2_reg[6] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_r1[6]),
        .Q(cmos_data_r2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cmos_data_r2_reg[7] 
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_data_r1[7]),
        .Q(cmos_data_r2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    cmos_href_r1_reg
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_href_i),
        .Q(cmos_href_r1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    cmos_href_r2_reg
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_href_r1),
        .Q(cmos_href_r2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    cmos_href_r3_reg
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_href_r2),
        .Q(cmos_href_r3),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    cmos_vsync_r1_i_1
       (.I0(cmos_vsync_i),
        .O(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    cmos_vsync_r1_reg
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(p_0_in),
        .Q(cmos_vsync_r1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    cmos_vsync_r2_reg
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(cmos_vsync_r1),
        .Q(cmos_vsync_r2),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8808)) 
    data_en_i_1
       (.I0(href_cnt),
        .I1(out_en__2),
        .I2(cmos_vsync_r1),
        .I3(cmos_vsync_r2),
        .O(data_en_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    data_en_reg
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(data_en_i_1_n_0),
        .Q(data_en),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    de_o_INST_0
       (.I0(vs_cnt_reg[2]),
        .I1(vs_cnt_reg[1]),
        .I2(vs_cnt_reg[4]),
        .I3(vs_cnt_reg[3]),
        .I4(vs_cnt_reg[0]),
        .I5(data_en),
        .O(de_o));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00008A00)) 
    href_cnt_i_1
       (.I0(cmos_href_r2),
        .I1(cmos_vsync_r2),
        .I2(cmos_vsync_r1),
        .I3(out_en__2),
        .I4(href_cnt),
        .O(href_cnt_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    href_cnt_reg
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .D(href_cnt_i_1_n_0),
        .Q(href_cnt),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    hs_o_INST_0
       (.I0(vs_cnt_reg[2]),
        .I1(vs_cnt_reg[1]),
        .I2(vs_cnt_reg[4]),
        .I3(vs_cnt_reg[3]),
        .I4(vs_cnt_reg[0]),
        .I5(cmos_href_r3),
        .O(hs_o));
  LUT3 #(
    .INIT(8'h4F)) 
    \rgb2[15]_i_1 
       (.I0(cmos_vsync_r2),
        .I1(cmos_vsync_r1),
        .I2(out_en__2),
        .O(\rgb2[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \rgb2[15]_i_2 
       (.I0(vs_cnt_reg[0]),
        .I1(vs_cnt_reg[3]),
        .I2(vs_cnt_reg[4]),
        .I3(vs_cnt_reg[1]),
        .I4(vs_cnt_reg[2]),
        .O(out_en__2));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[0] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(cmos_data_r2[0]),
        .Q(rgb_o[0]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[10] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(rgb_o[2]),
        .Q(rgb_o[10]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[11] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(rgb_o[3]),
        .Q(rgb_o[11]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[12] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(rgb_o[4]),
        .Q(rgb_o[12]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[13] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(rgb_o[5]),
        .Q(rgb_o[13]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[14] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(rgb_o[6]),
        .Q(rgb_o[14]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[15] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(rgb_o[7]),
        .Q(rgb_o[15]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[1] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(cmos_data_r2[1]),
        .Q(rgb_o[1]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[2] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(cmos_data_r2[2]),
        .Q(rgb_o[2]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[3] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(cmos_data_r2[3]),
        .Q(rgb_o[3]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[4] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(cmos_data_r2[4]),
        .Q(rgb_o[4]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[5] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(cmos_data_r2[5]),
        .Q(rgb_o[5]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[6] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(cmos_data_r2[6]),
        .Q(rgb_o[6]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[7] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(cmos_data_r2[7]),
        .Q(rgb_o[7]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[8] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(rgb_o[0]),
        .Q(rgb_o[8]),
        .R(\rgb2[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rgb2_reg[9] 
       (.C(cmos_pclk_i),
        .CE(cmos_href_r2),
        .D(rgb_o[1]),
        .Q(rgb_o[9]),
        .R(\rgb2[15]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    rstn1_i_1
       (.I0(rstn_i),
        .O(rstn1_i_1_n_0));
  FDCE rstn1_reg
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .CLR(rstn1_i_1_n_0),
        .D(1'b1),
        .Q(rstn1));
  FDCE rstn2_reg
       (.C(cmos_pclk_i),
        .CE(1'b1),
        .CLR(rstn1_i_1_n_0),
        .D(rstn1),
        .Q(rstn2));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \vs_cnt[0]_i_1 
       (.I0(vs_cnt_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \vs_cnt[1]_i_1 
       (.I0(vs_cnt_reg[0]),
        .I1(vs_cnt_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \vs_cnt[2]_i_1 
       (.I0(vs_cnt_reg[0]),
        .I1(vs_cnt_reg[1]),
        .I2(vs_cnt_reg[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \vs_cnt[3]_i_1 
       (.I0(vs_cnt_reg[1]),
        .I1(vs_cnt_reg[0]),
        .I2(vs_cnt_reg[2]),
        .I3(vs_cnt_reg[3]),
        .O(p_0_in__0[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \vs_cnt[4]_i_1 
       (.I0(rstn2),
        .O(clear));
  LUT6 #(
    .INIT(64'h0444444444444444)) 
    \vs_cnt[4]_i_2 
       (.I0(cmos_vsync_r2),
        .I1(cmos_vsync_r1),
        .I2(vs_cnt_reg[3]),
        .I3(vs_cnt_reg[4]),
        .I4(vs_cnt_reg[1]),
        .I5(vs_cnt_reg[2]),
        .O(vs_cnt));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \vs_cnt[4]_i_3 
       (.I0(vs_cnt_reg[2]),
        .I1(vs_cnt_reg[0]),
        .I2(vs_cnt_reg[1]),
        .I3(vs_cnt_reg[3]),
        .I4(vs_cnt_reg[4]),
        .O(p_0_in__0[4]));
  FDRE \vs_cnt_reg[0] 
       (.C(cmos_pclk_i),
        .CE(vs_cnt),
        .D(p_0_in__0[0]),
        .Q(vs_cnt_reg[0]),
        .R(clear));
  FDRE \vs_cnt_reg[1] 
       (.C(cmos_pclk_i),
        .CE(vs_cnt),
        .D(p_0_in__0[1]),
        .Q(vs_cnt_reg[1]),
        .R(clear));
  FDRE \vs_cnt_reg[2] 
       (.C(cmos_pclk_i),
        .CE(vs_cnt),
        .D(p_0_in__0[2]),
        .Q(vs_cnt_reg[2]),
        .R(clear));
  FDRE \vs_cnt_reg[3] 
       (.C(cmos_pclk_i),
        .CE(vs_cnt),
        .D(p_0_in__0[3]),
        .Q(vs_cnt_reg[3]),
        .R(clear));
  FDRE \vs_cnt_reg[4] 
       (.C(cmos_pclk_i),
        .CE(vs_cnt),
        .D(p_0_in__0[4]),
        .Q(vs_cnt_reg[4]),
        .R(clear));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    vs_o_INST_0
       (.I0(vs_cnt_reg[2]),
        .I1(vs_cnt_reg[1]),
        .I2(vs_cnt_reg[4]),
        .I3(vs_cnt_reg[3]),
        .I4(vs_cnt_reg[0]),
        .I5(cmos_vsync_r2),
        .O(vs_o));
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
