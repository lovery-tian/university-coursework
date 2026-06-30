//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Thu May 28 15:11:14 2026
//Host        : sw running 64-bit major release  (build 9200)
//Command     : generate_target system_1_wrapper.bd
//Design      : system_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_1_wrapper
   (DDR3_addr,
    DDR3_ba,
    DDR3_cas_n,
    DDR3_ck_n,
    DDR3_ck_p,
    DDR3_cke,
    DDR3_cs_n,
    DDR3_dm,
    DDR3_dq,
    DDR3_dqs_n,
    DDR3_dqs_p,
    DDR3_odt,
    DDR3_ras_n,
    DDR3_reset_n,
    DDR3_we_n,
    FDMA_S_0_fdma_raddr,
    FDMA_S_0_fdma_rareq,
    FDMA_S_0_fdma_rbusy,
    FDMA_S_0_fdma_rdata,
    FDMA_S_0_fdma_rready,
    FDMA_S_0_fdma_rsize,
    FDMA_S_0_fdma_rvalid,
    FDMA_S_0_fdma_waddr,
    FDMA_S_0_fdma_wareq,
    FDMA_S_0_fdma_wbusy,
    FDMA_S_0_fdma_wdata,
    FDMA_S_0_fdma_wready,
    FDMA_S_0_fdma_wsize,
    FDMA_S_0_fdma_wvalid,
    cam_data_i,
    cam_de_o,
    cam_href_i,
    cam_hs_o,
    cam_pclk_i,
    cam_rgb_o,
    cam_scl,
    cam_sda,
    cam_vs_o,
    cam_vsync_i,
    cam_xclk_o,
    fdma_rstn,
    sysclk_i,
    ui_clk);
  output [13:0]DDR3_addr;
  output [2:0]DDR3_ba;
  output DDR3_cas_n;
  output [0:0]DDR3_ck_n;
  output [0:0]DDR3_ck_p;
  output [0:0]DDR3_cke;
  output [0:0]DDR3_cs_n;
  output [1:0]DDR3_dm;
  inout [15:0]DDR3_dq;
  inout [1:0]DDR3_dqs_n;
  inout [1:0]DDR3_dqs_p;
  output [0:0]DDR3_odt;
  output DDR3_ras_n;
  output DDR3_reset_n;
  output DDR3_we_n;
  input [31:0]FDMA_S_0_fdma_raddr;
  input FDMA_S_0_fdma_rareq;
  output FDMA_S_0_fdma_rbusy;
  output [127:0]FDMA_S_0_fdma_rdata;
  input FDMA_S_0_fdma_rready;
  input [15:0]FDMA_S_0_fdma_rsize;
  output FDMA_S_0_fdma_rvalid;
  input [31:0]FDMA_S_0_fdma_waddr;
  input FDMA_S_0_fdma_wareq;
  output FDMA_S_0_fdma_wbusy;
  input [127:0]FDMA_S_0_fdma_wdata;
  input FDMA_S_0_fdma_wready;
  input [15:0]FDMA_S_0_fdma_wsize;
  output FDMA_S_0_fdma_wvalid;
  input [7:0]cam_data_i;
  output cam_de_o;
  input cam_href_i;
  output cam_hs_o;
  input cam_pclk_i;
  output [23:0]cam_rgb_o;
  output cam_scl;
  inout cam_sda;
  output cam_vs_o;
  input cam_vsync_i;
  output cam_xclk_o;
  output [0:0]fdma_rstn;
  input sysclk_i;
  output ui_clk;

  wire [13:0]DDR3_addr;
  wire [2:0]DDR3_ba;
  wire DDR3_cas_n;
  wire [0:0]DDR3_ck_n;
  wire [0:0]DDR3_ck_p;
  wire [0:0]DDR3_cke;
  wire [0:0]DDR3_cs_n;
  wire [1:0]DDR3_dm;
  wire [15:0]DDR3_dq;
  wire [1:0]DDR3_dqs_n;
  wire [1:0]DDR3_dqs_p;
  wire [0:0]DDR3_odt;
  wire DDR3_ras_n;
  wire DDR3_reset_n;
  wire DDR3_we_n;
  wire [31:0]FDMA_S_0_fdma_raddr;
  wire FDMA_S_0_fdma_rareq;
  wire FDMA_S_0_fdma_rbusy;
  wire [127:0]FDMA_S_0_fdma_rdata;
  wire FDMA_S_0_fdma_rready;
  wire [15:0]FDMA_S_0_fdma_rsize;
  wire FDMA_S_0_fdma_rvalid;
  wire [31:0]FDMA_S_0_fdma_waddr;
  wire FDMA_S_0_fdma_wareq;
  wire FDMA_S_0_fdma_wbusy;
  wire [127:0]FDMA_S_0_fdma_wdata;
  wire FDMA_S_0_fdma_wready;
  wire [15:0]FDMA_S_0_fdma_wsize;
  wire FDMA_S_0_fdma_wvalid;
  wire [7:0]cam_data_i;
  wire cam_de_o;
  wire cam_href_i;
  wire cam_hs_o;
  wire cam_pclk_i;
  wire [23:0]cam_rgb_o;
  wire cam_scl;
  wire cam_sda;
  wire cam_vs_o;
  wire cam_vsync_i;
  wire cam_xclk_o;
  wire [0:0]fdma_rstn;
  wire sysclk_i;
  wire ui_clk;

  system_1 system_1_i
       (.DDR3_addr(DDR3_addr),
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
        .FDMA_S_0_fdma_raddr(FDMA_S_0_fdma_raddr),
        .FDMA_S_0_fdma_rareq(FDMA_S_0_fdma_rareq),
        .FDMA_S_0_fdma_rbusy(FDMA_S_0_fdma_rbusy),
        .FDMA_S_0_fdma_rdata(FDMA_S_0_fdma_rdata),
        .FDMA_S_0_fdma_rready(FDMA_S_0_fdma_rready),
        .FDMA_S_0_fdma_rsize(FDMA_S_0_fdma_rsize),
        .FDMA_S_0_fdma_rvalid(FDMA_S_0_fdma_rvalid),
        .FDMA_S_0_fdma_waddr(FDMA_S_0_fdma_waddr),
        .FDMA_S_0_fdma_wareq(FDMA_S_0_fdma_wareq),
        .FDMA_S_0_fdma_wbusy(FDMA_S_0_fdma_wbusy),
        .FDMA_S_0_fdma_wdata(FDMA_S_0_fdma_wdata),
        .FDMA_S_0_fdma_wready(FDMA_S_0_fdma_wready),
        .FDMA_S_0_fdma_wsize(FDMA_S_0_fdma_wsize),
        .FDMA_S_0_fdma_wvalid(FDMA_S_0_fdma_wvalid),
        .cam_data_i(cam_data_i),
        .cam_de_o(cam_de_o),
        .cam_href_i(cam_href_i),
        .cam_hs_o(cam_hs_o),
        .cam_pclk_i(cam_pclk_i),
        .cam_rgb_o(cam_rgb_o),
        .cam_scl(cam_scl),
        .cam_sda(cam_sda),
        .cam_vs_o(cam_vs_o),
        .cam_vsync_i(cam_vsync_i),
        .cam_xclk_o(cam_xclk_o),
        .fdma_rstn(fdma_rstn),
        .sysclk_i(sysclk_i),
        .ui_clk(ui_clk));
endmodule
