library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity Shift8 is
  port(Clk, ClrN, LdN: in std_logic;
       Sel: in std_logic;  -- Sel = 0: shift right with sign extension
                           -- Sel = 1: shift right with serial data in (SI)
       SI: in  std_logic;                     -- Serial-in (used when data is shifted in to the register)
       PI: in  std_logic_vector(7 downto 0);  -- Parallel-in (used when loading a value to the register)
       SO: out std_logic;                     -- Serial-out
       PO: out std_logic_vector(7 downto 0)); -- Parallel-out
end entity Shift8;

architecture Legos of Shift8 is
  signal Hi: std_logic := '1';
  signal Lo: std_logic := '0';
  signal s: std_logic;
  signal Q: std_logic_vector(7 downto 0);

  component Shift4 is
    port (
      Clk, ClrN, LdN : in  std_logic;
      Sel            : in  std_logic;
      SI             : in  std_logic;
      PI             : in  std_logic_vector(3 downto 0);
      SO             : out std_logic;
      PO             : out std_logic_vector(3 downto 0));
  end component Shift4;

begin  -- architecture Legos

  sHigh: entity work.Shift4
    port map (
      Clk  => Clk,
      ClrN => ClrN,
      LdN  => LdN,
      Sel  => Sel,
      SI   => SI,
      PI   => PI(7 downto 4),
      SO   => s,
      PO   => PO(7 downto 4));

  sLow: entity work.Shift4
    port map (
      Clk  => Clk,
      ClrN => ClrN,
      LdN  => LdN,
      Sel  => Hi,
      SI   => s,
      PI   => PI(3 downto 0),
      SO   => SO,
      PO   => PO(3 downto 0));
end architecture Legos;
