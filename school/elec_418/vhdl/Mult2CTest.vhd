--------------------------------------------------------------------------------
-- Company: The Citadel
-- Engineer: Dr. Ron Hayne
--
-- Create Date:   11:32:28 07/24/2013
-- Design Name:   
-- Module Name:   C:/Hayne/ELEC418/Xilinx/mult2C/mult2C_test.vhd
-- Project Name:  mult2C
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mult2C
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
 
ENTITY mult2C_test IS
END mult2C_test;
 
ARCHITECTURE behavior OF mult2C_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mult2C
    PORT(
         CLK : IN  std_logic;
         St : IN  std_logic;
         Mplier : IN  std_logic_vector(3 downto 0);
         Mcand : IN  std_logic_vector(3 downto 0);
         Product : OUT  std_logic_vector(6 downto 0);
         Done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal St : std_logic := '0';
   signal Mplier : std_logic_vector(3 downto 0) := (others => '0');
   signal Mcand : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Product : std_logic_vector(6 downto 0);
   signal Done : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
	
	--Test vector arrays
	constant N: integer := 5;
   type arr is array(1 to N) of std_logic_vector(3 downto 0);
   type arr2 is array(1 to N) of std_logic_vector(6 downto 0);
   constant Mcandarr: arr :=  (     "0100",    "1100",    "1100",    "0010",    "0010");
   constant Mplierarr: arr := (     "0110",    "0110",    "1010",    "0101",    "1011");
   constant Productarr: arr2 := ("0011000", "1101000", "0011000", "0001010", "1110110");
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mult2C PORT MAP (
          CLK => CLK,
          St => St,
          Mplier => Mplier,
          Mcand => Mcand,
          Product => Product,
          Done => Done
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
     for i in 1 to N loop
       Mcand <= Mcandarr(i);
       Mplier <= Mplierarr(i);
       St <= '1';
       wait for CLK_period;
       St <= '0';
       wait for CLK_period;
       wait until falling_edge(Done);
       assert Product = Productarr(i)	-- compare with expected answer
         report "Incorrect Product"
         severity error;  
       wait for CLK_period;
     end loop;
     report "TEST COMPLETED";
   end process;

END;
