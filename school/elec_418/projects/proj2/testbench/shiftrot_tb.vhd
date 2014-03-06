-------------------------------------------------------------------------------
-- Title      : Testbench for design "RottedShift"
-- Project    : 8-bit Rotating Shifter
-------------------------------------------------------------------------------
-- Author     : Charles Pittman  <charles.pittman@gmail.com>
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity shiftrot_tb is

end entity shiftrot_tb;

-------------------------------------------------------------------------------

architecture Behav of shiftrot_tb is

  -- component ports
  signal start : std_logic                    := '0';
  signal done  : std_logic                    := '0';
  signal n     : std_logic_vector(2 downto 0) := "000";
  signal Din   : std_logic_vector(7 downto 0) := "00000000";
  signal Dout  : std_logic_vector(7 downto 0) := "00000000";

  -- clock setup
  signal clk          : std_logic := '1';
  constant clk_period : time      := 10 ns;
  -- 10 ns = 10e(-9) s = 1e-8 s = 1e-8 Hz^-1 = 100 MHz

begin  -- architecture Behav

  -- component instantiation
  dut : entity work.RottedShift
    port map (
      clk   => clk,
      start => start,
      done  => done,
      N     => N,
      Din   => Din,
      Dout  => Dout);

  -- clock generation
  clk <= not clk after clk_period/2;

  -- waveform generation
  WaveGen_Proc : process
  begin
    N     <= "100"; Din   <= "11011011";
    wait until clk = '1';
    start <= '1';
    wait for clk_period*2;
    start <= '0';
    wait until Dout = "10111101";
    N     <= "110"; Din   <= "00111100";
    wait until clk = '1';
    start <= '1';
    wait for clk_period*2;
    start <= '0';
    wait;
  end process WaveGen_Proc;

end architecture Behav;
