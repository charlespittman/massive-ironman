--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   23:29:50 02/04/2014
-- Design Name:
-- Module Name:   /home/charles/project_01/shift4_test.vhd
-- Project Name:  project_01
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: Shift4
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY shift4_test IS
END shift4_test;

ARCHITECTURE behavior OF shift4_test IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Shift4
    PORT(
         Clk : IN  std_logic;
         ClrN : IN  std_logic;
         LdN : IN  std_logic;
         Sel : IN  std_logic;
         SI : IN  std_logic;
         PI : IN  std_logic_vector(3 downto 0);
         SO : OUT  std_logic;
         PO : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal Clk : std_logic := '0';
   signal ClrN : std_logic := '0';
   signal LdN : std_logic := '0';
   signal Sel : std_logic := '0';
   signal SI : std_logic := '0';
   signal PI : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal SO : std_logic;
   signal PO : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Shift4 PORT MAP (
          Clk => Clk,
          ClrN => ClrN,
          LdN => LdN,
          Sel => Sel,
          SI => SI,
          PI => PI,
          SO => SO,
          PO => PO
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for Clk_period*10;

      -- insert stimulus here
      ClrN <= '1';

      wait;
   end process;

END;
