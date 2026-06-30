-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Thu May 28 14:47:58 2026
-- Host        : sw running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/FPGAcam/udp_cam/udp_cam.srcs/sources_1/bd/system_1/ip/system_1_uicfg0308_0_0/system_1_uicfg0308_0_0_stub.vhdl
-- Design      : system_1_uicfg0308_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_1_uicfg0308_0_0 is
  Port ( 
    clk_i : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    cmos_scl : out STD_LOGIC;
    cmos_sda : inout STD_LOGIC;
    cfg_done : out STD_LOGIC
  );

end system_1_uicfg0308_0_0;

architecture stub of system_1_uicfg0308_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_i,rst_n,cmos_scl,cmos_sda,cfg_done";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "uicfg0308,Vivado 2019.2";
begin
end;
