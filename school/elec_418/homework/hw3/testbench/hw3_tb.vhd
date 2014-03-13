library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity hw3_tb is

end entity hw3_tb;

-------------------------------------------------------------------------------

architecture tb of hw3_tb is

  -- component ports
  signal Clk, Go, M1, M2    : std_logic := '0';
  signal Ld, Bk, Gr, Rd, Yw : std_logic := '0';
  constant tick : time := 5 ns;

begin  -- architecture tb

  -- component instantiation
  DUT1: entity work.Controller_1
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

  end process WaveGen_Proc;

end architecture tb;
