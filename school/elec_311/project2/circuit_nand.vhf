--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : sch2hdl
--  /   /         Filename : circuit_nand.vhf
-- /___/   /\     Timestamp : 09/26/2013 13:03:37
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/cpittman/project2/circuit_nand.vhf -w /home/cpittman/project2/circuit_nand.sch
--Design Name: circuit_nand
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity circuit_nand is
   port ( P0 : in    std_logic; 
          P1 : in    std_logic; 
          Q0 : in    std_logic; 
          Q1 : in    std_logic; 
          GT : out   std_logic);
end circuit_nand;

architecture BEHAVIORAL of circuit_nand is
   attribute BOX_TYPE   : string ;
   signal XLXN_91 : std_logic;
   signal XLXN_92 : std_logic;
   signal XLXN_93 : std_logic;
   signal XLXN_94 : std_logic;
   signal XLXN_95 : std_logic;
   signal XLXN_96 : std_logic;
   signal XLXN_99 : std_logic;
   component NAND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NAND2 : component is "BLACK_BOX";
   
   component NAND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NAND3 : component is "BLACK_BOX";
   
begin
   XLXI_40 : NAND2
      port map (I0=>Q1,
                I1=>Q1,
                O=>XLXN_91);
   
   XLXI_41 : NAND2
      port map (I0=>Q0,
                I1=>Q0,
                O=>XLXN_92);
   
   XLXI_42 : NAND2
      port map (I0=>Q1,
                I1=>Q1,
                O=>XLXN_93);
   
   XLXI_43 : NAND2
      port map (I0=>Q0,
                I1=>Q0,
                O=>XLXN_99);
   
   XLXI_44 : NAND2
      port map (I0=>XLXN_93,
                I1=>P1,
                O=>XLXN_95);
   
   XLXI_45 : NAND3
      port map (I0=>XLXN_92,
                I1=>XLXN_91,
                I2=>P0,
                O=>XLXN_94);
   
   XLXI_46 : NAND3
      port map (I0=>P0,
                I1=>XLXN_99,
                I2=>P1,
                O=>XLXN_96);
   
   XLXI_47 : NAND3
      port map (I0=>XLXN_96,
                I1=>XLXN_95,
                I2=>XLXN_94,
                O=>GT);
   
end BEHAVIORAL;


