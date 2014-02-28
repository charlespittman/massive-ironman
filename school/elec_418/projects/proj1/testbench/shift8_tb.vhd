library ieee;
use ieee.std_logic_1164.all;

entity shift8_tb is
end shift8_tb;

architecture behavior of shift8_tb is

  component Shift8
    port(
      Clk  : in  std_logic;
      ClrN : in  std_logic;
      LdN  : in  std_logic;
      Sel  : in  std_logic;
      SI   : in  std_logic;
      PI   : in  std_logic_vector(7 downto 0);
      SO   : out std_logic;
      PO   : out std_logic_vector(7 downto 0)
      );
  end component;

  --Inputs
  signal Clk  : std_logic                    := '0';
  signal ClrN : std_logic                    := '0';
  signal LdN  : std_logic                    := '0';
  signal Sel  : std_logic                    := '0';
  signal SI   : std_logic                    := '0';
  signal PI   : std_logic_vector(7 downto 0) := (others => '0');

  --Outputs
  signal SO : std_logic;
  signal PO : std_logic_vector(7 downto 0);

  -- Clock period definitions
  constant Clk_period : time := 10 ns;
  constant half_tick  : time := Clk_period/2;

  -- Hate typing these
  constant Hi : std_logic := '1';
  constant Lo : std_logic := '0';

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : Shift8 port map (
    Clk  => Clk,
    ClrN => ClrN,
    LdN  => LdN,
    Sel  => Sel,
    SI   => SI,
    PI   => PI,
    SO   => SO,
    PO   => PO
    );

  -- Clock process definitions
  Clk_process : process
  begin
    Clk <= '0';
    wait for Clk_period/2;
    Clk <= '1';
    wait for Clk_period/2;
  end process;

  -- Stimulus process
  stim_proc : process
  begin
    -- hold reset state for 100 ns.
    wait for 100 ns;

    -- Stop clearing, load first value
    ClrN <= Hi;
    PI   <= "11101110";
    LdN  <= Hi after half_tick;

    -- Shift right 4 times, then clear
    wait for Clk_period*4;
    ClrN <= Lo after half_tick;

    -- Load 2nd test vector and switch the function select
    wait for Clk_period*10;
    ClrN <= Hi;
    LdN  <= Lo;
    PI   <= "01110111";
    LdN  <= Hi after half_tick;
    Sel  <= Hi;

    -- Shift right 2 times, then clear
    wait for Clk_period*2;
    ClrN <= Lo after half_tick;

    -- Instructions as written don't explicitly demonstrate the difference
    -- between the function selector; since the shift-in value defaults to 0
    -- and the MSB of the test vector is 0, the behavior appears the same.
    -- Setting the shift-in value to 1 will show how this function differs.
    wait for Clk_period*10;
    ClrN <= Hi;
    SI <= '1';

    wait;
  end process;

end;
