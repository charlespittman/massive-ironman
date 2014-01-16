-- 74163 FULLY SYNCHRONOUS COUNTER

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Counter74163 is
  port(LdN, ClrN, P, T, Clk: in std_logic;
       D: in std_logic_vector(3 downto 0);
       Cout: out std_logic; 
		 Qout: out std_logic_vector(3 downto 0));
end Counter74163;

architecture Behave of Counter74163 is
  signal Q: std_logic_vector(3 downto 0) := "0000";   -- Q is the counter register
begin
  
  process(Clk)
  begin
    if rising_edge(Clk) then   -- change state on rising edge
      if ClrN = '0' then  
		  Q <= "0000";
      elsif LdN = '0' then 
		  Q <= D; 
      elsif (P and T) = '1' then 
		  Q <= Q + 1;
      end if;
    end if;
  end process;
  
  Qout <= Q;
  Cout <= '1' when Q = "1111" and T = '1' else
          '0';
  
end Behave;
