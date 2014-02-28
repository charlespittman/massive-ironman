--------------------------------------------------------------------------------
-- Company: The Citadel
-- Engineer: Dr. Ron Hayne
--
-- Create Date:   16:06:03 07/09/2013
-- Design Name:   
-- Module Name:   C:/Hayne/ELEC418/Xilinx/Counter74163iSim/Counter74163test.vhd
-- Project Name:  Counter74163
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Counter74163
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
 
ENTITY Counter74163test IS
END Counter74163test;
 
ARCHITECTURE behavior OF Counter74163test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter74163
    PORT(
         LdN : IN  std_logic;
         ClrN : IN  std_logic;
         P : IN  std_logic;
         T : IN  std_logic;
         Clk : IN  std_logic;
         D : IN  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic;
         Qout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LdN : std_logic := '0';
   signal ClrN : std_logic := '0';
   signal P : std_logic := '0';
   signal T : std_logic := '0';
   signal Clk : std_logic := '0';
   signal D : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Cout : std_logic;
   signal Qout : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter74163 PORT MAP (
          LdN => LdN,
          ClrN => ClrN,
          P => P,
          T => T,
          Clk => Clk,
          D => D,
          Cout => Cout,
          Qout => Qout
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
     wait for Clk_period*1.25;
     ClrN <= '1'; LdN <= '0'; P <= '1'; T <= '1'; D <= "1100";
     wait for Clk_period;
     LdN <= '1';
     wait for Clk_period*5;
     P <= '0';
     wait for Clk_period*4;
     ClrN <= '0';
     wait;
   end process;

END;
