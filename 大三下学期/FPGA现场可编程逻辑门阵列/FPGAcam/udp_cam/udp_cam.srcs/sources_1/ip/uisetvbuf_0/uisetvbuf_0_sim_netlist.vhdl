-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Thu May 28 10:54:48 2026
-- Host        : sw running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/FPGAcam/udp_cam/udp_cam.srcs/sources_1/ip/uisetvbuf_0/uisetvbuf_0_sim_netlist.vhdl
-- Design      : uisetvbuf_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity uisetvbuf_0 is
  port (
    bufn_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    bufn_o : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of uisetvbuf_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of uisetvbuf_0 : entity is "uisetvbuf_0,uisetvbuf,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of uisetvbuf_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of uisetvbuf_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of uisetvbuf_0 : entity is "uisetvbuf,Vivado 2019.2";
end uisetvbuf_0;

architecture STRUCTURE of uisetvbuf_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^bufn_o\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \bufn_o[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \bufn_o[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \bufn_o[1]_INST_0_i_3_n_0\ : STD_LOGIC;
begin
  bufn_o(7) <= \<const0>\;
  bufn_o(6) <= \<const0>\;
  bufn_o(5) <= \<const0>\;
  bufn_o(4) <= \<const0>\;
  bufn_o(3) <= \<const0>\;
  bufn_o(2) <= \<const0>\;
  bufn_o(1 downto 0) <= \^bufn_o\(1 downto 0);
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\bufn_o[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBB3088"
    )
        port map (
      I0 => \bufn_o[1]_INST_0_i_3_n_0\,
      I1 => bufn_i(7),
      I2 => \bufn_o[1]_INST_0_i_1_n_0\,
      I3 => bufn_i(6),
      I4 => \bufn_o[1]_INST_0_i_2_n_0\,
      O => \^bufn_o\(0)
    );
\bufn_o[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCBB3088"
    )
        port map (
      I0 => \bufn_o[1]_INST_0_i_1_n_0\,
      I1 => bufn_i(7),
      I2 => \bufn_o[1]_INST_0_i_2_n_0\,
      I3 => bufn_i(6),
      I4 => \bufn_o[1]_INST_0_i_3_n_0\,
      O => \^bufn_o\(1)
    );
\bufn_o[1]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2492492492492492"
    )
        port map (
      I0 => bufn_i(5),
      I1 => bufn_i(4),
      I2 => bufn_i(3),
      I3 => bufn_i(2),
      I4 => bufn_i(1),
      I5 => bufn_i(0),
      O => \bufn_o[1]_INST_0_i_1_n_0\
    );
\bufn_o[1]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9249492424929249"
    )
        port map (
      I0 => bufn_i(5),
      I1 => bufn_i(4),
      I2 => bufn_i(3),
      I3 => bufn_i(2),
      I4 => bufn_i(0),
      I5 => bufn_i(1),
      O => \bufn_o[1]_INST_0_i_2_n_0\
    );
\bufn_o[1]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4924249292494924"
    )
        port map (
      I0 => bufn_i(5),
      I1 => bufn_i(4),
      I2 => bufn_i(3),
      I3 => bufn_i(2),
      I4 => bufn_i(0),
      I5 => bufn_i(1),
      O => \bufn_o[1]_INST_0_i_3_n_0\
    );
end STRUCTURE;
