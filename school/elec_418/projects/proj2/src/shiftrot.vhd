-------------------------------------------------------------------------------
-- File       : shiftrot.vhd
-- Author     : Charles Pittman  <charles.pittman@gmail.com>
-------------------------------------------------------------------------------
-- Title      : 8-bit Rotating Shifter
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity RottedShift is
  port(Clk, Start : in bit;
       N : in bit_vector(2 downto 0);
       Din : in bit_vector(7 downto 0);
       Dout : out bit_vector(7 downto 0));
end RottedShift;

architecture Behav of RottedShift is
  signal load, shift, done : bit;
  signal d : bit_vector(7 downto 0);
  signal state : integer;

  begin  -- architecture Behav
    -- Controller
    process(Clk, Start)
      begin
        -- When given Start, set d <= Din
        -- On each Clk, issue shift signal and decrement N
        -- When N is 0, issue done signal
    end process;

    -- Data Path
    process(Clk, load)
      begin
        -- On each Clk, shift if asked
        -- When given done signal, set Dout <= d
      end process;
end architecture Behav;
