-------------------------------------------------------------------------------
-- Title      : Testbench for design "RottedShift"
-- Project    : 8-bit Rotating Shifter
-------------------------------------------------------------------------------
-- Author     : Charles Pittman  <charles.pittman@gmail.com>
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;

-------------------------------------------------------------------------------

entity shiftrot_tb is

end entity shiftrot_tb;

-------------------------------------------------------------------------------

architecture Behav of shiftrot_tb is

  -- component ports
  signal Start : std_logic;
  signal N     : std_logic_vector(2 downto 0);
  signal Din   : std_logic_vector(7 downto 0);
  signal Dout  : std_logic_vector(7 downto 0);

  -- clock
  signal Clk          : std_logic := '1';
  constant clk_period : time      := 10 ns;

begin  -- architecture Behav

  -- component instantiation
  dut : entity work.RottedShift
    port map (
      Clk   => Clk,
      Start => Start,
      N     => N,
      Din   => Din,
      Dout  => Dout);

  -- clock generation
  Clk <= not Clk after clk_period/2;

  -- waveform generation
  WaveGen_Proc : process
  begin
    N     <= "100";
    Din   <= "11011011";
    wait until Clk = '1';
    Start <= '1';
    wait for clk_period*2;
    Start <= '0';
    wait until Dout = "10111101";
--    wait until Clk = '0';
    N     <= "110";
    Din   <= "00111100";
    wait until Clk = '1';
    start <= '1';
    wait for clk_period*2;
    start <= '0';
    wait;
  end process WaveGen_Proc;

end architecture Behav;
