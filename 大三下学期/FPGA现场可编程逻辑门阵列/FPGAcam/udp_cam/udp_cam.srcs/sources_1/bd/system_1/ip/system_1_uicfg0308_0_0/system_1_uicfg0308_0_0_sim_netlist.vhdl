-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Thu May 28 14:47:58 2026
-- Host        : sw running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/FPGAcam/udp_cam/udp_cam.srcs/sources_1/bd/system_1/ip/system_1_uicfg0308_0_0/system_1_uicfg0308_0_0_sim_netlist.vhdl
-- Design      : system_1_uicfg0308_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_1_uicfg0308_0_0_uii2c is
  port (
    cmos_scl : out STD_LOGIC;
    clear : out STD_LOGIC;
    iic_busy : out STD_LOGIC;
    \TS_S_reg[1]\ : out STD_LOGIC;
    iic_busy_reg_0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    iic_req_reg : out STD_LOGIC;
    cmos_sda : inout STD_LOGIC;
    clk_i : in STD_LOGIC;
    iic_req_reg_0 : in STD_LOGIC;
    iic_req_reg_1 : in STD_LOGIC;
    p_0_in_0 : in STD_LOGIC;
    iic_req : in STD_LOGIC;
    DOADO : in STD_LOGIC_VECTOR ( 15 downto 0 );
    \sda_r_reg[1]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_1_uicfg0308_0_0_uii2c : entity is "uii2c";
end system_1_uicfg0308_0_0_uii2c;

architecture STRUCTURE of system_1_uicfg0308_0_0_uii2c is
  signal IIC_S : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \IIC_S[0]_i_1_n_0\ : STD_LOGIC;
  signal \IIC_S[1]_i_1_n_0\ : STD_LOGIC;
  signal \IIC_S[2]_i_1_n_0\ : STD_LOGIC;
  signal bcnt : STD_LOGIC;
  signal \bcnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \bcnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \bcnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \bcnt[2]_i_2_n_0\ : STD_LOGIC;
  signal \bcnt[2]_i_3_n_0\ : STD_LOGIC;
  signal \bcnt[2]_i_5_n_0\ : STD_LOGIC;
  signal \bcnt[2]_i_6_n_0\ : STD_LOGIC;
  signal \bcnt[2]_i_7_n_0\ : STD_LOGIC;
  signal \bcnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \bcnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \bcnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \^clear\ : STD_LOGIC;
  signal \clkdiv[6]_i_1_n_0\ : STD_LOGIC;
  signal \clkdiv[6]_i_3_n_0\ : STD_LOGIC;
  signal clkdiv_reg : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \^cmos_scl\ : STD_LOGIC;
  signal iic_bus_error_i_1_n_0 : STD_LOGIC;
  signal iic_bus_error_reg_n_0 : STD_LOGIC;
  signal \^iic_busy\ : STD_LOGIC;
  signal iic_busy_i_1_n_0 : STD_LOGIC;
  signal iic_scl_i_1_n_0 : STD_LOGIC;
  signal iic_scl_i_3_n_0 : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal scl_clk : STD_LOGIC;
  signal scl_clk_i_1_n_0 : STD_LOGIC;
  signal scl_offset : STD_LOGIC;
  signal sda_i : STD_LOGIC;
  signal sda_o1_out : STD_LOGIC;
  signal sda_r : STD_LOGIC;
  signal \sda_r1__0\ : STD_LOGIC;
  signal \sda_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \sda_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \sda_r[1]_i_2_n_0\ : STD_LOGIC;
  signal \sda_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \sda_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \sda_r[4]_i_1_n_0\ : STD_LOGIC;
  signal \sda_r[5]_i_1_n_0\ : STD_LOGIC;
  signal \sda_r[6]_i_1_n_0\ : STD_LOGIC;
  signal \sda_r[6]_i_2_n_0\ : STD_LOGIC;
  signal \sda_r[7]_i_2_n_0\ : STD_LOGIC;
  signal \sda_r[7]_i_4_n_0\ : STD_LOGIC;
  signal \sda_r[7]_i_5_n_0\ : STD_LOGIC;
  signal \sda_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \sda_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \sda_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \sda_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \sda_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \sda_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \sda_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \sda_r_reg_n_0_[7]\ : STD_LOGIC;
  signal wcnt : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \wcnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \wcnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \wcnt[2]_i_1_n_0\ : STD_LOGIC;
  signal \wcnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \wcnt[4]_i_1_n_0\ : STD_LOGIC;
  signal \wcnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \wcnt[5]_i_2_n_0\ : STD_LOGIC;
  signal \wcnt[6]_i_1_n_0\ : STD_LOGIC;
  signal \wcnt[7]_i_1_n_0\ : STD_LOGIC;
  signal \wcnt[7]_i_2_n_0\ : STD_LOGIC;
  signal \wcnt[7]_i_3_n_0\ : STD_LOGIC;
  signal \wcnt[7]_i_4_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \IIC_S[2]_i_1\ : label is "soft_lutpair7";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of IOBUF_inst : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of IOBUF_inst_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \bcnt[2]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \bcnt[2]_i_6\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \clkdiv[1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \clkdiv[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \clkdiv[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \clkdiv[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \clkdiv[6]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of iic_req_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of iic_scl_i_2 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \reg_index[8]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \sda_r[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \sda_r[6]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \sda_r[6]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \sda_r[7]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \sda_r[7]_i_4\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \sda_r[7]_i_5\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \wcnt[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \wcnt[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \wcnt[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wcnt[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wcnt[5]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \wcnt[6]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wcnt[7]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wcnt[7]_i_3\ : label is "soft_lutpair9";
begin
  clear <= \^clear\;
  cmos_scl <= \^cmos_scl\;
  iic_busy <= \^iic_busy\;
\IIC_S[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000999F888E"
    )
        port map (
      I0 => IIC_S(2),
      I1 => IIC_S(1),
      I2 => \bcnt_reg_n_0_[2]\,
      I3 => \bcnt[2]_i_2_n_0\,
      I4 => iic_req,
      I5 => IIC_S(0),
      O => \IIC_S[0]_i_1_n_0\
    );
\IIC_S[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6E"
    )
        port map (
      I0 => IIC_S(0),
      I1 => IIC_S(1),
      I2 => IIC_S(2),
      O => \IIC_S[1]_i_1_n_0\
    );
\IIC_S[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3F40"
    )
        port map (
      I0 => \bcnt[2]_i_3_n_0\,
      I1 => IIC_S(0),
      I2 => IIC_S(1),
      I3 => IIC_S(2),
      O => \IIC_S[2]_i_1_n_0\
    );
\IIC_S[2]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_0_in_0,
      O => \^clear\
    );
\IIC_S_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => '1',
      CLR => \^clear\,
      D => \IIC_S[0]_i_1_n_0\,
      Q => IIC_S(0)
    );
\IIC_S_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => '1',
      CLR => \^clear\,
      D => \IIC_S[1]_i_1_n_0\,
      Q => IIC_S(1)
    );
\IIC_S_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => '1',
      CLR => \^clear\,
      D => \IIC_S[2]_i_1_n_0\,
      Q => IIC_S(2)
    );
IOBUF_inst: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => sda_o1_out,
      IO => cmos_sda,
      O => sda_i,
      T => sda_o1_out
    );
IOBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F3CB"
    )
        port map (
      I0 => \sda_r_reg_n_0_[7]\,
      I1 => IIC_S(1),
      I2 => IIC_S(0),
      I3 => IIC_S(2),
      O => sda_o1_out
    );
\bcnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B0FFBF00"
    )
        port map (
      I0 => \bcnt[2]_i_3_n_0\,
      I1 => IIC_S(1),
      I2 => IIC_S(0),
      I3 => bcnt,
      I4 => \bcnt_reg_n_0_[0]\,
      O => \bcnt[0]_i_1_n_0\
    );
\bcnt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E2EEFFFFD1DD0000"
    )
        port map (
      I0 => \bcnt_reg_n_0_[0]\,
      I1 => IIC_S(0),
      I2 => \bcnt[2]_i_3_n_0\,
      I3 => IIC_S(1),
      I4 => bcnt,
      I5 => \bcnt_reg_n_0_[1]\,
      O => \bcnt[1]_i_1_n_0\
    );
\bcnt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E2EEFFFFD1DD0000"
    )
        port map (
      I0 => \bcnt[2]_i_2_n_0\,
      I1 => IIC_S(0),
      I2 => \bcnt[2]_i_3_n_0\,
      I3 => IIC_S(1),
      I4 => bcnt,
      I5 => \bcnt_reg_n_0_[2]\,
      O => \bcnt[2]_i_1_n_0\
    );
\bcnt[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \bcnt_reg_n_0_[1]\,
      I1 => \bcnt_reg_n_0_[0]\,
      O => \bcnt[2]_i_2_n_0\
    );
\bcnt[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01110000"
    )
        port map (
      I0 => wcnt(6),
      I1 => wcnt(7),
      I2 => wcnt(1),
      I3 => wcnt(0),
      I4 => \bcnt[2]_i_5_n_0\,
      O => \bcnt[2]_i_3_n_0\
    );
\bcnt[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA20000000"
    )
        port map (
      I0 => p_0_in_0,
      I1 => IIC_S(2),
      I2 => IIC_S(0),
      I3 => \bcnt[2]_i_5_n_0\,
      I4 => \bcnt[2]_i_6_n_0\,
      I5 => \bcnt[2]_i_7_n_0\,
      O => bcnt
    );
\bcnt[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => wcnt(3),
      I1 => wcnt(2),
      I2 => wcnt(5),
      I3 => wcnt(4),
      O => \bcnt[2]_i_5_n_0\
    );
\bcnt[2]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0007"
    )
        port map (
      I0 => wcnt(0),
      I1 => wcnt(1),
      I2 => wcnt(7),
      I3 => wcnt(6),
      O => \bcnt[2]_i_6_n_0\
    );
