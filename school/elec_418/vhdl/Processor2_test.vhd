--------------------------------------------------------------------------------
-- Company: The Citadel
-- Engineer: Dr. Ron Hayne
--
-- Create Date:   16:05:28 07/24/2013
-- Design Name:   
-- Module Name:   C:/Hayne/ELEC418/Xilinx/Processor2/Processor2_test.vhd
-- Project Name:  Processor2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PROCESSOR2
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
 
ENTITY Processor2_test IS
END Processor2_test;
 
ARCHITECTURE behavior OF Processor2_test IS 
 
  -- Component Declaration for the Unit Under Test (UUT)
 
  COMPONENT PROCESSOR2
  PORT(
       CLK : IN  std_logic;
       RESET : IN  std_logic
      );
  END COMPONENT;
    

  --Inputs
  signal CLK : std_logic := '0';
  signal RESET : std_logic := '0';

  -- Clock period definitions
  constant CLK_period : time := 20 ns;
 
BEGIN
 
  -- Instantiate the Unit Under Test (UUT)
  uut: PROCESSOR2 PORT MAP (
         CLK => CLK,
         RESET => RESET
        );

  -- Clock process definitions
  CLK_process :process
  begin
    CLK <= '0';
    wait for CLK_period/2;
    CLK <= '1';
    wait for CLK_period/2;
  end process;
 

  -- Stimulus process
  stim_proc: process
  begin		
    RESET <= '1';
    wait for CLK_period*1.25;	
    RESET <= '0';
    wait for CLK_period*80;
    wait;
  end process;

END;
