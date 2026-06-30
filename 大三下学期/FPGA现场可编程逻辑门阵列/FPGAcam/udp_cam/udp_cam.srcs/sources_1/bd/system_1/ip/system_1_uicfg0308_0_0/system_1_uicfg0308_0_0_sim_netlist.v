// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu May 28 14:47:58 2026
// Host        : sw running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/FPGAcam/udp_cam/udp_cam.srcs/sources_1/bd/system_1/ip/system_1_uicfg0308_0_0/system_1_uicfg0308_0_0_sim_netlist.v
// Design      : system_1_uicfg0308_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_1_uicfg0308_0_0,uicfg0308,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "uicfg0308,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module system_1_uicfg0308_0_0
   (clk_i,
    rst_n,
    cmos_scl,
    cmos_sda,
    cfg_done);
  input clk_i;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  output cmos_scl;
  inout cmos_sda;
  output cfg_done;

  wire cfg_done;
  wire clk_i;
  wire cmos_scl;
  (* DRIVE = "12" *) (* IBUF_LOW_PWR *) (* SLEW = "SLOW" *) wire cmos_sda;
  wire rst_n;

  system_1_uicfg0308_0_0_uicfg0308 inst
       (.cfg_done(cfg_done),
        .clk_i(clk_i),
        .cmos_scl(cmos_scl),
        .cmos_sda(cmos_sda),
        .rst_n(rst_n));
endmodule