\bcnt[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1E1E1E1E1E1E1E0E"
    )
        port map (
      I0 => IIC_S(0),
      I1 => IIC_S(2),
      I2 => IIC_S(1),
      I3 => \bcnt_reg_n_0_[2]\,
      I4 => \bcnt_reg_n_0_[1]\,
      I5 => \bcnt_reg_n_0_[0]\,
      O => \bcnt[2]_i_7_n_0\
    );
\bcnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => '1',
      D => \bcnt[0]_i_1_n_0\,
      Q => \bcnt_reg_n_0_[0]\,
      R => '0'
    );
\bcnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => '1',
      D => \bcnt[1]_i_1_n_0\,
      Q => \bcnt_reg_n_0_[1]\,
      R => '0'
    );
\bcnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => '1',
      D => \bcnt[2]_i_1_n_0\,
      Q => \bcnt_reg_n_0_[2]\,
      R => '0'
    );
\clkdiv[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clkdiv_reg(0),
      O => \p_0_in__0\(0)
    );
\clkdiv[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clkdiv_reg(0),
      I1 => clkdiv_reg(1),
      O => \p_0_in__0\(1)
    );
\clkdiv[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => clkdiv_reg(1),
      I1 => clkdiv_reg(0),
      I2 => clkdiv_reg(2),
      O => \p_0_in__0\(2)
    );
\clkdiv[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => clkdiv_reg(0),
      I1 => clkdiv_reg(1),
      I2 => clkdiv_reg(2),
      I3 => clkdiv_reg(3),
      O => \p_0_in__0\(3)
    );
\clkdiv[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => clkdiv_reg(2),
      I1 => clkdiv_reg(1),
      I2 => clkdiv_reg(0),
      I3 => clkdiv_reg(3),
      I4 => clkdiv_reg(4),
      O => \p_0_in__0\(4)
    );
\clkdiv[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => clkdiv_reg(3),
      I1 => clkdiv_reg(0),
      I2 => clkdiv_reg(1),
      I3 => clkdiv_reg(2),
      I4 => clkdiv_reg(4),
      I5 => clkdiv_reg(5),
      O => \p_0_in__0\(5)
    );
\clkdiv[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888888888880"
    )
        port map (
      I0 => clkdiv_reg(6),
      I1 => clkdiv_reg(5),
      I2 => clkdiv_reg(4),
      I3 => clkdiv_reg(3),
      I4 => clkdiv_reg(2),
      I5 => \clkdiv[6]_i_3_n_0\,
      O => \clkdiv[6]_i_1_n_0\
    );
