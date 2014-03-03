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

-------------------------------------------------------------------------------

entity shiftrot_tb is

end entity shiftrot_tb;

-------------------------------------------------------------------------------

architecture Behav of shiftrot_tb is

  -- component ports
  signal Clk, Start : bit;
  signal N          : bit_vector(2 downto 0);
  signal Din        : bit_vector(7 downto 0);
  signal Dout       : bit_vector(7 downto 0);

  -- clock
--  signal Clk : std_logic := '1';

begin  -- architecture Behav

  -- component instantiation
  DUT: entity work.RottedShift
    port map (
      Clk   => Clk,
      Start => Start,
      N     => N,
      Din   => Din,
      Dout  => Dout);

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here

    wait until Clk = '1';
  end process WaveGen_Proc;

end architecture Behav;
