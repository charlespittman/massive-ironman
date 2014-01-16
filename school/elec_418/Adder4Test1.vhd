--------------------------------------------------------------------------------
-- Company: The Citadel
-- Engineer: Dr. Ron Hayne
--
-- Create Date:   14:57:40 07/18/2013
-- Design Name:   
-- Module Name:   C:/Hayne/ELEC418/Xilinx/Adder4/Adder4Test1.vhd
-- Project Name:  Adder4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Adder4
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
 
ENTITY Adder4Test1 IS
END Adder4Test1;
 
ARCHITECTURE behavior OF Adder4Test1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder4
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Ci : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         Co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Ci : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal Co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant PERIOD: time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder4 PORT MAP (
          A => A,
          B => B,
          Ci => Ci,
          S => S,
          Co => Co
        );

     -- Stimulus process
   stim_proc: process
   begin		
      wait for PERIOD;
		A <= "0011";
		B <= "0010";
		Ci <= '0';
		
		wait for PERIOD;
		B <= "1110";
		
		wait;
   end process;

END;