(* ORIG_REF_NAME = "uicfg0308" *) 
module system_1_uicfg0308_0_0_uicfg0308
   (cfg_done,
    cmos_scl,
    cmos_sda,
    clk_i,
    rst_n);
  output cfg_done;
  output cmos_scl;
  inout cmos_sda;
  input clk_i;
  input rst_n;

  wire \TS_S[0]_i_1_n_0 ;
  wire \TS_S[1]_i_1_n_0 ;
  wire \TS_S_reg_n_0_[0] ;
  wire \TS_S_reg_n_0_[1] ;
  wire cfg_done;
  wire cfg_done_i_1_n_0;
  wire cfg_done_i_2_n_0;
  wire cfg_done_i_3_n_0;
  wire clear;
  wire clk_i;
  wire cmos_scl;
  wire cmos_sda;
  wire iic_busy;
  wire iic_req;
  wire [7:0]p_0_in;
  wire p_0_in_0;
  wire \reg_index[0]_i_1_n_0 ;
  wire \reg_index[1]_i_1_n_0 ;
  wire \reg_index[2]_i_1_n_0 ;
  wire \reg_index[3]_i_1_n_0 ;
  wire \reg_index[4]_i_1_n_0 ;
  wire \reg_index[5]_i_1_n_0 ;
  wire \reg_index[6]_i_1_n_0 ;
  wire \reg_index[7]_i_1_n_0 ;
  wire \reg_index[8]_i_2_n_0 ;
  wire [8:0]reg_index_reg;
  wire reg_index_reg_rep_i_10_n_0;
  wire reg_index_reg_rep_i_11_n_0;
  wire reg_index_reg_rep_i_12_n_0;
  wire reg_index_reg_rep_i_3_n_0;
  wire reg_index_reg_rep_i_4_n_0;
  wire reg_index_reg_rep_i_5_n_0;
  wire reg_index_reg_rep_i_6_n_0;
  wire reg_index_reg_rep_i_7_n_0;
  wire reg_index_reg_rep_i_8_n_0;
  wire reg_index_reg_rep_i_9_n_0;
  wire \rst_cnt[7]_i_2_n_0 ;
  wire \rst_cnt[7]_i_3_n_0 ;
  wire \rst_cnt_reg_n_0_[0] ;
  wire \rst_cnt_reg_n_0_[1] ;
  wire \rst_cnt_reg_n_0_[2] ;
  wire \rst_cnt_reg_n_0_[3] ;
  wire \rst_cnt_reg_n_0_[4] ;
  wire \rst_cnt_reg_n_0_[5] ;
  wire \rst_cnt_reg_n_0_[6] ;
  wire rst_n;
  wire uii2c_inst_n_3;
  wire uii2c_inst_n_4;
  wire uii2c_inst_n_5;
  wire uii2c_inst_n_6;
  wire [23:8]wr_data;
  wire \wr_data_reg_n_0_[6] ;
  wire [15:0]NLW_reg_index_reg_rep_DOBDO_UNCONNECTED;
  wire [1:0]NLW_reg_index_reg_rep_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_reg_index_reg_rep_DOPBDOP_UNCONNECTED;

  LUT6 #(
    .INIT(64'hEEEF000100000000)) 
    \TS_S[0]_i_1 
       (.I0(\TS_S_reg_n_0_[0] ),
        .I1(\TS_S_reg_n_0_[1] ),
        .I2(cfg_done),
        .I3(cfg_done_i_2_n_0),
        .I4(iic_busy),
        .I5(p_0_in_0),
        .O(\TS_S[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC600)) 
    \TS_S[1]_i_1 
       (.I0(\TS_S_reg_n_0_[0] ),
        .I1(\TS_S_reg_n_0_[1] ),
        .I2(iic_busy),
        .I3(p_0_in_0),
        .O(\TS_S[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \TS_S_reg[0] 
       (.C(clk_i),
        .CE(1'b1),
        .D(\TS_S[0]_i_1_n_0 ),
        .Q(\TS_S_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TS_S_reg[1] 
       (.C(clk_i),
        .CE(1'b1),
        .D(\TS_S[1]_i_1_n_0 ),
        .Q(\TS_S_reg_n_0_[1] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hAAAE0000)) 
    cfg_done_i_1
       (.I0(cfg_done),
        .I1(cfg_done_i_2_n_0),
        .I2(\TS_S_reg_n_0_[0] ),
        .I3(\TS_S_reg_n_0_[1] ),
        .I4(p_0_in_0),
        .O(cfg_done_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    cfg_done_i_2
       (.I0(cfg_done_i_3_n_0),
        .I1(reg_index_reg[0]),
        .I2(reg_index_reg[2]),
        .I3(reg_index_reg[1]),
        .O(cfg_done_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    cfg_done_i_3
       (.I0(reg_index_reg[4]),
        .I1(reg_index_reg[3]),
        .I2(reg_index_reg[5]),
        .I3(reg_index_reg[6]),
        .I4(reg_index_reg[7]),
        .I5(reg_index_reg[8]),
        .O(cfg_done_i_3_n_0));
  FDRE cfg_done_reg
       (.C(clk_i),
        .CE(1'b1),
        .D(cfg_done_i_1_n_0),
        .Q(cfg_done),
        .R(1'b0));
  FDRE iic_req_reg
       (.C(clk_i),
        .CE(1'b1),
        .D(uii2c_inst_n_6),
        .Q(iic_req),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \reg_index[0]_i_1 
       (.I0(reg_index_reg[0]),
        .O(\reg_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \reg_index[1]_i_1 
       (.I0(reg_index_reg[0]),
        .I1(reg_index_reg[1]),
        .O(\reg_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \reg_index[2]_i_1 
       (.I0(reg_index_reg[0]),
        .I1(reg_index_reg[1]),
        .I2(reg_index_reg[2]),
        .O(\reg_index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_index[3]_i_1 
       (.I0(reg_index_reg[1]),
        .I1(reg_index_reg[0]),
        .I2(reg_index_reg[2]),
        .I3(reg_index_reg[3]),
        .O(\reg_index[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \reg_index[4]_i_1 
       (.I0(reg_index_reg[2]),
        .I1(reg_index_reg[0]),
        .I2(reg_index_reg[1]),
        .I3(reg_index_reg[3]),
        .I4(reg_index_reg[4]),
        .O(\reg_index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \reg_index[5]_i_1 
       (.I0(reg_index_reg[3]),
        .I1(reg_index_reg[1]),
        .I2(reg_index_reg[0]),
        .I3(reg_index_reg[2]),
        .I4(reg_index_reg[4]),
        .I5(reg_index_reg[5]),
        .O(\reg_index[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \reg_index[6]_i_1 
       (.I0(reg_index_reg_rep_i_12_n_0),
        .I1(reg_index_reg[6]),
        .O(\reg_index[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \reg_index[7]_i_1 
       (.I0(reg_index_reg_rep_i_12_n_0),
        .I1(reg_index_reg[6]),
        .I2(reg_index_reg[7]),
        .O(\reg_index[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \reg_index[8]_i_2 
       (.I0(reg_index_reg[6]),
        .I1(reg_index_reg_rep_i_12_n_0),
        .I2(reg_index_reg[7]),
        .I3(reg_index_reg[8]),
        .O(\reg_index[8]_i_2_n_0 ));
  FDRE \reg_index_reg[0] 
       (.C(clk_i),
        .CE(uii2c_inst_n_5),
        .D(\reg_index[0]_i_1_n_0 ),
        .Q(reg_index_reg[0]),
        .R(clear));
  FDRE \reg_index_reg[1] 
       (.C(clk_i),
        .CE(uii2c_inst_n_5),
        .D(\reg_index[1]_i_1_n_0 ),
        .Q(reg_index_reg[1]),
        .R(clear));
  FDRE \reg_index_reg[2] 
       (.C(clk_i),
        .CE(uii2c_inst_n_5),
        .D(\reg_index[2]_i_1_n_0 ),
        .Q(reg_index_reg[2]),
        .R(clear));
  FDRE \reg_index_reg[3] 
       (.C(clk_i),
        .CE(uii2c_inst_n_5),
        .D(\reg_index[3]_i_1_n_0 ),
        .Q(reg_index_reg[3]),
        .R(clear));
  FDRE \reg_index_reg[4] 
       (.C(clk_i),
        .CE(uii2c_inst_n_5),
        .D(\reg_index[4]_i_1_n_0 ),
        .Q(reg_index_reg[4]),
        .R(clear));
  FDRE \reg_index_reg[5] 
       (.C(clk_i),
        .CE(uii2c_inst_n_5),
        .D(\reg_index[5]_i_1_n_0 ),
        .Q(reg_index_reg[5]),
        .R(clear));
  FDRE \reg_index_reg[6] 
       (.C(clk_i),
        .CE(uii2c_inst_n_5),
        .D(\reg_index[6]_i_1_n_0 ),
        .Q(reg_index_reg[6]),
        .R(clear));
  FDRE \reg_index_reg[7] 
       (.C(clk_i),
        .CE(uii2c_inst_n_5),
        .D(\reg_index[7]_i_1_n_0 ),
        .Q(reg_index_reg[7]),
        .R(clear));
  FDRE \reg_index_reg[8] 
       (.C(clk_i),
        .CE(uii2c_inst_n_5),
        .D(\reg_index[8]_i_2_n_0 ),
        .Q(reg_index_reg[8]),
        .R(clear));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "8192" *) 
  (* RTL_RAM_NAME = "inst/reg_index" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "15" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(1),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hE200042003030F01027001FA22575C4A5B405A562255D210FE00FE80009B009B),
    .INIT_01(256'h0B020AE809010800070006000500EBC4EA09E9B0E804E720E603E558E402E364),
    .INIT_02(256'h1CC11B001A1E1944184417011605150A14101300122A11FD10220E020D020C88),
    .INIT_03(256'h3B203A1839043200315030F72F012602250F24A6225721F820FF1F161E601D08),
    .INIT_04(256'h913C902E8F2E8E2E8D408C408B40568255805480538250103F003E003D003C00),
    .INIT_05(256'h6D8F6C5F6B006A0F691868A2678666E864036208611560075F245E1A5D129250),
    .INIT_06(256'h93487CFF7B227A817981788877367602753F7402738072DC713370156F386E55),
    .INIT_07(256'hDF23DCA5DB92D616D5F2D110D0C9BE36BD38B238B13898F0974096E895059400),
    .INIT_08(256'hA587A476A363A24EA138A0209F1080038003EF40EEA0ED04EC20E009DA00D900),
    .INIT_09(256'hC554C443C330C21CC110C000AFFFAEFDADF8ACF0ABEBAAE3A9D8A8CAA7B8A6A2),
    .INIT_0A(256'h021A00F5FE01FA78F99FF330F201F101F002CCFFCBE6CACBC9B0C893C775C665),
    .INIT_0B(256'h1BF51AD01940181817A816C21543144213131272113F0F390E4C0C080B600AA0),
    .INIT_0C(256'h37C036C035B034E033E032E03140300378327720756074207348723071587040),
    .INIT_0D(256'h470D46EE45D644B843A742944181406C3F573E443D313C283B1C3A1239093804),
    .INIT_0E(256'h8D208C208B205680538050143A201E611D9A1C491A2A110D1026008BD290FE00),
    .INIT_0F(256'hFE01F80AF712F202D348D0CBB6E0B340B240B14096E09507940290148F108E14),
    .INIT_10(256'h32101AD819501544144413191222113710410F320E44080A0620050804100220),
    .INIT_11(256'h008B008B008B008B008B008B008B008B008B008B008B008BFE00370036803500),
    .INIT_12(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_13(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_14(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_15(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_16(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_17(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_18(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_19(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_1A(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_1B(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_1C(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_1D(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_1E(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_1F(256'h008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    reg_index_reg_rep
       (.ADDRARDADDR({1'b0,reg_index_reg_rep_i_3_n_0,reg_index_reg_rep_i_4_n_0,reg_index_reg_rep_i_5_n_0,reg_index_reg_rep_i_6_n_0,reg_index_reg_rep_i_7_n_0,reg_index_reg_rep_i_8_n_0,reg_index_reg_rep_i_9_n_0,reg_index_reg_rep_i_10_n_0,reg_index_reg_rep_i_11_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk_i),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO({wr_data[15:8],wr_data[23:16]}),
        .DOBDO(NLW_reg_index_reg_rep_DOBDO_UNCONNECTED[15:0]),
        .DOPADOP(NLW_reg_index_reg_rep_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_reg_index_reg_rep_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(uii2c_inst_n_3),
        .ENBWREN(1'b0),
        .REGCEAREGCE(uii2c_inst_n_4),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(clear),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT3 #(
    .INIT(8'h60)) 
    reg_index_reg_rep_i_10
       (.I0(reg_index_reg[1]),
        .I1(reg_index_reg[0]),
        .I2(p_0_in_0),
        .O(reg_index_reg_rep_i_10_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    reg_index_reg_rep_i_11
       (.I0(p_0_in_0),
        .I1(reg_index_reg[0]),
        .O(reg_index_reg_rep_i_11_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    reg_index_reg_rep_i_12
       (.I0(reg_index_reg[5]),
        .I1(reg_index_reg[3]),
        .I2(reg_index_reg[1]),
        .I3(reg_index_reg[0]),
        .I4(reg_index_reg[2]),
        .I5(reg_index_reg[4]),
        .O(reg_index_reg_rep_i_12_n_0));
  LUT5 #(
    .INIT(32'h6AAA0000)) 
    reg_index_reg_rep_i_3
       (.I0(reg_index_reg[8]),
        .I1(reg_index_reg[7]),
        .I2(reg_index_reg_rep_i_12_n_0),
        .I3(reg_index_reg[6]),
        .I4(p_0_in_0),
        .O(reg_index_reg_rep_i_3_n_0));
  LUT4 #(
    .INIT(16'h6A00)) 
    reg_index_reg_rep_i_4
       (.I0(reg_index_reg[7]),
        .I1(reg_index_reg[6]),
        .I2(reg_index_reg_rep_i_12_n_0),
        .I3(p_0_in_0),
        .O(reg_index_reg_rep_i_4_n_0));
  LUT3 #(
    .INIT(8'h60)) 
    reg_index_reg_rep_i_5
       (.I0(reg_index_reg[6]),
        .I1(reg_index_reg_rep_i_12_n_0),
        .I2(p_0_in_0),
        .O(reg_index_reg_rep_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    reg_index_reg_rep_i_6
       (.I0(\reg_index[5]_i_1_n_0 ),
        .I1(p_0_in_0),
        .O(reg_index_reg_rep_i_6_n_0));
  LUT6 #(
    .INIT(64'h6AAAAAAA00000000)) 
    reg_index_reg_rep_i_7
       (.I0(reg_index_reg[4]),
        .I1(reg_index_reg[3]),
        .I2(reg_index_reg[1]),
        .I3(reg_index_reg[0]),
        .I4(reg_index_reg[2]),
        .I5(p_0_in_0),
        .O(reg_index_reg_rep_i_7_n_0));
  LUT5 #(
    .INIT(32'h6AAA0000)) 
    reg_index_reg_rep_i_8
       (.I0(reg_index_reg[3]),
        .I1(reg_index_reg[2]),
        .I2(reg_index_reg[0]),
        .I3(reg_index_reg[1]),
        .I4(p_0_in_0),
        .O(reg_index_reg_rep_i_8_n_0));
  LUT4 #(
    .INIT(16'h6A00)) 
    reg_index_reg_rep_i_9
       (.I0(reg_index_reg[2]),
        .I1(reg_index_reg[1]),
        .I2(reg_index_reg[0]),
        .I3(p_0_in_0),
        .O(reg_index_reg_rep_i_9_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \rst_cnt[0]_i_1 
       (.I0(\rst_cnt_reg_n_0_[0] ),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rst_cnt[1]_i_1 
       (.I0(\rst_cnt_reg_n_0_[0] ),
        .I1(\rst_cnt_reg_n_0_[1] ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rst_cnt[2]_i_1 
       (.I0(\rst_cnt_reg_n_0_[0] ),
        .I1(\rst_cnt_reg_n_0_[1] ),
        .I2(\rst_cnt_reg_n_0_[2] ),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \rst_cnt[3]_i_1 
       (.I0(\rst_cnt_reg_n_0_[1] ),
        .I1(\rst_cnt_reg_n_0_[0] ),
        .I2(\rst_cnt_reg_n_0_[2] ),
        .I3(\rst_cnt_reg_n_0_[3] ),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \rst_cnt[4]_i_1 
       (.I0(\rst_cnt_reg_n_0_[2] ),
        .I1(\rst_cnt_reg_n_0_[0] ),
        .I2(\rst_cnt_reg_n_0_[1] ),
        .I3(\rst_cnt_reg_n_0_[3] ),
        .I4(\rst_cnt_reg_n_0_[4] ),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \rst_cnt[5]_i_1 
       (.I0(\rst_cnt_reg_n_0_[3] ),
        .I1(\rst_cnt_reg_n_0_[1] ),
        .I2(\rst_cnt_reg_n_0_[0] ),
        .I3(\rst_cnt_reg_n_0_[2] ),
        .I4(\rst_cnt_reg_n_0_[4] ),
        .I5(\rst_cnt_reg_n_0_[5] ),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rst_cnt[6]_i_1 
       (.I0(\rst_cnt[7]_i_3_n_0 ),
        .I1(\rst_cnt_reg_n_0_[6] ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \rst_cnt[7]_i_1 
       (.I0(\rst_cnt[7]_i_3_n_0 ),
        .I1(\rst_cnt_reg_n_0_[6] ),
        .O(p_0_in[7]));
  LUT1 #(
    .INIT(2'h1)) 
    \rst_cnt[7]_i_2 
       (.I0(rst_n),
        .O(\rst_cnt[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \rst_cnt[7]_i_3 
       (.I0(\rst_cnt_reg_n_0_[5] ),
        .I1(\rst_cnt_reg_n_0_[3] ),
        .I2(\rst_cnt_reg_n_0_[1] ),
        .I3(\rst_cnt_reg_n_0_[0] ),
        .I4(\rst_cnt_reg_n_0_[2] ),
        .I5(\rst_cnt_reg_n_0_[4] ),
        .O(\rst_cnt[7]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \rst_cnt_reg[0] 
       (.C(clk_i),
        .CE(clear),
        .CLR(\rst_cnt[7]_i_2_n_0 ),
        .D(p_0_in[0]),
        .Q(\rst_cnt_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \rst_cnt_reg[1] 
       (.C(clk_i),
        .CE(clear),
        .CLR(\rst_cnt[7]_i_2_n_0 ),
        .D(p_0_in[1]),
        .Q(\rst_cnt_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \rst_cnt_reg[2] 
       (.C(clk_i),
        .CE(clear),
        .CLR(\rst_cnt[7]_i_2_n_0 ),
        .D(p_0_in[2]),
        .Q(\rst_cnt_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \rst_cnt_reg[3] 
       (.C(clk_i),
        .CE(clear),
        .CLR(\rst_cnt[7]_i_2_n_0 ),
        .D(p_0_in[3]),
        .Q(\rst_cnt_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \rst_cnt_reg[4] 
       (.C(clk_i),
        .CE(clear),
        .CLR(\rst_cnt[7]_i_2_n_0 ),
        .D(p_0_in[4]),
        .Q(\rst_cnt_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \rst_cnt_reg[5] 
       (.C(clk_i),
        .CE(clear),
        .CLR(\rst_cnt[7]_i_2_n_0 ),
        .D(p_0_in[5]),
        .Q(\rst_cnt_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \rst_cnt_reg[6] 
       (.C(clk_i),
        .CE(clear),
        .CLR(\rst_cnt[7]_i_2_n_0 ),
        .D(p_0_in[6]),
        .Q(\rst_cnt_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \rst_cnt_reg[7] 
       (.C(clk_i),
        .CE(clear),
        .CLR(\rst_cnt[7]_i_2_n_0 ),
        .D(p_0_in[7]),
        .Q(p_0_in_0));
  system_1_uicfg0308_0_0_uii2c uii2c_inst
       (.DOADO({wr_data[15:8],wr_data[23:16]}),
        .E(uii2c_inst_n_5),
        .\TS_S_reg[1] (uii2c_inst_n_3),
        .clear(clear),
        .clk_i(clk_i),
        .cmos_scl(cmos_scl),
        .cmos_sda(cmos_sda),
        .iic_busy(iic_busy),
        .iic_busy_reg_0(uii2c_inst_n_4),
        .iic_req(iic_req),
        .iic_req_reg(uii2c_inst_n_6),
        .iic_req_reg_0(\TS_S_reg_n_0_[1] ),
        .iic_req_reg_1(\TS_S_reg_n_0_[0] ),
        .p_0_in_0(p_0_in_0),
        .\sda_r_reg[1]_0 (\wr_data_reg_n_0_[6] ));
  FDRE \wr_data_reg[6] 
       (.C(clk_i),
        .CE(uii2c_inst_n_4),
        .D(1'b1),
        .Q(\wr_data_reg_n_0_[6] ),
        .R(clear));
endmodule

(* ORIG_REF_NAME = "uii2c" *) 
module system_1_uicfg0308_0_0_uii2c
   (cmos_scl,
    clear,
    iic_busy,
    \TS_S_reg[1] ,
    iic_busy_reg_0,
    E,
    iic_req_reg,
    cmos_sda,
    clk_i,
    iic_req_reg_0,
    iic_req_reg_1,
    p_0_in_0,
    iic_req,
    DOADO,
    \sda_r_reg[1]_0 );
  output cmos_scl;
  output clear;
  output iic_busy;
  output \TS_S_reg[1] ;
  output iic_busy_reg_0;
  output [0:0]E;
  output iic_req_reg;
  inout cmos_sda;
  input clk_i;
  input iic_req_reg_0;
  input iic_req_reg_1;
  input p_0_in_0;
  input iic_req;
  input [15:0]DOADO;
  input \sda_r_reg[1]_0 ;

  wire [15:0]DOADO;
  wire [0:0]E;
  wire [2:0]IIC_S;
  wire \IIC_S[0]_i_1_n_0 ;
  wire \IIC_S[1]_i_1_n_0 ;
  wire \IIC_S[2]_i_1_n_0 ;
  wire \TS_S_reg[1] ;
  wire bcnt;
  wire \bcnt[0]_i_1_n_0 ;
  wire \bcnt[1]_i_1_n_0 ;
  wire \bcnt[2]_i_1_n_0 ;
  wire \bcnt[2]_i_2_n_0 ;
  wire \bcnt[2]_i_3_n_0 ;
  wire \bcnt[2]_i_5_n_0 ;
  wire \bcnt[2]_i_6_n_0 ;
  wire \bcnt[2]_i_7_n_0 ;
  wire \bcnt_reg_n_0_[0] ;
  wire \bcnt_reg_n_0_[1] ;
  wire \bcnt_reg_n_0_[2] ;
  wire clear;
  wire clk_i;
  wire \clkdiv[6]_i_1_n_0 ;
  wire \clkdiv[6]_i_3_n_0 ;
  wire [6:0]clkdiv_reg;
  wire cmos_scl;
  wire cmos_sda;
  wire iic_bus_error_i_1_n_0;
  wire iic_bus_error_reg_n_0;
  wire iic_busy;
  wire iic_busy_i_1_n_0;
  wire iic_busy_reg_0;
  wire iic_req;
  wire iic_req_reg;
  wire iic_req_reg_0;
  wire iic_req_reg_1;
  wire iic_scl_i_1_n_0;
  wire iic_scl_i_3_n_0;
  wire p_0_in_0;
  wire [6:0]p_0_in__0;
  wire scl_clk;
  wire scl_clk_i_1_n_0;
  wire scl_offset;
  wire sda_i;
  wire sda_o1_out;
  wire sda_r;
  wire sda_r1__0;
  wire \sda_r[0]_i_1_n_0 ;
  wire \sda_r[1]_i_1_n_0 ;
  wire \sda_r[1]_i_2_n_0 ;
  wire \sda_r[2]_i_1_n_0 ;
  wire \sda_r[3]_i_1_n_0 ;
  wire \sda_r[4]_i_1_n_0 ;
  wire \sda_r[5]_i_1_n_0 ;
  wire \sda_r[6]_i_1_n_0 ;
  wire \sda_r[6]_i_2_n_0 ;
  wire \sda_r[7]_i_2_n_0 ;
  wire \sda_r[7]_i_4_n_0 ;
  wire \sda_r[7]_i_5_n_0 ;
  wire \sda_r_reg[1]_0 ;
  wire \sda_r_reg_n_0_[0] ;
  wire \sda_r_reg_n_0_[1] ;
  wire \sda_r_reg_n_0_[2] ;
  wire \sda_r_reg_n_0_[3] ;
  wire \sda_r_reg_n_0_[4] ;
  wire \sda_r_reg_n_0_[5] ;
  wire \sda_r_reg_n_0_[6] ;
  wire \sda_r_reg_n_0_[7] ;
  wire [7:0]wcnt;
  wire \wcnt[0]_i_1_n_0 ;
  wire \wcnt[1]_i_1_n_0 ;
  wire \wcnt[2]_i_1_n_0 ;
  wire \wcnt[3]_i_1_n_0 ;
  wire \wcnt[4]_i_1_n_0 ;
  wire \wcnt[5]_i_1_n_0 ;
  wire \wcnt[5]_i_2_n_0 ;
  wire \wcnt[6]_i_1_n_0 ;
  wire \wcnt[7]_i_1_n_0 ;
  wire \wcnt[7]_i_2_n_0 ;
  wire \wcnt[7]_i_3_n_0 ;
  wire \wcnt[7]_i_4_n_0 ;

  LUT6 #(
    .INIT(64'h00000000999F888E)) 
    \IIC_S[0]_i_1 
       (.I0(IIC_S[2]),
        .I1(IIC_S[1]),
        .I2(\bcnt_reg_n_0_[2] ),
        .I3(\bcnt[2]_i_2_n_0 ),
        .I4(iic_req),
        .I5(IIC_S[0]),
        .O(\IIC_S[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6E)) 
    \IIC_S[1]_i_1 
       (.I0(IIC_S[0]),
        .I1(IIC_S[1]),
        .I2(IIC_S[2]),
        .O(\IIC_S[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h3F40)) 
    \IIC_S[2]_i_1 
       (.I0(\bcnt[2]_i_3_n_0 ),
        .I1(IIC_S[0]),
        .I2(IIC_S[1]),
        .I3(IIC_S[2]),
        .O(\IIC_S[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \IIC_S[2]_i_2 
       (.I0(p_0_in_0),
        .O(clear));
  FDCE #(
    .INIT(1'b0)) 
    \IIC_S_reg[0] 
       (.C(scl_clk),
        .CE(1'b1),
        .CLR(clear),
        .D(\IIC_S[0]_i_1_n_0 ),
        .Q(IIC_S[0]));
  FDCE #(
    .INIT(1'b0)) 
    \IIC_S_reg[1] 
       (.C(scl_clk),
        .CE(1'b1),
        .CLR(clear),
        .D(\IIC_S[1]_i_1_n_0 ),
        .Q(IIC_S[1]));
  FDCE #(
    .INIT(1'b0)) 
    \IIC_S_reg[2] 
       (.C(scl_clk),
        .CE(1'b1),
        .CLR(clear),
        .D(\IIC_S[2]_i_1_n_0 ),
        .Q(IIC_S[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IOBUF #(
    .IOSTANDARD("DEFAULT")) 
    IOBUF_inst
       (.I(sda_o1_out),
        .IO(cmos_sda),
        .O(sda_i),
        .T(sda_o1_out));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hF3CB)) 
    IOBUF_inst_i_1
       (.I0(\sda_r_reg_n_0_[7] ),
        .I1(IIC_S[1]),
        .I2(IIC_S[0]),
        .I3(IIC_S[2]),
        .O(sda_o1_out));
  LUT5 #(
    .INIT(32'hB0FFBF00)) 
    \bcnt[0]_i_1 
       (.I0(\bcnt[2]_i_3_n_0 ),
        .I1(IIC_S[1]),
        .I2(IIC_S[0]),
        .I3(bcnt),
        .I4(\bcnt_reg_n_0_[0] ),
        .O(\bcnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE2EEFFFFD1DD0000)) 
    \bcnt[1]_i_1 
       (.I0(\bcnt_reg_n_0_[0] ),
        .I1(IIC_S[0]),
        .I2(\bcnt[2]_i_3_n_0 ),
        .I3(IIC_S[1]),
        .I4(bcnt),
        .I5(\bcnt_reg_n_0_[1] ),
        .O(\bcnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE2EEFFFFD1DD0000)) 
    \bcnt[2]_i_1 
       (.I0(\bcnt[2]_i_2_n_0 ),
        .I1(IIC_S[0]),
        .I2(\bcnt[2]_i_3_n_0 ),
        .I3(IIC_S[1]),
        .I4(bcnt),
        .I5(\bcnt_reg_n_0_[2] ),
        .O(\bcnt[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \bcnt[2]_i_2 
       (.I0(\bcnt_reg_n_0_[1] ),
        .I1(\bcnt_reg_n_0_[0] ),
        .O(\bcnt[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h01110000)) 
    \bcnt[2]_i_3 
       (.I0(wcnt[6]),
        .I1(wcnt[7]),
        .I2(wcnt[1]),
        .I3(wcnt[0]),
        .I4(\bcnt[2]_i_5_n_0 ),
        .O(\bcnt[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAA20000000)) 
    \bcnt[2]_i_4 
       (.I0(p_0_in_0),
        .I1(IIC_S[2]),
        .I2(IIC_S[0]),
        .I3(\bcnt[2]_i_5_n_0 ),
        .I4(\bcnt[2]_i_6_n_0 ),
        .I5(\bcnt[2]_i_7_n_0 ),
        .O(bcnt));
  LUT4 #(
    .INIT(16'h0001)) 
    \bcnt[2]_i_5 
       (.I0(wcnt[3]),
        .I1(wcnt[2]),
        .I2(wcnt[5]),
        .I3(wcnt[4]),
        .O(\bcnt[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0007)) 
    \bcnt[2]_i_6 
       (.I0(wcnt[0]),
        .I1(wcnt[1]),
        .I2(wcnt[7]),
        .I3(wcnt[6]),
        .O(\bcnt[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1E1E1E1E1E1E1E0E)) 
    \bcnt[2]_i_7 
       (.I0(IIC_S[0]),
        .I1(IIC_S[2]),
        .I2(IIC_S[1]),
        .I3(\bcnt_reg_n_0_[2] ),
        .I4(\bcnt_reg_n_0_[1] ),
        .I5(\bcnt_reg_n_0_[0] ),
        .O(\bcnt[2]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bcnt_reg[0] 
       (.C(scl_clk),
        .CE(1'b1),
        .D(\bcnt[0]_i_1_n_0 ),
        .Q(\bcnt_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bcnt_reg[1] 
       (.C(scl_clk),
        .CE(1'b1),
        .D(\bcnt[1]_i_1_n_0 ),
        .Q(\bcnt_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bcnt_reg[2] 
       (.C(scl_clk),
        .CE(1'b1),
        .D(\bcnt[2]_i_1_n_0 ),
        .Q(\bcnt_reg_n_0_[2] ),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \clkdiv[0]_i_1 
       (.I0(clkdiv_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clkdiv[1]_i_1 
       (.I0(clkdiv_reg[0]),
        .I1(clkdiv_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \clkdiv[2]_i_1 
       (.I0(clkdiv_reg[1]),
        .I1(clkdiv_reg[0]),
        .I2(clkdiv_reg[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \clkdiv[3]_i_1 
       (.I0(clkdiv_reg[0]),
        .I1(clkdiv_reg[1]),
        .I2(clkdiv_reg[2]),
        .I3(clkdiv_reg[3]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \clkdiv[4]_i_1 
       (.I0(clkdiv_reg[2]),
        .I1(clkdiv_reg[1]),
        .I2(clkdiv_reg[0]),
        .I3(clkdiv_reg[3]),
        .I4(clkdiv_reg[4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \clkdiv[5]_i_1 
       (.I0(clkdiv_reg[3]),
        .I1(clkdiv_reg[0]),
        .I2(clkdiv_reg[1]),
        .I3(clkdiv_reg[2]),
        .I4(clkdiv_reg[4]),
        .I5(clkdiv_reg[5]),
        .O(p_0_in__0[5]));
  LUT6 #(
    .INIT(64'h8888888888888880)) 
    \clkdiv[6]_i_1 
       (.I0(clkdiv_reg[6]),
        .I1(clkdiv_reg[5]),
        .I2(clkdiv_reg[4]),
        .I3(clkdiv_reg[3]),
        .I4(clkdiv_reg[2]),
        .I5(\clkdiv[6]_i_3_n_0 ),
        .O(\clkdiv[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \clkdiv[6]_i_2 
       (.I0(clkdiv_reg[4]),
        .I1(clkdiv_reg[2]),
        .I2(\clkdiv[6]_i_3_n_0 ),
        .I3(clkdiv_reg[3]),
        .I4(clkdiv_reg[5]),
        .I5(clkdiv_reg[6]),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \clkdiv[6]_i_3 
       (.I0(clkdiv_reg[0]),
        .I1(clkdiv_reg[1]),
        .O(\clkdiv[6]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[0] 
       (.C(clk_i),
        .CE(1'b1),
        .D(p_0_in__0[0]),
        .Q(clkdiv_reg[0]),
        .R(\clkdiv[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[1] 
       (.C(clk_i),
        .CE(1'b1),
        .D(p_0_in__0[1]),
        .Q(clkdiv_reg[1]),
        .R(\clkdiv[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[2] 
       (.C(clk_i),
        .CE(1'b1),
        .D(p_0_in__0[2]),
        .Q(clkdiv_reg[2]),
        .R(\clkdiv[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[3] 
       (.C(clk_i),
        .CE(1'b1),
        .D(p_0_in__0[3]),
        .Q(clkdiv_reg[3]),
        .R(\clkdiv[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[4] 
       (.C(clk_i),
        .CE(1'b1),
        .D(p_0_in__0[4]),
        .Q(clkdiv_reg[4]),
        .R(\clkdiv[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[5] 
       (.C(clk_i),
        .CE(1'b1),
        .D(p_0_in__0[5]),
        .Q(clkdiv_reg[5]),
        .R(\clkdiv[6]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[6] 
       (.C(clk_i),
        .CE(1'b1),
        .D(p_0_in__0[6]),
        .Q(clkdiv_reg[6]),
        .R(\clkdiv[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF008000800080)) 
    iic_bus_error_i_1
       (.I0(IIC_S[0]),
        .I1(IIC_S[1]),
        .I2(sda_i),
        .I3(IIC_S[2]),
        .I4(iic_req),
        .I5(iic_bus_error_reg_n_0),
        .O(iic_bus_error_i_1_n_0));
  FDCE #(
    .IS_C_INVERTED(1'b1)) 
    iic_bus_error_reg
       (.C(scl_clk),
        .CE(1'b1),
        .CLR(clear),
        .D(iic_bus_error_i_1_n_0),
        .Q(iic_bus_error_reg_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFEEEEEEEEE)) 
    iic_busy_i_1
       (.I0(iic_bus_error_reg_n_0),
        .I1(iic_req),
        .I2(IIC_S[0]),
        .I3(IIC_S[2]),
        .I4(IIC_S[1]),
        .I5(iic_busy),
        .O(iic_busy_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    iic_busy_reg
       (.C(scl_clk),
        .CE(1'b1),
        .CLR(clear),
        .D(iic_busy_i_1_n_0),
        .Q(iic_busy));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hA2BA0000)) 
    iic_req_i_1
       (.I0(iic_req),
        .I1(iic_busy),
        .I2(iic_req_reg_1),
        .I3(iic_req_reg_0),
        .I4(p_0_in_0),
        .O(iic_req_reg));
  LUT6 #(
    .INIT(64'hFFFFFF00A1A1FF00)) 
    iic_scl_i_1
       (.I0(IIC_S[2]),
        .I1(IIC_S[0]),
        .I2(IIC_S[1]),
        .I3(cmos_scl),
        .I4(scl_offset),
        .I5(scl_clk),
        .O(iic_scl_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    iic_scl_i_2
       (.I0(iic_scl_i_3_n_0),
        .I1(clkdiv_reg[0]),
        .I2(clkdiv_reg[1]),
        .I3(clkdiv_reg[2]),
        .O(scl_offset));
  LUT4 #(
    .INIT(16'h0400)) 
    iic_scl_i_3
       (.I0(clkdiv_reg[5]),
        .I1(clkdiv_reg[6]),
        .I2(clkdiv_reg[4]),
        .I3(clkdiv_reg[3]),
        .O(iic_scl_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    iic_scl_reg
       (.C(clk_i),
        .CE(1'b1),
        .D(iic_scl_i_1_n_0),
        .Q(cmos_scl),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \reg_index[8]_i_1 
       (.I0(iic_busy),
        .I1(iic_req_reg_1),
        .I2(iic_req_reg_0),
        .O(E));
  LUT4 #(
    .INIT(16'h08FF)) 
    reg_index_reg_rep_i_1
       (.I0(iic_req_reg_0),
        .I1(iic_req_reg_1),
        .I2(iic_busy),
        .I3(p_0_in_0),
        .O(\TS_S_reg[1] ));
  LUT3 #(
    .INIT(8'h04)) 
    reg_index_reg_rep_i_2
       (.I0(iic_busy),
        .I1(iic_req_reg_1),
        .I2(iic_req_reg_0),
        .O(iic_busy_reg_0));
  LUT2 #(
    .INIT(4'h6)) 
    scl_clk_i_1
       (.I0(\clkdiv[6]_i_1_n_0 ),
        .I1(scl_clk),
        .O(scl_clk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    scl_clk_reg
       (.C(clk_i),
        .CE(1'b1),
        .D(scl_clk_i_1_n_0),
        .Q(scl_clk),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h555555555DF55D55)) 
    \sda_r[0]_i_1 
       (.I0(sda_r1__0),
        .I1(DOADO[8]),
        .I2(wcnt[1]),
        .I3(wcnt[0]),
        .I4(DOADO[0]),
        .I5(wcnt[2]),
        .O(\sda_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    \sda_r[1]_i_1 
       (.I0(\sda_r[1]_i_2_n_0 ),
        .I1(wcnt[2]),
        .I2(IIC_S[0]),
        .I3(\sda_r_reg_n_0_[0] ),
        .O(\sda_r[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \sda_r[1]_i_2 
       (.I0(\sda_r_reg[1]_0 ),
        .I1(DOADO[9]),
        .I2(DOADO[1]),
        .I3(wcnt[1]),
        .I4(wcnt[0]),
        .O(\sda_r[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \sda_r[2]_i_1 
       (.I0(\sda_r_reg_n_0_[1] ),
        .I1(sda_r1__0),
        .I2(\sda_r[7]_i_4_n_0 ),
        .I3(DOADO[10]),
        .I4(DOADO[2]),
        .I5(\sda_r[7]_i_5_n_0 ),
        .O(\sda_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \sda_r[3]_i_1 
       (.I0(\sda_r_reg_n_0_[2] ),
        .I1(sda_r1__0),
        .I2(\sda_r[7]_i_4_n_0 ),
        .I3(DOADO[11]),
        .I4(DOADO[3]),
        .I5(\sda_r[7]_i_5_n_0 ),
        .O(\sda_r[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \sda_r[4]_i_1 
       (.I0(\sda_r_reg_n_0_[3] ),
        .I1(sda_r1__0),
        .I2(\sda_r[7]_i_4_n_0 ),
        .I3(DOADO[12]),
        .I4(DOADO[4]),
        .I5(\sda_r[7]_i_5_n_0 ),
        .O(\sda_r[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \sda_r[5]_i_1 
       (.I0(\sda_r_reg_n_0_[4] ),
        .I1(sda_r1__0),
        .I2(\sda_r[7]_i_4_n_0 ),
        .I3(DOADO[13]),
        .I4(DOADO[5]),
        .I5(\sda_r[7]_i_5_n_0 ),
        .O(\sda_r[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h2F20)) 
    \sda_r[6]_i_1 
       (.I0(\sda_r[6]_i_2_n_0 ),
        .I1(wcnt[2]),
        .I2(IIC_S[0]),
        .I3(\sda_r_reg_n_0_[5] ),
        .O(\sda_r[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \sda_r[6]_i_2 
       (.I0(\sda_r_reg[1]_0 ),
        .I1(DOADO[14]),
        .I2(DOADO[6]),
        .I3(wcnt[1]),
        .I4(wcnt[0]),
        .O(\sda_r[6]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h0E)) 
    \sda_r[7]_i_1 
       (.I0(IIC_S[1]),
        .I1(IIC_S[0]),
        .I2(IIC_S[2]),
        .O(sda_r));
  LUT6 #(
    .INIT(64'hFFFFF222F222F222)) 
    \sda_r[7]_i_2 
       (.I0(\sda_r_reg_n_0_[6] ),
        .I1(sda_r1__0),
        .I2(\sda_r[7]_i_4_n_0 ),
        .I3(DOADO[15]),
        .I4(DOADO[7]),
        .I5(\sda_r[7]_i_5_n_0 ),
        .O(\sda_r[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \sda_r[7]_i_3 
       (.I0(IIC_S[2]),
        .I1(IIC_S[0]),
        .O(sda_r1__0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00040000)) 
    \sda_r[7]_i_4 
       (.I0(wcnt[1]),
        .I1(wcnt[0]),
        .I2(wcnt[2]),
        .I3(IIC_S[2]),
        .I4(IIC_S[0]),
        .O(\sda_r[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00040000)) 
    \sda_r[7]_i_5 
       (.I0(wcnt[0]),
        .I1(wcnt[1]),
        .I2(wcnt[2]),
        .I3(IIC_S[2]),
        .I4(IIC_S[0]),
        .O(\sda_r[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sda_r_reg[0] 
       (.C(scl_clk),
        .CE(sda_r),
        .D(\sda_r[0]_i_1_n_0 ),
        .Q(\sda_r_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sda_r_reg[1] 
       (.C(scl_clk),
        .CE(sda_r),
        .D(\sda_r[1]_i_1_n_0 ),
        .Q(\sda_r_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sda_r_reg[2] 
       (.C(scl_clk),
        .CE(sda_r),
        .D(\sda_r[2]_i_1_n_0 ),
        .Q(\sda_r_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sda_r_reg[3] 
       (.C(scl_clk),
        .CE(sda_r),
        .D(\sda_r[3]_i_1_n_0 ),
        .Q(\sda_r_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sda_r_reg[4] 
       (.C(scl_clk),
        .CE(sda_r),
        .D(\sda_r[4]_i_1_n_0 ),
        .Q(\sda_r_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sda_r_reg[5] 
       (.C(scl_clk),
        .CE(sda_r),
        .D(\sda_r[5]_i_1_n_0 ),
        .Q(\sda_r_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sda_r_reg[6] 
       (.C(scl_clk),
        .CE(sda_r),
        .D(\sda_r[6]_i_1_n_0 ),
        .Q(\sda_r_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sda_r_reg[7] 
       (.C(scl_clk),
        .CE(sda_r),
        .D(\sda_r[7]_i_2_n_0 ),
        .Q(\sda_r_reg_n_0_[7] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \wcnt[0]_i_1 
       (.I0(IIC_S[1]),
        .I1(wcnt[0]),
        .O(\wcnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \wcnt[1]_i_1 
       (.I0(IIC_S[1]),
        .I1(wcnt[0]),
        .I2(wcnt[1]),
        .O(\wcnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \wcnt[2]_i_1 
       (.I0(wcnt[1]),
        .I1(wcnt[0]),
        .I2(IIC_S[1]),
        .I3(wcnt[2]),
        .O(\wcnt[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \wcnt[3]_i_1 
       (.I0(wcnt[2]),
        .I1(wcnt[0]),
        .I2(wcnt[1]),
        .I3(IIC_S[1]),
        .I4(wcnt[3]),
        .O(\wcnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \wcnt[4]_i_1 
       (.I0(wcnt[3]),
        .I1(wcnt[1]),
        .I2(wcnt[0]),
        .I3(wcnt[2]),
        .I4(IIC_S[1]),
        .I5(wcnt[4]),
        .O(\wcnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7FF000008000000)) 
    \wcnt[5]_i_1 
       (.I0(wcnt[4]),
        .I1(wcnt[2]),
        .I2(\wcnt[5]_i_2_n_0 ),
        .I3(wcnt[3]),
        .I4(IIC_S[1]),
        .I5(wcnt[5]),
        .O(\wcnt[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \wcnt[5]_i_2 
       (.I0(wcnt[1]),
        .I1(wcnt[0]),
        .O(\wcnt[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \wcnt[6]_i_1 
       (.I0(\wcnt[7]_i_4_n_0 ),
        .I1(IIC_S[1]),
        .I2(wcnt[6]),
        .O(\wcnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00010000000100FF)) 
    \wcnt[7]_i_1 
       (.I0(\bcnt_reg_n_0_[0] ),
        .I1(\bcnt_reg_n_0_[1] ),
        .I2(\bcnt_reg_n_0_[2] ),
        .I3(\wcnt[7]_i_3_n_0 ),
        .I4(IIC_S[1]),
        .I5(iic_req),
        .O(\wcnt[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \wcnt[7]_i_2 
       (.I0(wcnt[6]),
        .I1(\wcnt[7]_i_4_n_0 ),
        .I2(IIC_S[1]),
        .I3(wcnt[7]),
        .O(\wcnt[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \wcnt[7]_i_3 
       (.I0(IIC_S[0]),
        .I1(IIC_S[2]),
        .O(\wcnt[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \wcnt[7]_i_4 
       (.I0(wcnt[5]),
        .I1(wcnt[3]),
        .I2(wcnt[1]),
        .I3(wcnt[0]),
        .I4(wcnt[2]),
        .I5(wcnt[4]),
        .O(\wcnt[7]_i_4_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \wcnt_reg[0] 
       (.C(scl_clk),
        .CE(\wcnt[7]_i_1_n_0 ),
        .CLR(clear),
        .D(\wcnt[0]_i_1_n_0 ),
        .Q(wcnt[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wcnt_reg[1] 
       (.C(scl_clk),
        .CE(\wcnt[7]_i_1_n_0 ),
        .CLR(clear),
        .D(\wcnt[1]_i_1_n_0 ),
        .Q(wcnt[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wcnt_reg[2] 
       (.C(scl_clk),
        .CE(\wcnt[7]_i_1_n_0 ),
        .CLR(clear),
        .D(\wcnt[2]_i_1_n_0 ),
        .Q(wcnt[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wcnt_reg[3] 
       (.C(scl_clk),
        .CE(\wcnt[7]_i_1_n_0 ),
        .CLR(clear),
        .D(\wcnt[3]_i_1_n_0 ),
        .Q(wcnt[3]));
  FDCE #(
    .INIT(1'b0)) 
    \wcnt_reg[4] 
       (.C(scl_clk),
        .CE(\wcnt[7]_i_1_n_0 ),
        .CLR(clear),
        .D(\wcnt[4]_i_1_n_0 ),
        .Q(wcnt[4]));
  FDCE #(
    .INIT(1'b0)) 
    \wcnt_reg[5] 
       (.C(scl_clk),
        .CE(\wcnt[7]_i_1_n_0 ),
        .CLR(clear),
        .D(\wcnt[5]_i_1_n_0 ),
        .Q(wcnt[5]));
  FDCE #(
    .INIT(1'b0)) 
    \wcnt_reg[6] 
       (.C(scl_clk),
        .CE(\wcnt[7]_i_1_n_0 ),
        .CLR(clear),
        .D(\wcnt[6]_i_1_n_0 ),
        .Q(wcnt[6]));
  FDCE #(
    .INIT(1'b0)) 
    \wcnt_reg[7] 
       (.C(scl_clk),
        .CE(\wcnt[7]_i_1_n_0 ),
        .CLR(clear),
        .D(\wcnt[7]_i_2_n_0 ),
        .Q(wcnt[7]));
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
