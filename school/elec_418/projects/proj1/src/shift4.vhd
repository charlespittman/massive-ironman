-------------------------------------------------------------------------------
-- File       : shift4.vhd
-- Author     : Charles Pittman  <charles.pittman@gmail.com>
-------------------------------------------------------------------------------
-- Title      : 4-bit Shift Register
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity Shift4 is
  port(Clk, ClrN, LdN : in std_logic;

       -- Sel = 0: shift right with sign extension
       -- Sel = 1: shift right with serial data in (SI)
       Sel : in std_logic;

       -- Serial-in (used when data is shifted in to the register)
       SI : in std_logic;

       -- Parallel-in (used when loading a value to the register)
       PI : in std_logic_vector(3 downto 0);

       SO : out std_logic;                      -- Serial-out
       PO : out std_logic_vector(3 downto 0));  -- Parallel-out
end entity Shift4;

architecture BeeHive of Shift4 is
  signal Hi : std_logic := '1';
  signal Lo : std_logic := '0';
  signal Q  : std_logic_vector(3 downto 0);
begin  -- architecture Bee-Hive
  process(Clk)
  begin
    if Clk'event and Clk = Lo then
      if ClrN = Lo then Q   <= "0000";
      elsif LdN = Lo then Q <= PI;
      elsif Sel = Lo then Q <= Q(3) & Q(3 downto 1);
      else Q                <= SI & Q(3 downto 1);
      end if;
      SO                    <= Q(0);
      PO                    <= Q;
    end if;
  end process;
end architecture BeeHive;