\clkdiv[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => clkdiv_reg(4),
      I1 => clkdiv_reg(2),
      I2 => \clkdiv[6]_i_3_n_0\,
      I3 => clkdiv_reg(3),
      I4 => clkdiv_reg(5),
      I5 => clkdiv_reg(6),
      O => \p_0_in__0\(6)
    );
\clkdiv[6]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => clkdiv_reg(0),
      I1 => clkdiv_reg(1),
      O => \clkdiv[6]_i_3_n_0\
    );
\clkdiv_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => \p_0_in__0\(0),
      Q => clkdiv_reg(0),
      R => \clkdiv[6]_i_1_n_0\
    );
\clkdiv_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => \p_0_in__0\(1),
      Q => clkdiv_reg(1),
      R => \clkdiv[6]_i_1_n_0\
    );
\clkdiv_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => \p_0_in__0\(2),
      Q => clkdiv_reg(2),
      R => \clkdiv[6]_i_1_n_0\
    );
\clkdiv_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => \p_0_in__0\(3),
      Q => clkdiv_reg(3),
      R => \clkdiv[6]_i_1_n_0\
    );
\clkdiv_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => \p_0_in__0\(4),
      Q => clkdiv_reg(4),
      R => \clkdiv[6]_i_1_n_0\
    );
\clkdiv_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => \p_0_in__0\(5),
      Q => clkdiv_reg(5),
      R => \clkdiv[6]_i_1_n_0\
    );
\clkdiv_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => \p_0_in__0\(6),
      Q => clkdiv_reg(6),
      R => \clkdiv[6]_i_1_n_0\
    );
iic_bus_error_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF008000800080"
    )
        port map (
      I0 => IIC_S(0),
      I1 => IIC_S(1),
      I2 => sda_i,
      I3 => IIC_S(2),
      I4 => iic_req,
      I5 => iic_bus_error_reg_n_0,
      O => iic_bus_error_i_1_n_0
    );
iic_bus_error_reg: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => scl_clk,
      CE => '1',
      CLR => \^clear\,
      D => iic_bus_error_i_1_n_0,
      Q => iic_bus_error_reg_n_0
    );
iic_busy_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEEEEEEEEE"
    )
        port map (
      I0 => iic_bus_error_reg_n_0,
      I1 => iic_req,
      I2 => IIC_S(0),
      I3 => IIC_S(2),
      I4 => IIC_S(1),
      I5 => \^iic_busy\,
      O => iic_busy_i_1_n_0
    );
iic_busy_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => '1',
      CLR => \^clear\,
      D => iic_busy_i_1_n_0,
      Q => \^iic_busy\
    );
iic_req_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2BA0000"
    )
        port map (
      I0 => iic_req,
      I1 => \^iic_busy\,
      I2 => iic_req_reg_1,
      I3 => iic_req_reg_0,
      I4 => p_0_in_0,
      O => iic_req_reg
    );
iic_scl_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF00A1A1FF00"
    )
        port map (
      I0 => IIC_S(2),
      I1 => IIC_S(0),
      I2 => IIC_S(1),
      I3 => \^cmos_scl\,
      I4 => scl_offset,
      I5 => scl_clk,
      O => iic_scl_i_1_n_0
    );
iic_scl_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => iic_scl_i_3_n_0,
      I1 => clkdiv_reg(0),
      I2 => clkdiv_reg(1),
      I3 => clkdiv_reg(2),
      O => scl_offset
    );
iic_scl_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => clkdiv_reg(5),
      I1 => clkdiv_reg(6),
      I2 => clkdiv_reg(4),
      I3 => clkdiv_reg(3),
      O => iic_scl_i_3_n_0
    );
iic_scl_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => iic_scl_i_1_n_0,
      Q => \^cmos_scl\,
      R => '0'
    );
\reg_index[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^iic_busy\,
      I1 => iic_req_reg_1,
      I2 => iic_req_reg_0,
      O => E(0)
    );
reg_index_reg_rep_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08FF"
    )
        port map (
      I0 => iic_req_reg_0,
      I1 => iic_req_reg_1,
      I2 => \^iic_busy\,
      I3 => p_0_in_0,
      O => \TS_S_reg[1]\
    );
reg_index_reg_rep_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^iic_busy\,
      I1 => iic_req_reg_1,
      I2 => iic_req_reg_0,
      O => iic_busy_reg_0
    );
scl_clk_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \clkdiv[6]_i_1_n_0\,
      I1 => scl_clk,
      O => scl_clk_i_1_n_0
    );
scl_clk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => scl_clk_i_1_n_0,
      Q => scl_clk,
      R => '0'
    );
\sda_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555555555DF55D55"
    )
        port map (
      I0 => \sda_r1__0\,
      I1 => DOADO(8),
      I2 => wcnt(1),
      I3 => wcnt(0),
      I4 => DOADO(0),
      I5 => wcnt(2),
      O => \sda_r[0]_i_1_n_0\
    );
\sda_r[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => \sda_r[1]_i_2_n_0\,
      I1 => wcnt(2),
      I2 => IIC_S(0),
      I3 => \sda_r_reg_n_0_[0]\,
      O => \sda_r[1]_i_1_n_0\
    );
\sda_r[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \sda_r_reg[1]_0\,
      I1 => DOADO(9),
      I2 => DOADO(1),
      I3 => wcnt(1),
      I4 => wcnt(0),
      O => \sda_r[1]_i_2_n_0\
    );
\sda_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \sda_r_reg_n_0_[1]\,
      I1 => \sda_r1__0\,
      I2 => \sda_r[7]_i_4_n_0\,
      I3 => DOADO(10),
      I4 => DOADO(2),
      I5 => \sda_r[7]_i_5_n_0\,
      O => \sda_r[2]_i_1_n_0\
    );
\sda_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \sda_r_reg_n_0_[2]\,
      I1 => \sda_r1__0\,
      I2 => \sda_r[7]_i_4_n_0\,
      I3 => DOADO(11),
      I4 => DOADO(3),
      I5 => \sda_r[7]_i_5_n_0\,
      O => \sda_r[3]_i_1_n_0\
    );
