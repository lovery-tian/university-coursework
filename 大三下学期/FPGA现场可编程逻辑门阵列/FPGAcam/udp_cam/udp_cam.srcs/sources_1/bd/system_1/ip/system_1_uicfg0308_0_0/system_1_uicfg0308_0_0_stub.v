// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu May 28 14:47:58 2026
// Host        : sw running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/FPGAcam/udp_cam/udp_cam.srcs/sources_1/bd/system_1/ip/system_1_uicfg0308_0_0/system_1_uicfg0308_0_0_stub.v
// Design      : system_1_uicfg0308_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "uicfg0308,Vivado 2019.2" *)
module system_1_uicfg0308_0_0(clk_i, rst_n, cmos_scl, cmos_sda, cfg_done)
/* synthesis syn_black_box black_box_pad_pin="clk_i,rst_n,cmos_scl,cmos_sda,cfg_done" */;
  input clk_i;
  input rst_n;
  output cmos_scl;
  inout cmos_sda;
  output cfg_done;
endmodule
