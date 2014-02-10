library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

entity shift4_tb is
end shift4_tb;

architecture behavior of shift4_tb is

  -- Component Declaration for the Unit Under Test (UUT)

  component Shift4
    port(Clk  : in  std_logic;
         ClrN : in  std_logic;
         LdN  : in  std_logic;
         Sel  : in  std_logic;
         SI   : in  std_logic;
         PI   : in  std_logic_vector(3 downto 0);
         SO   : out std_logic;
         PO   : out std_logic_vector(3 downto 0)
         );
  end component;

  --Inputs
  signal Clk  : std_logic                    := '0';
  signal ClrN : std_logic                    := '0';
  signal LdN  : std_logic                    := '0';
  signal Sel  : std_logic                    := '0';
  signal SI   : std_logic                    := '0';
  signal PI   : std_logic_vector(3 downto 0) := (others => '0');

  --Outputs
  signal SO : std_logic;
  signal PO : std_logic_vector(3 downto 0);

  -- Clock period definitions
  constant Clk_period : time := 10 ns;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut : Shift4 port map(
    Clk  => Clk,
    ClrN => ClrN,
    LdN  => LdN,
    Sel  => Sel,
    SI   => SI,
    PI   => PI,
    SO   => SO,
    PO   => PO);

  -- Clock process definitions
  Clk_process : process
  begin
    Clk <= '0';
    wait for Clk_period / 2;
    Clk <= '1';
    wait for Clk_period / 2;
  end process;

  -- Stimulus process
  stim_proc : process
  begin
    -- hold reset state for 100 ns.
    wait for 100 ns;

    wait for Clk_period*10;
    ClrN <= '1';
    PI   <= "1010";
    wait for Clk_period*10;
    LdN  <= '1';
    wait for Clk_period*10;
    Sel  <= '1';
    wait for Clk_period*10;
    SI   <= '1';
    wait;
  end process;

end;
