-------------------------------------------------------------------------
-- Author            : Dr. Ron Hayne
-- Date              : November 14, 2008
-- Course            : ELEC 311
-- File Name         : project4_pkg.vhd
-- Design Units      : Project4_Pkg
-- Purpose of Code   : Package for Project 4
-- Hardware modeled  : CLK_DIV
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package Project4_Pkg is

  component CLK_DIV
  port( CLK_IN  : in std_logic;
        CLK_OUT : out std_logic );
  end component;

end package;

----------------------------------------------------------------------
-- Clock Divider

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity CLK_DIV is
port( CLK_IN  : in std_logic;
      CLK_OUT : out std_logic );
end CLK_DIV;

architecture BEHAVE of CLK_DIV is
  signal CLK_CNT : std_logic_vector(24 downto 0) := (others => '0');
begin
  process(CLK_IN)
  begin
    if CLK_IN'EVENT and CLK_IN = '1' then
      CLK_CNT <= CLK_CNT + 1;
    end if;
  end process;
  CLK_OUT <= CLK_CNT(24);
end BEHAVE;

