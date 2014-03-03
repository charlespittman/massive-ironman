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
--  component RottedShift is
--    port (
--      Clk, Start : in  std_logic;
--      N          : in  std_logic_vector(2 downto 0);
--      N : in integer;
--      Din        : in  std_logic_vector(7 downto 0);
--      Dout       : out std_logic_vector(7 downto 0));
--  end component RottedShift;

  -- component ports
  signal Start : std_logic;
--  signal N          : std_logic_vector(2 downto 0);
  signal N : integer;
  signal Din        : std_logic_vector(7 downto 0);
  signal Dout       : std_logic_vector(7 downto 0);

  -- clock
  signal Clk : std_logic := '1';

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
    N <= 4;
    Din <= "11011011";
    wait until Clk = '1';
    Start <= '1';
    wait until Dout = "10111101";
    N <= 6;
    Din <="00111100";
  end process WaveGen_Proc;

end architecture Behav;
