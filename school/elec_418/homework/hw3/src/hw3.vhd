library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;

entity Controller_1 is
  port (Clk, Go, M1, M2    : in  std_logic := '0';
        Ld, Bk, Gr, Rd, Yw : out std_logic := '0');
end Controller_1;

architecture Behav of Controller_1 is
  signal state, nextState : integer := 0;

begin
  -- Process re-evaluates when any input (except Clk) changes, or when the
  -- value of state changes.  All inputs are set externally.
  -- Note: Signal state should be set ONLY by assigning it the value of
  -- nextState, and only on the clock edge (i.e. only set it in a separate,
  -- clocked process).
  process(Go, M1, M2, state)
  begin
    Ld <= '0'; Bk <= '0'; Gr <= '0'; Rd <= '0'; Yw <= '0';
    case state is
      when 0 =>
        if Go = '1' then
          Ld        <= '1';
          nextstate <= 1;
        else
          nextstate <= 0;
        end if;
      when 1 =>
        Bk <= '1';
        if M1 = '1' then
          nextstate <= 3;
        elsif (M1 = '0') and (M2 = '1') then
          nextstate <= 3;
        elsif M2 <= '0' then
          Gr        <= '1';
          nextstate <= 2;
        else
          -- Should NEVER get here.  Used as an error signal when when
          -- testing
          nextstate <= 6;
        end if;
      when 2 =>
        nextstate <= state + 1;
      when 3 =>
        Rd        <= '1';
        nextstate <= state + 1;
      when 4 =>
        Yw        <= '1';
        nextstate <= 0;
      when others =>
        -- On any nonexisting state, just go back to the start.
        nextstate <= 0;
    end case;
  end process;

  -- This process's sole purpose is to ensure state changes happen only on
  -- clock edges.
  process(Clk)
  begin
    if rising_edge(Clk) then
      state <= nextState;
    end if;
  end process;
end Behav;

-----

--entity Controller_1 is
--  port (Clk, Go, M1, M2    : in  std_logic := '0';
--        Ld, Bk, Gr, Rd, Yw : out std_logic := '0');
--end Controller_1;

--architecture microprog of Controller_1 is
--  type state is (s0, s01, s1, s10, s11, s2, s3, s4);
--  signal presentState, nextState : state;

--  -- Only need 13 bytes, but compiler doesn't like the hex strings below unless
--  -- the vector is 16 bits.  Error: string length does not match that of the
--  -- anonymous integer subtype defined at src/hw3.vhd:80:52 (next line)
--  --type ROM is array(7 downto 0) of std_logic_vector(15 downto 0);
--  --constant CONTROL_STORE : ROM := ("0000000000100000",
--  --                                 "0001101001010000",
--  --                                 "0000101111001000",
--  --                                 "0001010011000000",
--  --                                 "0001110110100100",
--  --                                 "0001111111100000",
--  --                                 "0001111111100010",
--  --                                 "0001100000000001");

--  type ROM is array(0 to 7) of std_logic_vector(15 downto 0);
--  constant CONTROL_STORE : ROM := (X"0020", X"1A50", X"0BC8", X"14C0", X"1DA4", X"1FE0", X"1FE2", X"1801");

--  signal tmux : std_logic;
--  signal uAR  : std_logic_vector(2 downto 0)  := "000";
--  signal uIR  : std_logic_vector(15 downto 0) := X"0000";

--  alias test : std_logic_vector(1 downto 0) is uIR(12 downto 11);
--  alias NSF  : std_logic_vector(2 downto 0) is uIR(10 downto 8);
--  alias NST  : std_logic_vector(2 downto 0) is uIR(7 downto 5);

--begin
--  Ld <= uIR(4);
--  Bk <= uIR(3);
--  Gr <= uIR(2);
--  Rd <= uIR(1);
--  Yw <= uIR(0);


--  with test select tmux <= Go when "00",
--                           M1  when "01",
--                           M2  when "10",
--                           '1' when others;

--  process(Clk)
--  begin
--    if falling_edge(Clk) then
--      uIR <= CONTROL_STORE(conv_integer(uAR));
--    end if;
--  end process;

--  process(Clk)
--  begin
--    if rising_edge(Clk) then
--      if tmux = '1' then
--        uAR <= NST;
--      else
--        uAR <= NSF;
--      end if;
--    end if;
--  end process;
--end microprog;
