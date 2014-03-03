-------------------------------------------------------------------------------
-- File       : shiftrot.vhd
-- Author     : Charles Pittman  <charles.pittman@gmail.com>
-------------------------------------------------------------------------------
-- Title      : 8-bit Rotating Shifter
-------------------------------------------------------------------------------
-- 65.105.110.275.461
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use ieee.std_logic_unsigned.all;

entity RottedShift is
  port(Clk, Start : in std_logic;
       --N : in std_logic_vector(2 downto 0);
       N : in integer range 0 to 7;
       Din : in std_logic_vector(7 downto 0);
       Dout : out std_logic_vector(7 downto 0));
end RottedShift;

architecture Behav of RottedShift is
  signal load, shift, done : std_logic;
  signal d : std_logic_vector(7 downto 0);
  --signal count : std_logic_vector(2 downto 0);
  signal count : integer;
  signal state, nextstate : integer range 0 to 2;

  signal hi : std_logic := '1';

  begin  -- architecture Behav

    -- Controller
    process(Clk)
      begin
        if rising_edge(Clk) then
          case state is
            when 0 =>
              if Start = '1' then
                load <= '1';
                count <= N;
                nextstate <= state + 1;
              end if;
            when 1 =>
              load <= '0';
              nextstate <= state + 1;
            when 2 =>
              if count = 0 then
                done <= '1';
              else
                shift <= '1';
                count <= count - 1;
              end if;
            when others =>
              state <= 0;
          end case;
          state <= nextstate;
        end if;
        -- When given Start, set d <= Din
        -- On each Clk, issue shift signal and decrement N
        -- When N is 0, issue done signal
    end process;

    -- Data Path
    process(Clk, load)
      begin
        if rising_edge(Clk) then
          if load = '1' then
            d <= Din;
          elsif done = '1' then
            -- Dout <= d;
          elsif shift = '1' then
            d <= d(6 downto 0) & d(7);
          end if;
          Dout <= d;
        end if;
        -- On each Clk, shift if asked
        -- When given done signal, set Dout <= d
      end process;
end architecture Behav;