\sda_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \sda_r_reg_n_0_[3]\,
      I1 => \sda_r1__0\,
      I2 => \sda_r[7]_i_4_n_0\,
      I3 => DOADO(12),
      I4 => DOADO(4),
      I5 => \sda_r[7]_i_5_n_0\,
      O => \sda_r[4]_i_1_n_0\
    );
\sda_r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \sda_r_reg_n_0_[4]\,
      I1 => \sda_r1__0\,
      I2 => \sda_r[7]_i_4_n_0\,
      I3 => DOADO(13),
      I4 => DOADO(5),
      I5 => \sda_r[7]_i_5_n_0\,
      O => \sda_r[5]_i_1_n_0\
    );
\sda_r[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => \sda_r[6]_i_2_n_0\,
      I1 => wcnt(2),
      I2 => IIC_S(0),
      I3 => \sda_r_reg_n_0_[5]\,
      O => \sda_r[6]_i_1_n_0\
    );
\sda_r[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \sda_r_reg[1]_0\,
      I1 => DOADO(14),
      I2 => DOADO(6),
      I3 => wcnt(1),
      I4 => wcnt(0),
      O => \sda_r[6]_i_2_n_0\
    );
\sda_r[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => IIC_S(1),
      I1 => IIC_S(0),
      I2 => IIC_S(2),
      O => sda_r
    );
\sda_r[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \sda_r_reg_n_0_[6]\,
      I1 => \sda_r1__0\,
      I2 => \sda_r[7]_i_4_n_0\,
      I3 => DOADO(15),
      I4 => DOADO(7),
      I5 => \sda_r[7]_i_5_n_0\,
      O => \sda_r[7]_i_2_n_0\
    );
\sda_r[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => IIC_S(2),
      I1 => IIC_S(0),
      O => \sda_r1__0\
    );
\sda_r[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => wcnt(1),
      I1 => wcnt(0),
      I2 => wcnt(2),
      I3 => IIC_S(2),
      I4 => IIC_S(0),
      O => \sda_r[7]_i_4_n_0\
    );
\sda_r[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => wcnt(0),
      I1 => wcnt(1),
      I2 => wcnt(2),
      I3 => IIC_S(2),
      I4 => IIC_S(0),
      O => \sda_r[7]_i_5_n_0\
    );
\sda_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => sda_r,
      D => \sda_r[0]_i_1_n_0\,
      Q => \sda_r_reg_n_0_[0]\,
      R => '0'
    );
\sda_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => sda_r,
      D => \sda_r[1]_i_1_n_0\,
      Q => \sda_r_reg_n_0_[1]\,
      R => '0'
    );
\sda_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => sda_r,
      D => \sda_r[2]_i_1_n_0\,
      Q => \sda_r_reg_n_0_[2]\,
      R => '0'
    );
\sda_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => sda_r,
      D => \sda_r[3]_i_1_n_0\,
      Q => \sda_r_reg_n_0_[3]\,
      R => '0'
    );
\sda_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => sda_r,
      D => \sda_r[4]_i_1_n_0\,
      Q => \sda_r_reg_n_0_[4]\,
      R => '0'
    );
\sda_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => sda_r,
      D => \sda_r[5]_i_1_n_0\,
      Q => \sda_r_reg_n_0_[5]\,
      R => '0'
    );
\sda_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => sda_r,
      D => \sda_r[6]_i_1_n_0\,
      Q => \sda_r_reg_n_0_[6]\,
      R => '0'
    );
\sda_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => sda_r,
      D => \sda_r[7]_i_2_n_0\,
      Q => \sda_r_reg_n_0_[7]\,
      R => '0'
    );
\wcnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IIC_S(1),
      I1 => wcnt(0),
      O => \wcnt[0]_i_1_n_0\
    );
\wcnt[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => IIC_S(1),
      I1 => wcnt(0),
      I2 => wcnt(1),
      O => \wcnt[1]_i_1_n_0\
    );
\wcnt[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => wcnt(1),
      I1 => wcnt(0),
      I2 => IIC_S(1),
      I3 => wcnt(2),
      O => \wcnt[2]_i_1_n_0\
    );
\wcnt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F008000"
    )
        port map (
      I0 => wcnt(2),
      I1 => wcnt(0),
      I2 => wcnt(1),
      I3 => IIC_S(1),
      I4 => wcnt(3),
      O => \wcnt[3]_i_1_n_0\
    );
\wcnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => wcnt(3),
      I1 => wcnt(1),
      I2 => wcnt(0),
      I3 => wcnt(2),
      I4 => IIC_S(1),
      I5 => wcnt(4),
      O => \wcnt[4]_i_1_n_0\
    );
\wcnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FF000008000000"
    )
        port map (
      I0 => wcnt(4),
      I1 => wcnt(2),
      I2 => \wcnt[5]_i_2_n_0\,
      I3 => wcnt(3),
      I4 => IIC_S(1),
      I5 => wcnt(5),
      O => \wcnt[5]_i_1_n_0\
    );
\wcnt[5]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => wcnt(1),
      I1 => wcnt(0),
      O => \wcnt[5]_i_2_n_0\
    );
\wcnt[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"48"
    )
        port map (
      I0 => \wcnt[7]_i_4_n_0\,
      I1 => IIC_S(1),
      I2 => wcnt(6),
      O => \wcnt[6]_i_1_n_0\
    );
\wcnt[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00010000000100FF"
    )
        port map (
      I0 => \bcnt_reg_n_0_[0]\,
      I1 => \bcnt_reg_n_0_[1]\,
      I2 => \bcnt_reg_n_0_[2]\,
      I3 => \wcnt[7]_i_3_n_0\,
      I4 => IIC_S(1),
      I5 => iic_req,
      O => \wcnt[7]_i_1_n_0\
    );
\wcnt[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7080"
    )
        port map (
      I0 => wcnt(6),
      I1 => \wcnt[7]_i_4_n_0\,
      I2 => IIC_S(1),
      I3 => wcnt(7),
      O => \wcnt[7]_i_2_n_0\
    );
