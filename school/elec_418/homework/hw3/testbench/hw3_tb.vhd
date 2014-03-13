-------------------------------------------------------------------------------
-- Title      : Testbench for design "hw3"
-- Project    :
-------------------------------------------------------------------------------
-- File       : hw3_tb.vhd
-- Author     : Charles Pittman  <charles.pittman@gmail.com>
-- Company    :
-- Created    : 2014-03-13
-- Last update: 2014-03-13
-- Platform   :
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- Copyright (c) 2014
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-03-13  1.0      cpittman	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity hw3_tb is

end entity hw3_tb;

-------------------------------------------------------------------------------

architecture testbench of hw3_tb is

  -- component ports
  signal Go, M1, M2    : std_logic := '0';
  signal Ld, Bk, Gr, Rd, Yw : std_logic := '0';

  -- clock
  signal Clk : std_logic := '1';
  constant tick : time := 5 ns;

begin  -- architecture testbench

  -- component instantiation
  DUT: entity work.Controller_1
    port map (Clk => Clk,
              Go  => Go,
              M1  => M1,
              M2  => M2,
              Ld  => Ld,
              Bk  => Bk,
              Gr  => Gr,
              Rd  => Rd,
              Yw  => Yw);

  -- clock generation
  Clk <= not Clk after (tick / 2);

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here
    M1 <= '1';
    M2 <= '0';
    wait for tick*2;
    Go <= '1';
    wait for tick;
    M1 <= '0';
    wait for tick*2;
    M2 <= '1';
    wait until Clk = '1';
  end process WaveGen_Proc;

end architecture testbench;

-------------------------------------------------------------------------------

configuration hw3_tb_testbench_cfg of hw3_tb is
  for testbench
  end for;
end hw3_tb_testbench_cfg;

-------------------------------------------------------------------------------
