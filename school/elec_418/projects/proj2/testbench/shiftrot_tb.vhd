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
  signal N          : std_logic_vector(2 downto 0);
--  signal N : integer;
  signal Din        : std_logic_vector(7 downto 0);
  signal Dout       : std_logic_vector(7 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture Behav

  -- component instantiation
  test1: entity work.RottedShift
    port map (
      Clk   => Clk,
      Start => Start,
      N     => N,
      Din   => Din,
      Dout  => Dout);

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- waveform generation
--  WaveGen_Proc: process
  process
  begin
    -- insert signal assignments here
    N <= "100";
    Din <= "11011011";
    wait until Clk = '1';
    Start <= '1';
    end process;
--    wait until Dout = "10111101";
--    N <= "110";
  --  Din <="00111100";
--  end process WaveGen_Proc;
  process
  begin
    -- insert signal assignments here
    N <= "100";
    Din <= "11011011";
    wait until Clk = '1';
    Start <= '1';
    wait until Clk = '1';
    Start <= '0';
    end process;

end architecture Behav;

--all_modes: process
--begin
---- mode variable assigned here
--case mode is
--when mode_1 =>
---- assignments to input_1, input_2, input_3
--when mode_2 =>
---- assignments to input_1, input_2, input_3
--when mode_3 =>
---- assignments to input_1, input_2, input_3
--when mode_4 =>
---- assignments to input_1, input_2, input_3
--end case;
--end process all_modes;