\wcnt[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => IIC_S(0),
      I1 => IIC_S(2),
      O => \wcnt[7]_i_3_n_0\
    );
\wcnt[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => wcnt(5),
      I1 => wcnt(3),
      I2 => wcnt(1),
      I3 => wcnt(0),
      I4 => wcnt(2),
      I5 => wcnt(4),
      O => \wcnt[7]_i_4_n_0\
    );
\wcnt_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => \wcnt[7]_i_1_n_0\,
      CLR => \^clear\,
      D => \wcnt[0]_i_1_n_0\,
      Q => wcnt(0)
    );
\wcnt_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => \wcnt[7]_i_1_n_0\,
      CLR => \^clear\,
      D => \wcnt[1]_i_1_n_0\,
      Q => wcnt(1)
    );
\wcnt_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => \wcnt[7]_i_1_n_0\,
      CLR => \^clear\,
      D => \wcnt[2]_i_1_n_0\,
      Q => wcnt(2)
    );
\wcnt_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => \wcnt[7]_i_1_n_0\,
      CLR => \^clear\,
      D => \wcnt[3]_i_1_n_0\,
      Q => wcnt(3)
    );
\wcnt_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => \wcnt[7]_i_1_n_0\,
      CLR => \^clear\,
      D => \wcnt[4]_i_1_n_0\,
      Q => wcnt(4)
    );
\wcnt_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => \wcnt[7]_i_1_n_0\,
      CLR => \^clear\,
      D => \wcnt[5]_i_1_n_0\,
      Q => wcnt(5)
    );
\wcnt_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => \wcnt[7]_i_1_n_0\,
      CLR => \^clear\,
      D => \wcnt[6]_i_1_n_0\,
      Q => wcnt(6)
    );
\wcnt_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => scl_clk,
      CE => \wcnt[7]_i_1_n_0\,
      CLR => \^clear\,
      D => \wcnt[7]_i_2_n_0\,
      Q => wcnt(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_1_uicfg0308_0_0_uicfg0308 is
  port (
    cfg_done : out STD_LOGIC;
    cmos_scl : out STD_LOGIC;
    cmos_sda : inout STD_LOGIC;
    clk_i : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_1_uicfg0308_0_0_uicfg0308 : entity is "uicfg0308";
end system_1_uicfg0308_0_0_uicfg0308;

architecture STRUCTURE of system_1_uicfg0308_0_0_uicfg0308 is
  signal \TS_S[0]_i_1_n_0\ : STD_LOGIC;
  signal \TS_S[1]_i_1_n_0\ : STD_LOGIC;
  signal \TS_S_reg_n_0_[0]\ : STD_LOGIC;
  signal \TS_S_reg_n_0_[1]\ : STD_LOGIC;
  signal \^cfg_done\ : STD_LOGIC;
  signal cfg_done_i_1_n_0 : STD_LOGIC;
  signal cfg_done_i_2_n_0 : STD_LOGIC;
  signal cfg_done_i_3_n_0 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal iic_busy : STD_LOGIC;
  signal iic_req : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in_0 : STD_LOGIC;
  signal \reg_index[0]_i_1_n_0\ : STD_LOGIC;
  signal \reg_index[1]_i_1_n_0\ : STD_LOGIC;
  signal \reg_index[2]_i_1_n_0\ : STD_LOGIC;
  signal \reg_index[3]_i_1_n_0\ : STD_LOGIC;
  signal \reg_index[4]_i_1_n_0\ : STD_LOGIC;
  signal \reg_index[5]_i_1_n_0\ : STD_LOGIC;
  signal \reg_index[6]_i_1_n_0\ : STD_LOGIC;
  signal \reg_index[7]_i_1_n_0\ : STD_LOGIC;
  signal \reg_index[8]_i_2_n_0\ : STD_LOGIC;
  signal reg_index_reg : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal reg_index_reg_rep_i_10_n_0 : STD_LOGIC;
  signal reg_index_reg_rep_i_11_n_0 : STD_LOGIC;
  signal reg_index_reg_rep_i_12_n_0 : STD_LOGIC;
  signal reg_index_reg_rep_i_3_n_0 : STD_LOGIC;
  signal reg_index_reg_rep_i_4_n_0 : STD_LOGIC;
  signal reg_index_reg_rep_i_5_n_0 : STD_LOGIC;
  signal reg_index_reg_rep_i_6_n_0 : STD_LOGIC;
  signal reg_index_reg_rep_i_7_n_0 : STD_LOGIC;
  signal reg_index_reg_rep_i_8_n_0 : STD_LOGIC;
  signal reg_index_reg_rep_i_9_n_0 : STD_LOGIC;
  signal \rst_cnt[7]_i_2_n_0\ : STD_LOGIC;
  signal \rst_cnt[7]_i_3_n_0\ : STD_LOGIC;
  signal \rst_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \rst_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \rst_cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \rst_cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \rst_cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \rst_cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \rst_cnt_reg_n_0_[6]\ : STD_LOGIC;
  signal uii2c_inst_n_3 : STD_LOGIC;
  signal uii2c_inst_n_4 : STD_LOGIC;
  signal uii2c_inst_n_5 : STD_LOGIC;
  signal uii2c_inst_n_6 : STD_LOGIC;
  signal wr_data : STD_LOGIC_VECTOR ( 23 downto 8 );
  signal \wr_data_reg_n_0_[6]\ : STD_LOGIC;
  signal NLW_reg_index_reg_rep_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_reg_index_reg_rep_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_reg_index_reg_rep_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of cfg_done_i_2 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \reg_index[0]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \reg_index[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \reg_index[2]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \reg_index[3]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \reg_index[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \reg_index[7]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \reg_index[8]_i_2\ : label is "soft_lutpair16";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of reg_index_reg_rep : label is "p0_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of reg_index_reg_rep : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of reg_index_reg_rep : label is 8192;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of reg_index_reg_rep : label is "inst/reg_index";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of reg_index_reg_rep : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of reg_index_reg_rep : label is 1023;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of reg_index_reg_rep : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of reg_index_reg_rep : label is 15;
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of reg_index_reg_rep : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of reg_index_reg_rep : label is 1023;
  attribute ram_offset : integer;
  attribute ram_offset of reg_index_reg_rep : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of reg_index_reg_rep : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of reg_index_reg_rep : label is 15;
  attribute SOFT_HLUTNM of \rst_cnt[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \rst_cnt[2]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \rst_cnt[3]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rst_cnt[4]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rst_cnt[6]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \rst_cnt[7]_i_1\ : label is "soft_lutpair18";
begin
  cfg_done <= \^cfg_done\;
\TS_S[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEF000100000000"
    )
        port map (
      I0 => \TS_S_reg_n_0_[0]\,
      I1 => \TS_S_reg_n_0_[1]\,
      I2 => \^cfg_done\,
      I3 => cfg_done_i_2_n_0,
      I4 => iic_busy,
      I5 => p_0_in_0,
      O => \TS_S[0]_i_1_n_0\
    );
\TS_S[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C600"
    )
        port map (
      I0 => \TS_S_reg_n_0_[0]\,
      I1 => \TS_S_reg_n_0_[1]\,
      I2 => iic_busy,
      I3 => p_0_in_0,
      O => \TS_S[1]_i_1_n_0\
    );
\TS_S_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => \TS_S[0]_i_1_n_0\,
      Q => \TS_S_reg_n_0_[0]\,
      R => '0'
    );
\TS_S_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => '1',
      D => \TS_S[1]_i_1_n_0\,
      Q => \TS_S_reg_n_0_[1]\,
      R => '0'
    );
cfg_done_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAE0000"
    )
        port map (
      I0 => \^cfg_done\,
      I1 => cfg_done_i_2_n_0,
      I2 => \TS_S_reg_n_0_[0]\,
      I3 => \TS_S_reg_n_0_[1]\,
      I4 => p_0_in_0,
      O => cfg_done_i_1_n_0
    );
cfg_done_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => cfg_done_i_3_n_0,
      I1 => reg_index_reg(0),
      I2 => reg_index_reg(2),
      I3 => reg_index_reg(1),
      O => cfg_done_i_2_n_0
    );
cfg_done_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => reg_index_reg(4),
      I1 => reg_index_reg(3),
      I2 => reg_index_reg(5),
      I3 => reg_index_reg(6),
      I4 => reg_index_reg(7),
      I5 => reg_index_reg(8),
      O => cfg_done_i_3_n_0
    );
