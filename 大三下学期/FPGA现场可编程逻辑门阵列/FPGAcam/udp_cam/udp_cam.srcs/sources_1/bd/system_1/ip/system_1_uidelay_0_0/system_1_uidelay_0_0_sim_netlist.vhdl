-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Thu May 28 14:47:18 2026
-- Host        : sw running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/FPGAcam/udp_cam/udp_cam.srcs/sources_1/bd/system_1/ip/system_1_uidelay_0_0/system_1_uidelay_0_0_sim_netlist.vhdl
-- Design      : system_1_uidelay_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_1_uidelay_0_0_uidelay is
  port (
    rst_o : out STD_LOGIC;
    clk_i : in STD_LOGIC;
    rstn_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_1_uidelay_0_0_uidelay : entity is "uidelay";
end system_1_uidelay_0_0_uidelay;

architecture STRUCTURE of system_1_uidelay_0_0_uidelay is
  signal cnt : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \cnt0_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \cnt0_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \cnt[16]_i_2_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal rst_d0_i_1_n_0 : STD_LOGIC;
  signal rst_d0_i_2_n_0 : STD_LOGIC;
  signal rst_d0_i_3_n_0 : STD_LOGIC;
  signal rst_d0_i_4_n_0 : STD_LOGIC;
  signal rst_d0_i_5_n_0 : STD_LOGIC;
  signal \NLW_cnt0_inferred__0/i__carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
begin
\cnt0_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \cnt0_inferred__0/i__carry_n_0\,
      CO(2) => \cnt0_inferred__0/i__carry_n_1\,
      CO(1) => \cnt0_inferred__0/i__carry_n_2\,
      CO(0) => \cnt0_inferred__0/i__carry_n_3\,
      CYINIT => cnt(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(4 downto 1),
      S(3 downto 0) => cnt(4 downto 1)
    );
\cnt0_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt0_inferred__0/i__carry_n_0\,
      CO(3) => \cnt0_inferred__0/i__carry__0_n_0\,
      CO(2) => \cnt0_inferred__0/i__carry__0_n_1\,
      CO(1) => \cnt0_inferred__0/i__carry__0_n_2\,
      CO(0) => \cnt0_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(8 downto 5),
      S(3 downto 0) => cnt(8 downto 5)
    );
\cnt0_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt0_inferred__0/i__carry__0_n_0\,
      CO(3) => \cnt0_inferred__0/i__carry__1_n_0\,
      CO(2) => \cnt0_inferred__0/i__carry__1_n_1\,
      CO(1) => \cnt0_inferred__0/i__carry__1_n_2\,
      CO(0) => \cnt0_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(12 downto 9),
      S(3 downto 0) => cnt(12 downto 9)
    );
\cnt0_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt0_inferred__0/i__carry__1_n_0\,
      CO(3) => \NLW_cnt0_inferred__0/i__carry__2_CO_UNCONNECTED\(3),
      CO(2) => \cnt0_inferred__0/i__carry__2_n_1\,
      CO(1) => \cnt0_inferred__0/i__carry__2_n_2\,
      CO(0) => \cnt0_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(16 downto 13),
      S(3 downto 0) => cnt(16 downto 13)
    );
\cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(0),
      O => p_1_in(0)
    );
\cnt[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888A8A8A8A8A"
    )
        port map (
      I0 => \cnt[16]_i_2_n_0\,
      I1 => rst_d0_i_4_n_0,
      I2 => cnt(8),
      I3 => cnt(5),
      I4 => cnt(6),
      I5 => cnt(7),
      O => p_0_in
    );
\cnt[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777777777777777F"
    )
        port map (
      I0 => cnt(15),
      I1 => cnt(16),
      I2 => cnt(14),
      I3 => cnt(11),
      I4 => cnt(13),
      I5 => cnt(12),
      O => \cnt[16]_i_2_n_0\
    );
\cnt_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(0),
      Q => cnt(0)
    );
\cnt_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(10),
      Q => cnt(10)
    );
\cnt_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(11),
      Q => cnt(11)
    );
\cnt_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(12),
      Q => cnt(12)
    );
\cnt_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(13),
      Q => cnt(13)
    );
\cnt_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(14),
      Q => cnt(14)
    );
\cnt_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(15),
      Q => cnt(15)
    );
\cnt_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(16),
      Q => cnt(16)
    );
\cnt_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(1),
      Q => cnt(1)
    );
\cnt_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(2),
      Q => cnt(2)
    );
\cnt_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(3),
      Q => cnt(3)
    );
\cnt_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(4),
      Q => cnt(4)
    );
\cnt_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(5),
      Q => cnt(5)
    );
\cnt_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(6),
      Q => cnt(6)
    );
\cnt_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(7),
      Q => cnt(7)
    );
\cnt_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(8),
      Q => cnt(8)
    );
\cnt_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_i,
      CE => p_0_in,
      CLR => rst_d0_i_2_n_0,
      D => p_1_in(9),
      Q => cnt(9)
    );
rst_d0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => rst_d0_i_3_n_0,
      I1 => rst_d0_i_4_n_0,
      I2 => cnt(8),
      I3 => cnt(1),
      I4 => cnt(6),
      I5 => rst_d0_i_5_n_0,
      O => rst_d0_i_1_n_0
    );
rst_d0_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rstn_i,
      O => rst_d0_i_2_n_0
    );
rst_d0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010000000000"
    )
        port map (
      I0 => cnt(4),
      I1 => cnt(0),
      I2 => cnt(3),
      I3 => cnt(5),
      I4 => cnt(2),
      I5 => cnt(7),
      O => rst_d0_i_3_n_0
    );
rst_d0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => cnt(15),
      I1 => cnt(16),
      I2 => cnt(9),
      I3 => cnt(10),
      O => rst_d0_i_4_n_0
    );
rst_d0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt(12),
      I1 => cnt(13),
      I2 => cnt(11),
      I3 => cnt(14),
      O => rst_d0_i_5_n_0
    );
rst_d0_reg: unisim.vcomponents.FDCE
     port map (
      C => clk_i,
      CE => '1',
      CLR => rst_d0_i_2_n_0,
      D => rst_d0_i_1_n_0,
      Q => rst_o
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_1_uidelay_0_0 is
  port (
    clk_i : in STD_LOGIC;
    rstn_i : in STD_LOGIC;
    rst_o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_1_uidelay_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_1_uidelay_0_0 : entity is "system_1_uidelay_0_0,uidelay,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_1_uidelay_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_1_uidelay_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_1_uidelay_0_0 : entity is "uidelay,Vivado 2019.2";
end system_1_uidelay_0_0;

architecture STRUCTURE of system_1_uidelay_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_i : signal is "xilinx.com:signal:clock:1.0 clk_i CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_i : signal is "XIL_INTERFACENAME clk_i, ASSOCIATED_RESET rstn_i, FREQ_HZ 24000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_o : signal is "xilinx.com:signal:reset:1.0 rst_o RST";
  attribute X_INTERFACE_PARAMETER of rst_o : signal is "XIL_INTERFACENAME rst_o, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rstn_i : signal is "xilinx.com:signal:reset:1.0 rstn_i RST";
  attribute X_INTERFACE_PARAMETER of rstn_i : signal is "XIL_INTERFACENAME rstn_i, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.system_1_uidelay_0_0_uidelay
     port map (
      clk_i => clk_i,
      rst_o => rst_o,
      rstn_i => rstn_i
    );
end STRUCTURE;
