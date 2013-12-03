--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : sch2hdl
--  /   /         Filename : circuit.vhf
-- /___/   /\     Timestamp : 09/26/2013 11:33:14
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/cpittman/project2/circuit.vhf -w /home/cpittman/project2/circuit.sch
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
   port ( );
end circuit;

architecture BEHAVIORAL of circuit is
   attribute BOX_TYPE   : string ;
   signal XLXN_1               : std_logic;
   signal XLXN_2               : std_logic;
   signal XLXN_3               : std_logic;
   signal XLXN_4               : std_logic;
   signal XLXN_5               : std_logic;
   signal XLXN_6               : std_logic;
   signal XLXN_7               : std_logic;
   signal XLXI_1_I2_openSignal : std_logic;
   signal XLXI_2_I1_openSignal : std_logic;
   signal XLXI_2_I2_openSignal : std_logic;
   signal XLXI_3_I1_openSignal : std_logic;
   signal XLXI_3_I2_openSignal : std_logic;
   signal XLXI_14_I_openSignal : std_logic;
   signal XLXI_15_I_openSignal : std_logic;
   signal XLXI_16_I_openSignal : std_logic;
   signal XLXI_17_I_openSignal : std_logic;
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND3
      port map (I0=>XLXN_5,
                I1=>XLXN_4,
                I2=>XLXI_1_I2_openSignal,
                O=>XLXN_1);
   
   XLXI_2 : AND3
      port map (I0=>XLXN_6,
                I1=>XLXI_2_I1_openSignal,
                I2=>XLXI_2_I2_openSignal,
                O=>XLXN_2);
   
   XLXI_3 : AND3
      port map (I0=>XLXN_7,
                I1=>XLXI_3_I1_openSignal,
                I2=>XLXI_3_I2_openSignal,
                O=>XLXN_3);
   
   XLXI_4 : OR3
      port map (I0=>XLXN_3,
                I1=>XLXN_2,
                I2=>XLXN_1,
                O=>open);
   
   XLXI_14 : INV
      port map (I=>XLXI_14_I_openSignal,
                O=>XLXN_4);
   
   XLXI_15 : INV
      port map (I=>XLXI_15_I_openSignal,
                O=>XLXN_5);
   
   XLXI_16 : INV
      port map (I=>XLXI_16_I_openSignal,
                O=>XLXN_6);
   
   XLXI_17 : INV
      port map (I=>XLXI_17_I_openSignal,
                O=>XLXN_7);
   
end BEHAVIORAL;