cfg_done_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => '1',
      D => cfg_done_i_1_n_0,
      Q => \^cfg_done\,
      R => '0'
    );
iic_req_reg: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => '1',
      D => uii2c_inst_n_6,
      Q => iic_req,
      R => '0'
    );
\reg_index[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reg_index_reg(0),
      O => \reg_index[0]_i_1_n_0\
    );
\reg_index[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_index_reg(0),
      I1 => reg_index_reg(1),
      O => \reg_index[1]_i_1_n_0\
    );
\reg_index[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => reg_index_reg(0),
      I1 => reg_index_reg(1),
      I2 => reg_index_reg(2),
      O => \reg_index[2]_i_1_n_0\
    );
\reg_index[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => reg_index_reg(1),
      I1 => reg_index_reg(0),
      I2 => reg_index_reg(2),
      I3 => reg_index_reg(3),
      O => \reg_index[3]_i_1_n_0\
    );
\reg_index[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => reg_index_reg(2),
      I1 => reg_index_reg(0),
      I2 => reg_index_reg(1),
      I3 => reg_index_reg(3),
      I4 => reg_index_reg(4),
      O => \reg_index[4]_i_1_n_0\
    );
\reg_index[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => reg_index_reg(3),
      I1 => reg_index_reg(1),
      I2 => reg_index_reg(0),
      I3 => reg_index_reg(2),
      I4 => reg_index_reg(4),
      I5 => reg_index_reg(5),
      O => \reg_index[5]_i_1_n_0\
    );
\reg_index[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => reg_index_reg_rep_i_12_n_0,
      I1 => reg_index_reg(6),
      O => \reg_index[6]_i_1_n_0\
    );
\reg_index[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => reg_index_reg_rep_i_12_n_0,
      I1 => reg_index_reg(6),
      I2 => reg_index_reg(7),
      O => \reg_index[7]_i_1_n_0\
    );
\reg_index[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => reg_index_reg(6),
      I1 => reg_index_reg_rep_i_12_n_0,
      I2 => reg_index_reg(7),
      I3 => reg_index_reg(8),
      O => \reg_index[8]_i_2_n_0\
    );
\reg_index_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => uii2c_inst_n_5,
      D => \reg_index[0]_i_1_n_0\,
      Q => reg_index_reg(0),
      R => clear
    );
\reg_index_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => uii2c_inst_n_5,
      D => \reg_index[1]_i_1_n_0\,
      Q => reg_index_reg(1),
      R => clear
    );
\reg_index_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => uii2c_inst_n_5,
      D => \reg_index[2]_i_1_n_0\,
      Q => reg_index_reg(2),
      R => clear
    );
\reg_index_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => uii2c_inst_n_5,
      D => \reg_index[3]_i_1_n_0\,
      Q => reg_index_reg(3),
      R => clear
    );
\reg_index_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => uii2c_inst_n_5,
      D => \reg_index[4]_i_1_n_0\,
      Q => reg_index_reg(4),
      R => clear
    );
\reg_index_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => uii2c_inst_n_5,
      D => \reg_index[5]_i_1_n_0\,
      Q => reg_index_reg(5),
      R => clear
    );
\reg_index_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => uii2c_inst_n_5,
      D => \reg_index[6]_i_1_n_0\,
      Q => reg_index_reg(6),
      R => clear
    );
\reg_index_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => uii2c_inst_n_5,
      D => \reg_index[7]_i_1_n_0\,
      Q => reg_index_reg(7),
      R => clear
    );
\reg_index_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => uii2c_inst_n_5,
      D => \reg_index[8]_i_2_n_0\,
      Q => reg_index_reg(8),
      R => clear
    );
