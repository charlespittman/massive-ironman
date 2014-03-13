library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;

entity Controller is
  port (Clk, Go, M1, M2    : in  std_logic := '0';
        Ld, Bk, Gr, Rd, Yw : out std_logic := '0');
end Controller;

architecture SMBehav of Controller is
  signal state, nextState : integer range 0 to 4;

begin
  -- Process re-evaluates when any input (except Clk) changes, or when the
  -- value of state changes.  All inputs are set externally.
  -- Note: Signal state should be set ONLY by assigning it the value of
  -- nextState, and only on the clock edge (i.e. only set it in a separate,
  -- clocked process).
  process(Go, M1, M2, state)
  begin
    -- set outputs to 0
    case state is
      when 0 =>
        nextstate <= state + 1;
      when 1 =>
        nextstate <= state + 1;
      when 2 =>
        nextstate <= state + 1;
      when 3 =>
        nextstate <= state + 1;
      when 4 =>
        nextstate <= state + 1;
      when others =>
        nextState <= 0;
    end case;
  end process;

  process(Clk)
  begin
    if rising_edge(Clk) then
    end if;
  end process;
end SMBehav;
