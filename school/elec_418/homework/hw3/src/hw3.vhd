library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;

entity Controller_1 is
  port (Clk, Go, M1, M2    : in  std_logic := '0';
        Ld, Bk, Gr, Rd, Yw : out std_logic := '0');
end Controller_1;

architecture Behav of Controller_1 is
  signal state, nextState : integer;

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
