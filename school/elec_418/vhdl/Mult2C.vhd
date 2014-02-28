library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Mult2C is
  port(CLK, St: in std_logic;
       Mplier, Mcand : in std_logic_vector(3 downto 0);
       Product: out std_logic_vector(6 downto 0);
       Done: out std_logic);
end Mult2C;

architecture Behave2 of Mult2C is
signal State, Nextstate: integer range 0 to 5;
signal A, B, compout, addout: std_logic_vector(3 downto 0);
signal AdSh, Sh, Load, Cm: std_logic;
alias M: std_logic is B(0);
begin
  process(State, St, M)
  begin
    Load <= '0'; AdSh <= '0'; Sh <= '0'; Cm <= '0'; Done <= '0'; 
    case State is
      when 0 =>            -- initial state
        if St = '1' then Load <= '1'; Nextstate <= 1; 
		  else Nextstate <= 0; end if;
      when 1 | 2 | 3  =>  -- "add/shift" State
        if M = '1' then AdSh <= '1';
        else Sh <= '1';
        end if;
        Nextstate <= State + 1;
      when 4  =>          -- add complement if sign 
        if M = '1' then   -- bit of multiplier is 1
          Cm <= '1'; AdSh <= '1';
        else Sh <= '1';
        end if;
        Nextstate <= 5;
      when 5 =>           -- output product
        Done <= '1';
        Nextstate <= 0;
    end case;
  end process;

  compout <= not Mcand when Cm = '1' else Mcand; -- complementer
  addout <= A + compout + Cm;      -- 4-bit adder with carry in

  process(CLK)
  begin
    if CLK'event and CLK = '1' then   -- executes on rising edge   -- (1)
      if Load = '1' then          -- load the multiplier
        A <= "0000";
        B <= Mplier;
      end if;
      if AdSh = '1' then          -- add multiplicand to A and shift
        A <= compout(3) & addout(3 downto 1);
        B <= addout(0) & B(3 downto 1);
      end if;
      if Sh = '1' then
        A <= A(3) & A(3 downto 1);
        B <= A(0) & B(3 downto 1);
      end if;
      State <= Nextstate;
    end if;
  end process;
  Product <= A(2 downto 0) & B;
end Behave2;
