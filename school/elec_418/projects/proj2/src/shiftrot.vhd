-------------------------------------------------------------------------------
-- Title      : 8-bit Rotating Shifter
-------------------------------------------------------------------------------
-- Author     : Charles Pittman  <charles.pittman@gmail.com>
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RottedShift is
  port(clk   : in  std_logic                    := '0';
       start : in  std_logic                    := '0';
       done  : out std_logic                    := '0';
       n     : in  std_logic_vector(2 downto 0) := "000";
       Din   : in  std_logic_vector(7 downto 0) := "00000000";
       Dout  : out std_logic_vector(7 downto 0) := "00000000");
end RottedShift;

architecture Behav of RottedShift is
  signal load, shift : std_logic := '0';
  signal shift       : std_logic := '0';
  signal fin         : std_logic := '0';  -- Triggers done signal

  signal d : std_logic_vector(7 downto 0) := "00000000";

  signal count     : std_logic_vector(2 downto 0) := "000";
  signal state     : integer range 0 to 5         := 0;
  signal nextstate : integer range 0 to 5         := 0;

begin  -- architecture Behav

  -- Controller
  process(clk, fin)
  -- When given start signal, issue load.
  -- On each clk, issue shift signal and decrement N
  -- When N is 0, issue fin signal
  begin
    if rising_edge(clk) then
      case state is
        when 0 =>
          load      <= '0'; shift <= '0'; fin <= '0';
          nextstate <= state + 1;
        when 1 =>
          if Start = '1' then
            load      <= '1'; count <= N;
            nextstate <= state + 1;
          end if;
        when 2 =>
          load      <= '0';
          nextstate <= state + 1;
        when 3 =>
          if count = 0 then
            fin       <= '1';
            nextstate <= 0;
          else
            shift <= '1';
            count <= count - 1;
          end if;
        when others => state <= 0;
      end case;
      state <= nextstate;
    end if;
  end process;

  -- Data Path
  process(clk)
  begin
    if rising_edge(clk) then
      if load = '1' then
        done <= '0';
        d    <= Din;
      elsif fin = '1' then
        done <= fin;
      elsif shift = '1' then
        d <= d(6 downto 0) & d(7);
      end if;
      Dout <= d;
    end if;
  -- On each clk, shift if asked
  end process;
end architecture Behav;
