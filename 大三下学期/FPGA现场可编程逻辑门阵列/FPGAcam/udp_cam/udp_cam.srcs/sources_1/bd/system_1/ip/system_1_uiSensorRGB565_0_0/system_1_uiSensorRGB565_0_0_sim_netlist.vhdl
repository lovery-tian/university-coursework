-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Thu May 28 14:47:56 2026
-- Host        : sw running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/FPGAcam/udp_cam/udp_cam.srcs/sources_1/bd/system_1/ip/system_1_uiSensorRGB565_0_0/system_1_uiSensorRGB565_0_0_sim_netlist.vhdl
-- Design      : system_1_uiSensorRGB565_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_1_uiSensorRGB565_0_0_uiSensorRGB565 is
  port (
    rgb_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    de_o : out STD_LOGIC;
    vs_o : out STD_LOGIC;
    hs_o : out STD_LOGIC;
    cmos_pclk_i : in STD_LOGIC;
    cmos_href_i : in STD_LOGIC;
    cmos_data_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    cmos_vsync_i : in STD_LOGIC;
    rstn_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_1_uiSensorRGB565_0_0_uiSensorRGB565 : entity is "uiSensorRGB565";
end system_1_uiSensorRGB565_0_0_uiSensorRGB565;

architecture STRUCTURE of system_1_uiSensorRGB565_0_0_uiSensorRGB565 is
  signal clear : STD_LOGIC;
  signal cmos_data_r1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal cmos_data_r2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal cmos_href_r1 : STD_LOGIC;
  signal cmos_href_r2 : STD_LOGIC;
  signal cmos_href_r3 : STD_LOGIC;
  signal cmos_vsync_r1 : STD_LOGIC;
  signal cmos_vsync_r2 : STD_LOGIC;
  signal data_en : STD_LOGIC;
  signal data_en_i_1_n_0 : STD_LOGIC;
  signal href_cnt : STD_LOGIC;
  signal href_cnt_i_1_n_0 : STD_LOGIC;
  signal \out_en__2\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \rgb2[15]_i_1_n_0\ : STD_LOGIC;
  signal \^rgb_o\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rstn1 : STD_LOGIC;
  signal rstn1_i_1_n_0 : STD_LOGIC;
  signal rstn2 : STD_LOGIC;
  signal vs_cnt : STD_LOGIC;
  signal vs_cnt_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of data_en_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of href_cnt_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rgb2[15]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \vs_cnt[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \vs_cnt[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \vs_cnt[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \vs_cnt[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \vs_cnt[4]_i_3\ : label is "soft_lutpair1";
begin
  rgb_o(15 downto 0) <= \^rgb_o\(15 downto 0);
\cmos_data_r1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_i(0),
      Q => cmos_data_r1(0),
      R => '0'
    );
\cmos_data_r1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_i(1),
      Q => cmos_data_r1(1),
      R => '0'
    );
\cmos_data_r1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_i(2),
      Q => cmos_data_r1(2),
      R => '0'
    );
\cmos_data_r1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_i(3),
      Q => cmos_data_r1(3),
      R => '0'
    );
\cmos_data_r1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_i(4),
      Q => cmos_data_r1(4),
      R => '0'
    );
\cmos_data_r1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_i(5),
      Q => cmos_data_r1(5),
      R => '0'
    );
\cmos_data_r1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_i(6),
      Q => cmos_data_r1(6),
      R => '0'
    );
\cmos_data_r1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_i(7),
      Q => cmos_data_r1(7),
      R => '0'
    );
\cmos_data_r2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_r1(0),
      Q => cmos_data_r2(0),
      R => '0'
    );
\cmos_data_r2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_r1(1),
      Q => cmos_data_r2(1),
      R => '0'
    );
\cmos_data_r2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_r1(2),
      Q => cmos_data_r2(2),
      R => '0'
    );
\cmos_data_r2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_r1(3),
      Q => cmos_data_r2(3),
      R => '0'
    );
