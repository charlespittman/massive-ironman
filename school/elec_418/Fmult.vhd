library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FMUL is
  port(CLK, St: in std_logic;
       F1, E1, F2, E2: in std_logic_vector(3 downto 0);
       F: out std_logic_vector(6 downto 0);
       E: out std_logic_vector(4 downto 0);
       V, done: out std_logic); 
end FMUL;

architecture BEHAVE of FMUL is
signal A, B, C, compout, addout: std_logic_vector(3 downto 0); -- fraction registers
alias M: std_logic is B(0);
signal X, Y: std_logic_vector(4 downto 0);              -- exponent registers
signal Load, Adx, SM8, RSF, LSF: std_logic;
signal AdSh, Sh, Cm, Mdone: std_logic;
signal PS1, NS1: integer range 0 to 3;          -- present and next state 
signal State, Nextstate: integer range 0 to 4;  -- multiplier control state
begin
  main_control: process(PS1, St , Mdone, X, A, B)
  begin
    Load <= '0'; Adx <= '0'; NS1 <= 0;          -- clear control signals
    SM8 <= '0'; RSF <= '0'; LSF <= '0'; V <= '0';
    done <= '0';
    case PS1 is
      when 0 => 
        if St = '1' then Load <= '1'; NS1 <= 1; end if;
      when 1 => Adx <= '1'; NS1 <= 2;
      when 2 =>
        if Mdone = '1' then                     -- wait for multiply
          if A = 0 then                         -- zero fraction
            SM8 <= '1';
          elsif A = 4 and B = 0 then
            RSF <= '1';                         -- shift AB right
          elsif A(2) = A(1) then                -- test for unnormalized
            LSF <= '1';                         -- shift AB left
          end if;
          NS1 <= 3;
        else
          NS1 <= 2;
        end if;
      when 3 =>                                 -- test for exp overflow
        if X(4) /= X(3) then V <= '1'; end if;
        done <= '1';
        if ST = '0' then NS1 <= 0; end if;
      end case;
  end process main_control;

  mul2c: process(State, Adx, M)                 -- 2's complement multiply
  begin
    AdSh <= '0'; Sh <= '0'; Cm <= '0'; Mdone <= '0'; -- clear control signals
    Nextstate <= 0;
    case State is
      when 0 =>                                  -- start multiply
        if Adx = '1' then
          if M = '1' then AdSh <= '1'; else Sh <= '1'; end if;
          Nextstate <= 1;
        end if;
      when 1 | 2 =>                              -- add/shift state
        if M = '1' then AdSh <= '1'; else Sh <= '1'; end if;
        Nextstate <= State + 1;
      when 3 =>
        if M = '1' then Cm <= '1'; AdSh <= '1'; else Sh <='1'; end if;
        Nextstate <= 4;
      when 4 =>
        Mdone <= '1';  Nextstate <= 0;
    end case;
  end process mul2c;

  compout <= not C when Cm = '1' else C;
  addout <= A + compout + Cm;
  datapath: process(CLK)                         -- update registers
  begin
    if rising_edge(CLK) then 
      PS1 <= NS1;
      State <= Nextstate;
      if Load = '1' then
        X <= E1(3) & E1; Y <= E2(3) & E2;
        A <= "0000"; B <= F2; C <= F1;
      end if;
      if ADX = '1' then 
		  X <= X + Y; end if;
      if SM8 = '1' then 
		  X <= "11000"; end if;
      if RSF = '1' then 
		  A <= '0' & A(3 downto 1);
        B <= A(0) & B(3 downto 1);
        X <= X + 1;
      end if;                                      -- increment X
      if LSF = '1' then
        A <= A(2 downto 0) & B(3); 
		  B <= B(2 downto 0) & '0';
        X <= X - 1;
      end if;                                      -- decrement X
      if AdSh = '1' then
        A <= compout(3) & addout(3 downto 1);   -- load shifted adder
        B <= addout(0) & B(3 downto 1);
      end if;                                      -- output into A & B
      if Sh = '1' then
        A <= A(3) & A(3 downto 1);                 -- right shift A & B
        B <= A(0) & B(3 downto 1);                 -- with sign extend
      end if;
    end if;
  end process datapath;
  
  F <= A(2 downto 0) & B;                 -- output fraction
  E <= X;                                 -- output exponent

end BEHAVE;