reg_index_reg_rep: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 1,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"E200042003030F01027001FA22575C4A5B405A562255D210FE00FE80009B009B",
      INIT_01 => X"0B020AE809010800070006000500EBC4EA09E9B0E804E720E603E558E402E364",
      INIT_02 => X"1CC11B001A1E1944184417011605150A14101300122A11FD10220E020D020C88",
      INIT_03 => X"3B203A1839043200315030F72F012602250F24A6225721F820FF1F161E601D08",
      INIT_04 => X"913C902E8F2E8E2E8D408C408B40568255805480538250103F003E003D003C00",
      INIT_05 => X"6D8F6C5F6B006A0F691868A2678666E864036208611560075F245E1A5D129250",
      INIT_06 => X"93487CFF7B227A817981788877367602753F7402738072DC713370156F386E55",
      INIT_07 => X"DF23DCA5DB92D616D5F2D110D0C9BE36BD38B238B13898F0974096E895059400",
      INIT_08 => X"A587A476A363A24EA138A0209F1080038003EF40EEA0ED04EC20E009DA00D900",
      INIT_09 => X"C554C443C330C21CC110C000AFFFAEFDADF8ACF0ABEBAAE3A9D8A8CAA7B8A6A2",
      INIT_0A => X"021A00F5FE01FA78F99FF330F201F101F002CCFFCBE6CACBC9B0C893C775C665",
      INIT_0B => X"1BF51AD01940181817A816C21543144213131272113F0F390E4C0C080B600AA0",
      INIT_0C => X"37C036C035B034E033E032E03140300378327720756074207348723071587040",
      INIT_0D => X"470D46EE45D644B843A742944181406C3F573E443D313C283B1C3A1239093804",
      INIT_0E => X"8D208C208B205680538050143A201E611D9A1C491A2A110D1026008BD290FE00",
      INIT_0F => X"FE01F80AF712F202D348D0CBB6E0B340B240B14096E09507940290148F108E14",
      INIT_10 => X"32101AD819501544144413191222113710410F320E44080A0620050804100220",
      INIT_11 => X"008B008B008B008B008B008B008B008B008B008B008B008BFE00370036803500",
      INIT_12 => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_13 => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_14 => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_15 => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_16 => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_17 => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_18 => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_19 => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_1A => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_1B => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_1C => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_1D => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_1E => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_1F => X"008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B008B",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(13) => '0',
      ADDRARDADDR(12) => reg_index_reg_rep_i_3_n_0,
      ADDRARDADDR(11) => reg_index_reg_rep_i_4_n_0,
      ADDRARDADDR(10) => reg_index_reg_rep_i_5_n_0,
      ADDRARDADDR(9) => reg_index_reg_rep_i_6_n_0,
      ADDRARDADDR(8) => reg_index_reg_rep_i_7_n_0,
      ADDRARDADDR(7) => reg_index_reg_rep_i_8_n_0,
      ADDRARDADDR(6) => reg_index_reg_rep_i_9_n_0,
      ADDRARDADDR(5) => reg_index_reg_rep_i_10_n_0,
      ADDRARDADDR(4) => reg_index_reg_rep_i_11_n_0,
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 0) => B"11111111111111",
      CLKARDCLK => clk_i,
      CLKBWRCLK => '0',
      DIADI(15 downto 0) => B"1111111111111111",
      DIBDI(15 downto 0) => B"1111111111111111",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"11",
      DOADO(15 downto 8) => wr_data(15 downto 8),
      DOADO(7 downto 0) => wr_data(23 downto 16),
      DOBDO(15 downto 0) => NLW_reg_index_reg_rep_DOBDO_UNCONNECTED(15 downto 0),
      DOPADOP(1 downto 0) => NLW_reg_index_reg_rep_DOPADOP_UNCONNECTED(1 downto 0),
      DOPBDOP(1 downto 0) => NLW_reg_index_reg_rep_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => uii2c_inst_n_3,
      ENBWREN => '0',
      REGCEAREGCE => uii2c_inst_n_4,
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => clear,
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
reg_index_reg_rep_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => reg_index_reg(1),
      I1 => reg_index_reg(0),
      I2 => p_0_in_0,
      O => reg_index_reg_rep_i_10_n_0
    );
reg_index_reg_rep_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_0_in_0,
      I1 => reg_index_reg(0),
      O => reg_index_reg_rep_i_11_n_0
    );
reg_index_reg_rep_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => reg_index_reg(5),
      I1 => reg_index_reg(3),
      I2 => reg_index_reg(1),
      I3 => reg_index_reg(0),
      I4 => reg_index_reg(2),
      I5 => reg_index_reg(4),
      O => reg_index_reg_rep_i_12_n_0
    );
reg_index_reg_rep_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAA0000"
    )
        port map (
      I0 => reg_index_reg(8),
      I1 => reg_index_reg(7),
      I2 => reg_index_reg_rep_i_12_n_0,
      I3 => reg_index_reg(6),
      I4 => p_0_in_0,
      O => reg_index_reg_rep_i_3_n_0
    );
reg_index_reg_rep_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A00"
    )
        port map (
      I0 => reg_index_reg(7),
      I1 => reg_index_reg(6),
      I2 => reg_index_reg_rep_i_12_n_0,
      I3 => p_0_in_0,
      O => reg_index_reg_rep_i_4_n_0
    );
reg_index_reg_rep_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => reg_index_reg(6),
      I1 => reg_index_reg_rep_i_12_n_0,
      I2 => p_0_in_0,
      O => reg_index_reg_rep_i_5_n_0
    );
reg_index_reg_rep_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \reg_index[5]_i_1_n_0\,
      I1 => p_0_in_0,
      O => reg_index_reg_rep_i_6_n_0
    );
reg_index_reg_rep_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAA00000000"
    )
        port map (
      I0 => reg_index_reg(4),
      I1 => reg_index_reg(3),
      I2 => reg_index_reg(1),
      I3 => reg_index_reg(0),
      I4 => reg_index_reg(2),
      I5 => p_0_in_0,
      O => reg_index_reg_rep_i_7_n_0
    );
reg_index_reg_rep_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAA0000"
    )
        port map (
      I0 => reg_index_reg(3),
      I1 => reg_index_reg(2),
      I2 => reg_index_reg(0),
      I3 => reg_index_reg(1),
      I4 => p_0_in_0,
      O => reg_index_reg_rep_i_8_n_0
    );
