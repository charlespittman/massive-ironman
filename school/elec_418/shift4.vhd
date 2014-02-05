----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    21:00:28 02/04/2014
-- Design Name:
-- Module Name:    shift4 - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shift4 is
  port(Clk, ClrN, LdN: in std_logic;
       Sel: in std_logic;  -- Sel = 0: shift right with sign extension
                           -- Sel = 1: shift right with serial data in (SI)
       SI: in  std_logic;                     -- Serial-in (used when data is shifted in to the register)
       PI: in  std_logic_vector(3 downto 0);  -- Parallel-in (used when loading a value to the register)
       SO: out std_logic;                     -- Serial-out
       PO: out std_logic_vector(3 downto 0)); -- Parallel-out
end entity Shift4;

architecture BeeHive of Shift4 is
  signal Q : std_logic_vector(3 downto 0);
begin  -- architecture Bee-Hive
  process(Clk)
    begin
      if Clk'event and Clk = '0' then
        if ClrN = '0' then Q <= "0000";
        elsif LdN ='0' then Q <= PI;
        elsif Sel = '0' then Q <= Q(3) & Q(3 downto 1);
        else Q <= SI & Q(3 downto 1);
        end if;
        SO <= Q(0);
        PO <= Q;
      end if;
    end process;
end architecture BeeHive;
