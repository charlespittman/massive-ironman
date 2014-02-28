-- This is a behavioral model of a multiplier for unsigned
-- binary numbers.  It multiplies a 4-bit multiplicand
-- by a 4-bit multiplier to give an 8-bit product.

-- The maximum number of clock cycles needed for a 
-- multiply is 10.

library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Mult4X4 is
  port(Clk, St: in std_logic;
       Mplier, Mcand: in std_logic_vector(3 downto 0);
       Product: out std_logic_vector(7 downto 0);
       Done: out std_logic);
end Mult4X4;

architecture Behave of Mult4X4 is
signal State: integer range 0 to 9;
signal ACC: std_logic_vector(8 downto 0); -- accumulator
alias M: std_logic is ACC(0);      -- M is bit 0 of ACC
begin
  process(Clk)
  begin 
    if Clk'event and Clk = '1' then  -- executes on rising edge of clock
      case State is
        when 0=>              -- initial State
          if St='1' then
            ACC(8 downto 4) <= "00000"; -- begin cycle
            ACC(3 downto 0) <= Mplier;  -- load the multiplier
            State <= 1; 
          end if;
        when 1 | 3 | 5 | 7  =>   -- "add/shift" State
          if M = '1' then        -- add multiplicand
            ACC(8 downto 4) <= '0' & ACC(7 downto 4) + Mcand;
            State <= State + 1;
          else
            ACC <= '0' & ACC(8 downto 1);  -- shift accumulator right
            State <= State + 2;
          end if;
        when 2 | 4 | 6 | 8 =>             -- "shift" State
          ACC <= '0' & ACC(8 downto 1);   -- right shift
          State <= State + 1; 
        when 9 =>          -- end of cycle
          State <= 0;
      end case;
    end if;
  end process;
  Done <= '1' when State = 9 else '0';
  Product <= ACC(7 downto 0);
end Behave;
