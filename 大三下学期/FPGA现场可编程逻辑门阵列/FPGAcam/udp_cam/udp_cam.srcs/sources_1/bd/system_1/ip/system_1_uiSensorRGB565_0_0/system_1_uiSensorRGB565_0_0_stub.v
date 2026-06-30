// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu May 28 14:47:56 2026
// Host        : sw running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/FPGAcam/udp_cam/udp_cam.srcs/sources_1/bd/system_1/ip/system_1_uiSensorRGB565_0_0/system_1_uiSensorRGB565_0_0_stub.v
// Design      : system_1_uiSensorRGB565_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "uiSensorRGB565,Vivado 2019.2" *)
module system_1_uiSensorRGB565_0_0(rstn_i, cmos_clk_i, cmos_pclk_i, cmos_href_i, 
  cmos_vsync_i, cmos_data_i, cmos_xclk_o, rgb_o, de_o, vs_o, hs_o)
/* synthesis syn_black_box black_box_pad_pin="rstn_i,cmos_clk_i,cmos_pclk_i,cmos_href_i,cmos_vsync_i,cmos_data_i[7:0],cmos_xclk_o,rgb_o[23:0],de_o,vs_o,hs_o" */;
  input rstn_i;
  input cmos_clk_i;
  input cmos_pclk_i;
  input cmos_href_i;
  input cmos_vsync_i;
  input [7:0]cmos_data_i;
  output cmos_xclk_o;
  output [23:0]rgb_o;
  output de_o;
  output vs_o;
  output hs_o;
endmodule