\cmos_data_r2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_r1(4),
      Q => cmos_data_r2(4),
      R => '0'
    );
\cmos_data_r2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_r1(5),
      Q => cmos_data_r2(5),
      R => '0'
    );
\cmos_data_r2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_r1(6),
      Q => cmos_data_r2(6),
      R => '0'
    );
\cmos_data_r2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_data_r1(7),
      Q => cmos_data_r2(7),
      R => '0'
    );
cmos_href_r1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_href_i,
      Q => cmos_href_r1,
      R => '0'
    );
cmos_href_r2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_href_r1,
      Q => cmos_href_r2,
      R => '0'
    );
cmos_href_r3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_href_r2,
      Q => cmos_href_r3,
      R => '0'
    );
cmos_vsync_r1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cmos_vsync_i,
      O => p_0_in
    );
cmos_vsync_r1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => p_0_in,
      Q => cmos_vsync_r1,
      R => '0'
    );
cmos_vsync_r2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => cmos_vsync_r1,
      Q => cmos_vsync_r2,
      R => '0'
    );
data_en_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8808"
    )
        port map (
      I0 => href_cnt,
      I1 => \out_en__2\,
      I2 => cmos_vsync_r1,
      I3 => cmos_vsync_r2,
      O => data_en_i_1_n_0
    );
data_en_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => data_en_i_1_n_0,
      Q => data_en,
      R => '0'
    );
de_o_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => vs_cnt_reg(2),
      I1 => vs_cnt_reg(1),
      I2 => vs_cnt_reg(4),
      I3 => vs_cnt_reg(3),
      I4 => vs_cnt_reg(0),
      I5 => data_en,
      O => de_o
    );
href_cnt_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008A00"
    )
        port map (
      I0 => cmos_href_r2,
      I1 => cmos_vsync_r2,
      I2 => cmos_vsync_r1,
      I3 => \out_en__2\,
      I4 => href_cnt,
      O => href_cnt_i_1_n_0
    );
href_cnt_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => '1',
      D => href_cnt_i_1_n_0,
      Q => href_cnt,
      R => '0'
    );
hs_o_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => vs_cnt_reg(2),
      I1 => vs_cnt_reg(1),
      I2 => vs_cnt_reg(4),
      I3 => vs_cnt_reg(3),
      I4 => vs_cnt_reg(0),
      I5 => cmos_href_r3,
      O => hs_o
    );
\rgb2[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => cmos_vsync_r2,
      I1 => cmos_vsync_r1,
      I2 => \out_en__2\,
      O => \rgb2[15]_i_1_n_0\
    );
\rgb2[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => vs_cnt_reg(0),
      I1 => vs_cnt_reg(3),
      I2 => vs_cnt_reg(4),
      I3 => vs_cnt_reg(1),
      I4 => vs_cnt_reg(2),
      O => \out_en__2\
    );
\rgb2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => cmos_data_r2(0),
      Q => \^rgb_o\(0),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => \^rgb_o\(2),
      Q => \^rgb_o\(10),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => \^rgb_o\(3),
      Q => \^rgb_o\(11),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => \^rgb_o\(4),
      Q => \^rgb_o\(12),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => \^rgb_o\(5),
      Q => \^rgb_o\(13),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => \^rgb_o\(6),
      Q => \^rgb_o\(14),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => \^rgb_o\(7),
      Q => \^rgb_o\(15),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => cmos_data_r2(1),
      Q => \^rgb_o\(1),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => cmos_data_r2(2),
      Q => \^rgb_o\(2),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => cmos_data_r2(3),
      Q => \^rgb_o\(3),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => cmos_data_r2(4),
      Q => \^rgb_o\(4),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => cmos_data_r2(5),
      Q => \^rgb_o\(5),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => cmos_data_r2(6),
      Q => \^rgb_o\(6),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => cmos_data_r2(7),
      Q => \^rgb_o\(7),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => \^rgb_o\(0),
      Q => \^rgb_o\(8),
      R => \rgb2[15]_i_1_n_0\
    );
