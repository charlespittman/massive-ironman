--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : sch2hdl
--  /   /         Filename : circuit.vhf
-- /___/   /\     Timestamp : 09/12/2013 17:03:47
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/cpittman/project1/circuit.vhf -w /home/cpittman/project1/circuit.sch
--Design Name: circuit
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

entity circuit is
   port ( E  : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          S  : in    std_logic; 
          Z  : out   std_logic);
end circuit;

architecture BEHAVIORAL of circuit is
   attribute BOX_TYPE   : string ;
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_19 : std_logic;
   signal XLXN_20 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>I0,
                I1=>XLXN_3,
                O=>XLXN_1);
   
   XLXI_2 : AND2
      port map (I0=>S,
                I1=>I1,
                O=>XLXN_2);
   
   XLXI_4 : OR2
      port map (I0=>I1,
                I1=>XLXN_1,
                O=>XLXN_19);
   
   XLXI_5 : OR2
      port map (I0=>XLXN_2,
                I1=>I0,
                O=>XLXN_20);
   
   XLXI_6 : INV
      port map (I=>S,
                O=>XLXN_3);
   
   XLXI_13 : AND3
      port map (I0=>XLXN_20,
                I1=>E,
                I2=>XLXN_19,
                O=>Z);
   
end BEHAVIORAL;


