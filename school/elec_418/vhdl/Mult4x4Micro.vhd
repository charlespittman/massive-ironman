library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mult4X4_micro is
  port(Clk, St: in std_logic;
       Mplier, Mcand: in std_logic_vector(3 downto 0);
       Product: out std_logic_vector(7 downto 0);
       Done: out std_logic);
end mult4X4_micro;

architecture microprogram of mult4X4_micro is
type ROM is array(0 to 5) of std_logic_vector(11 downto 0);
constant control_store: ROM := (X"010", X"D28", X"630", X"E44", X"952", X"C01");
signal ACC: std_logic_vector(8 downto 0) := "000000000"; 
alias M: std_logic is ACC(0);
signal TMUX, Load, Ad, Sh, K: std_logic;
signal counter: std_logic_vector(1 downto 0) := "00";
signal uAR: std_logic_vector(2 downto 0) := "000";
signal uIR: std_logic_vector(11 downto 0) := X"000";
alias TEST: std_logic_vector(1 downto 0) is uIR(11 downto 10);
alias NSF: std_logic_vector(2 downto 0) is uIR(9 downto 7);
alias NST: std_logic_vector(2 downto 0) is uIR(6 downto 4);
begin
  Load <= uIR(3);
  Ad <= uIR(2);
  Sh <= uIR(1);
  Done <= uIR(0);
  Product <= ACC(7 downto 0);
  K <= '1' when counter = "11" else '0';
  with TEST select
    TMUX <= St when "00",
            M  when "01",
            K  when "10",
            '1' when others;
  controller: process(Clk)
  begin 
    if falling_edge(Clk) then
      uIR <= control_store(conv_integer(uAR));
    end if;
    if rising_edge(Clk) then
      if TMUX = '0' then
        uAR <= NSF;
      else
        uAR <= NST;
      end if;
      if Sh = '1' then
        counter <= counter + 1;
      end if;
    end if;
  end process;
  datapath: process(Clk)
  begin
    if rising_edge(Clk) then
      if Load = '1' then
        ACC(8 downto 4) <= "00000";
        ACC(3 downto 0) <= Mplier; 
      end if;
      if Ad = '1' then
        ACC(8 downto 4) <= '0' & ACC(7 downto 4) + Mcand;
      end if;
      if Sh = '1' then
        ACC <= '0' & ACC(8 downto 1);
      end if;
    end if;
  end process;
end microprogram;
