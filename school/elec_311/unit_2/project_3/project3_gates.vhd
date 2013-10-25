-------------------------------------------------------------------------
-- Author            : Dr. Ron Hayne
-- Date              : June 1, 2011
-- Course            : ELEC 311
-- File Name         : project3_gates.vhd
-- Design Units      : PROJECT3_GATES, XOR2, FullAdder
-- Purpose of Code   : Package containing description of components
--                     for Project 3
-- Hardware modeled  : XOR gate, Full Adder
-------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

package PROJECT3_GATES is
  component ExclusiveOR
    port (X : in std_logic;
          Y : in std_logic;
          F : out std_logic);
  end component;
  component FullAdder
    port (X    : in  std_logic;
          Y    : in  std_logic;
          Cin  : in  std_logic;
          Cout : out std_logic;
          SUM  : out std_logic);
  end component;
end package;
------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity ExclusiveOR is
  port (X : in std_logic;
        Y : in std_logic;
        F : out std_logic);
end ExclusiveOR;

architecture DATAFLOW of ExclusiveOR is
begin
  F <= X xor Y after 10 ns;
end DATAFLOW;
-------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder is
  port (X  : in  std_logic;
        Y    : in  std_logic;
        Cin  : in  std_logic;
        Cout : out std_logic;
        SUM : out std_logic);
end FullAdder;

architecture DATAFLOW of FullAdder is
begin
  SUM <= X xor Y xor Cin after 10 ns;
  Cout <= (X and Y) or (X and Cin) or (Y and Cin) after 10 ns;
end DATAFLOW;