\rgb2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => cmos_pclk_i,
      CE => cmos_href_r2,
      D => \^rgb_o\(1),
      Q => \^rgb_o\(9),
      R => \rgb2[15]_i_1_n_0\
    );
rstn1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rstn_i,
      O => rstn1_i_1_n_0
    );
rstn1_reg: unisim.vcomponents.FDCE
     port map (
      C => cmos_pclk_i,
      CE => '1',
      CLR => rstn1_i_1_n_0,
      D => '1',
      Q => rstn1
    );
rstn2_reg: unisim.vcomponents.FDCE
     port map (
      C => cmos_pclk_i,
      CE => '1',
      CLR => rstn1_i_1_n_0,
      D => rstn1,
      Q => rstn2
    );
\vs_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => vs_cnt_reg(0),
      O => \p_0_in__0\(0)
    );
\vs_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => vs_cnt_reg(0),
      I1 => vs_cnt_reg(1),
      O => \p_0_in__0\(1)
    );
\vs_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => vs_cnt_reg(0),
      I1 => vs_cnt_reg(1),
      I2 => vs_cnt_reg(2),
      O => \p_0_in__0\(2)
    );
\vs_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => vs_cnt_reg(1),
      I1 => vs_cnt_reg(0),
      I2 => vs_cnt_reg(2),
      I3 => vs_cnt_reg(3),
      O => \p_0_in__0\(3)
    );
\vs_cnt[4]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rstn2,
      O => clear
    );
\vs_cnt[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0444444444444444"
    )
        port map (
      I0 => cmos_vsync_r2,
      I1 => cmos_vsync_r1,
      I2 => vs_cnt_reg(3),
      I3 => vs_cnt_reg(4),
      I4 => vs_cnt_reg(1),
      I5 => vs_cnt_reg(2),
      O => vs_cnt
    );
\vs_cnt[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => vs_cnt_reg(2),
      I1 => vs_cnt_reg(0),
      I2 => vs_cnt_reg(1),
      I3 => vs_cnt_reg(3),
      I4 => vs_cnt_reg(4),
      O => \p_0_in__0\(4)
    );
\vs_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => cmos_pclk_i,
      CE => vs_cnt,
      D => \p_0_in__0\(0),
      Q => vs_cnt_reg(0),
      R => clear
    );
\vs_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => cmos_pclk_i,
      CE => vs_cnt,
      D => \p_0_in__0\(1),
      Q => vs_cnt_reg(1),
      R => clear
    );
\vs_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => cmos_pclk_i,
      CE => vs_cnt,
      D => \p_0_in__0\(2),
      Q => vs_cnt_reg(2),
      R => clear
    );
\vs_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => cmos_pclk_i,
      CE => vs_cnt,
      D => \p_0_in__0\(3),
      Q => vs_cnt_reg(3),
      R => clear
    );
\vs_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => cmos_pclk_i,
      CE => vs_cnt,
      D => \p_0_in__0\(4),
      Q => vs_cnt_reg(4),
      R => clear
    );