reg_index_reg_rep_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A00"
    )
        port map (
      I0 => reg_index_reg(2),
      I1 => reg_index_reg(1),
      I2 => reg_index_reg(0),
      I3 => p_0_in_0,
      O => reg_index_reg_rep_i_9_n_0
    );
\rst_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \rst_cnt_reg_n_0_[0]\,
      O => p_0_in(0)
    );
\rst_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rst_cnt_reg_n_0_[0]\,
      I1 => \rst_cnt_reg_n_0_[1]\,
      O => p_0_in(1)
    );
\rst_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \rst_cnt_reg_n_0_[0]\,
      I1 => \rst_cnt_reg_n_0_[1]\,
      I2 => \rst_cnt_reg_n_0_[2]\,
      O => p_0_in(2)
    );
\rst_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \rst_cnt_reg_n_0_[1]\,
      I1 => \rst_cnt_reg_n_0_[0]\,
      I2 => \rst_cnt_reg_n_0_[2]\,
      I3 => \rst_cnt_reg_n_0_[3]\,
      O => p_0_in(3)
    );
\rst_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \rst_cnt_reg_n_0_[2]\,
      I1 => \rst_cnt_reg_n_0_[0]\,
      I2 => \rst_cnt_reg_n_0_[1]\,
      I3 => \rst_cnt_reg_n_0_[3]\,
      I4 => \rst_cnt_reg_n_0_[4]\,
      O => p_0_in(4)
    );
\rst_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \rst_cnt_reg_n_0_[3]\,
      I1 => \rst_cnt_reg_n_0_[1]\,
      I2 => \rst_cnt_reg_n_0_[0]\,
      I3 => \rst_cnt_reg_n_0_[2]\,
      I4 => \rst_cnt_reg_n_0_[4]\,
      I5 => \rst_cnt_reg_n_0_[5]\,
      O => p_0_in(5)
    );
\rst_cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rst_cnt[7]_i_3_n_0\,
      I1 => \rst_cnt_reg_n_0_[6]\,
      O => p_0_in(6)
    );
\rst_cnt[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \rst_cnt[7]_i_3_n_0\,
      I1 => \rst_cnt_reg_n_0_[6]\,
      O => p_0_in(7)
    );
\rst_cnt[7]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => \rst_cnt[7]_i_2_n_0\
    );
\rst_cnt[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \rst_cnt_reg_n_0_[5]\,
      I1 => \rst_cnt_reg_n_0_[3]\,
      I2 => \rst_cnt_reg_n_0_[1]\,
      I3 => \rst_cnt_reg_n_0_[0]\,
      I4 => \rst_cnt_reg_n_0_[2]\,
      I5 => \rst_cnt_reg_n_0_[4]\,
      O => \rst_cnt[7]_i_3_n_0\
    );
\rst_cnt_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => clear,
      CLR => \rst_cnt[7]_i_2_n_0\,
      D => p_0_in(0),
      Q => \rst_cnt_reg_n_0_[0]\
    );
\rst_cnt_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => clear,
      CLR => \rst_cnt[7]_i_2_n_0\,
      D => p_0_in(1),
      Q => \rst_cnt_reg_n_0_[1]\
    );
\rst_cnt_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => clear,
      CLR => \rst_cnt[7]_i_2_n_0\,
      D => p_0_in(2),
      Q => \rst_cnt_reg_n_0_[2]\
    );
\rst_cnt_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => clear,
      CLR => \rst_cnt[7]_i_2_n_0\,
      D => p_0_in(3),
      Q => \rst_cnt_reg_n_0_[3]\
    );
\rst_cnt_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => clear,
      CLR => \rst_cnt[7]_i_2_n_0\,
      D => p_0_in(4),
      Q => \rst_cnt_reg_n_0_[4]\
    );
\rst_cnt_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => clear,
      CLR => \rst_cnt[7]_i_2_n_0\,
      D => p_0_in(5),
      Q => \rst_cnt_reg_n_0_[5]\
    );
\rst_cnt_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => clear,
      CLR => \rst_cnt[7]_i_2_n_0\,
      D => p_0_in(6),
      Q => \rst_cnt_reg_n_0_[6]\
    );
\rst_cnt_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => clear,
      CLR => \rst_cnt[7]_i_2_n_0\,
      D => p_0_in(7),
      Q => p_0_in_0
    );
uii2c_inst: entity work.system_1_uicfg0308_0_0_uii2c
     port map (
      DOADO(15 downto 8) => wr_data(15 downto 8),
      DOADO(7 downto 0) => wr_data(23 downto 16),
      E(0) => uii2c_inst_n_5,
      \TS_S_reg[1]\ => uii2c_inst_n_3,
      clear => clear,
      clk_i => clk_i,
      cmos_scl => cmos_scl,
      cmos_sda => cmos_sda,
      iic_busy => iic_busy,
      iic_busy_reg_0 => uii2c_inst_n_4,
      iic_req => iic_req,
      iic_req_reg => uii2c_inst_n_6,
      iic_req_reg_0 => \TS_S_reg_n_0_[1]\,
      iic_req_reg_1 => \TS_S_reg_n_0_[0]\,
      p_0_in_0 => p_0_in_0,
      \sda_r_reg[1]_0\ => \wr_data_reg_n_0_[6]\
    );
\wr_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_i,
      CE => uii2c_inst_n_4,
      D => '1',
      Q => \wr_data_reg_n_0_[6]\,
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_1_uicfg0308_0_0 is
  port (
    clk_i : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    cmos_scl : out STD_LOGIC;
    cmos_sda : inout STD_LOGIC;
    cfg_done : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_1_uicfg0308_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_1_uicfg0308_0_0 : entity is "system_1_uicfg0308_0_0,uicfg0308,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_1_uicfg0308_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_1_uicfg0308_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_1_uicfg0308_0_0 : entity is "uicfg0308,Vivado 2019.2";
end system_1_uicfg0308_0_0;

architecture STRUCTURE of system_1_uicfg0308_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.system_1_uicfg0308_0_0_uicfg0308
     port map (
      cfg_done => cfg_done,
      clk_i => clk_i,
      cmos_scl => cmos_scl,
      cmos_sda => cmos_sda,
      rst_n => rst_n
    );
end STRUCTURE;
