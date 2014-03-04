library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Mult4X4 is
  port(Clk, St: in std_logic;
       Mplier, Mcand: in std_logic_vector(3 downto 0);
       Product: out std_logic_vector(7 downto 0);
       Done: out std_logic);
end Mult4X4;

architecture Behave2 of Mult4X4 is
  signal State, NextState: integer range 0 to 9;
  signal Load, Sh, Ad: std_logic;           -- explicit control signals
  signal ACC: std_logic_vector(8 downto 0); 
  alias M: std_logic is ACC(0);             -- M is bit 0 of ACC
begin
  process(State, St, M)
  begin
    Load <= '0'; Sh <= '0'; Ad <= '0'; Done <= '0';
    case State is
      when 0 =>
        if St = '1' then
          Load <= '1';
          NextState <= 1;
        else
          NextState <= 0;
        end if;
      when 1 | 3 | 5 | 7 =>
        if M = '1' then 
          Ad <= '1';
          NextState <= State + 1;
        else
          Sh <= '1';
          NextState <= State + 2;
        end if;
      when 2 | 4 | 6 | 8 =>
        Sh <= '1';
        NextState <= State + 1;
      when 9 =>
        Done <= '1';
        NextState <= 0;
    end case;
  end process;
  process(Clk)
  begin 
    if rising_edge(CLK) then  
      if Load = '1' then
        ACC(8 downto 4) <= "00000"; 
        ACC(3 downto 0) <= Mplier; 
      end if;		  
      if Ad = '1' then
        ACC(8 downto 4) <= '0' & ACC(7 downto 4) + Mcand;
      end if;
      if Sh = '1' then
        ACC <= '0' & ACC(8 downto 1);  -- shift right
      end if;
      State <= NextState;
    end if;
  end process;
  Product <= ACC(7 downto 0);
end Behave2;