vs_o_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => vs_cnt_reg(2),
      I1 => vs_cnt_reg(1),
      I2 => vs_cnt_reg(4),
      I3 => vs_cnt_reg(3),
      I4 => vs_cnt_reg(0),
      I5 => cmos_vsync_r2,
      O => vs_o
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_1_uiSensorRGB565_0_0 is
  port (
    rstn_i : in STD_LOGIC;
    cmos_clk_i : in STD_LOGIC;
    cmos_pclk_i : in STD_LOGIC;
    cmos_href_i : in STD_LOGIC;
    cmos_vsync_i : in STD_LOGIC;
    cmos_data_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    cmos_xclk_o : out STD_LOGIC;
    rgb_o : out STD_LOGIC_VECTOR ( 23 downto 0 );
    de_o : out STD_LOGIC;
    vs_o : out STD_LOGIC;
    hs_o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_1_uiSensorRGB565_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_1_uiSensorRGB565_0_0 : entity is "system_1_uiSensorRGB565_0_0,uiSensorRGB565,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_1_uiSensorRGB565_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_1_uiSensorRGB565_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_1_uiSensorRGB565_0_0 : entity is "uiSensorRGB565,Vivado 2019.2";
end system_1_uiSensorRGB565_0_0;

architecture STRUCTURE of system_1_uiSensorRGB565_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^cmos_clk_i\ : STD_LOGIC;
  signal \^rgb_o\ : STD_LOGIC_VECTOR ( 23 downto 3 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of cmos_clk_i : signal is "xilinx.com:signal:clock:1.0 cmos_clk_i CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of cmos_clk_i : signal is "XIL_INTERFACENAME cmos_clk_i, ASSOCIATED_RESET rstn_i, FREQ_HZ 24000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of cmos_pclk_i : signal is "xilinx.com:signal:clock:1.0 cmos_pclk_i CLK";
  attribute X_INTERFACE_PARAMETER of cmos_pclk_i : signal is "XIL_INTERFACENAME cmos_pclk_i, ASSOCIATED_RESET rstn_i, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_1_cmos_pclk_i_1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of cmos_xclk_o : signal is "xilinx.com:signal:clock:1.0 cmos_xclk_o CLK";
  attribute X_INTERFACE_PARAMETER of cmos_xclk_o : signal is "XIL_INTERFACENAME cmos_xclk_o, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_1_uiSensorRGB565_0_0_cmos_xclk_o, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of de_o : signal is "xilinx.com:interface:vid_io:1.0 svidout ACTIVE_VIDEO";
  attribute X_INTERFACE_INFO of hs_o : signal is "xilinx.com:interface:vid_io:1.0 svidout HSYNC";
  attribute X_INTERFACE_INFO of rstn_i : signal is "xilinx.com:signal:reset:1.0 rstn_i RST";
  attribute X_INTERFACE_PARAMETER of rstn_i : signal is "XIL_INTERFACENAME rstn_i, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of vs_o : signal is "xilinx.com:interface:vid_io:1.0 svidout VSYNC";
  attribute X_INTERFACE_INFO of rgb_o : signal is "xilinx.com:interface:vid_io:1.0 svidout DATA";
begin
  \^cmos_clk_i\ <= cmos_clk_i;
  cmos_xclk_o <= \^cmos_clk_i\;
  rgb_o(23 downto 19) <= \^rgb_o\(23 downto 19);
  rgb_o(18) <= \<const0>\;
  rgb_o(17) <= \<const0>\;
  rgb_o(16) <= \<const0>\;
  rgb_o(15 downto 10) <= \^rgb_o\(15 downto 10);
  rgb_o(9) <= \<const0>\;
  rgb_o(8) <= \<const0>\;
  rgb_o(7 downto 3) <= \^rgb_o\(7 downto 3);
  rgb_o(2) <= \<const0>\;
  rgb_o(1) <= \<const0>\;
  rgb_o(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.system_1_uiSensorRGB565_0_0_uiSensorRGB565
     port map (
      cmos_data_i(7 downto 0) => cmos_data_i(7 downto 0),
      cmos_href_i => cmos_href_i,
      cmos_pclk_i => cmos_pclk_i,
      cmos_vsync_i => cmos_vsync_i,
      de_o => de_o,
      hs_o => hs_o,
      rgb_o(15 downto 11) => \^rgb_o\(23 downto 19),
      rgb_o(10 downto 5) => \^rgb_o\(15 downto 10),
      rgb_o(4 downto 0) => \^rgb_o\(7 downto 3),
      rstn_i => rstn_i,
      vs_o => vs_o
    );
end STRUCTURE;
