--------------------------------------------------------------------------------
-- Company: The Citadel
-- Engineer: Dr. Ron Hayne
--
-- Create Date:   10:37:40 07/24/2013
-- Design Name:   
-- Module Name:   C:/Hayne/ELEC418/Xilinx/mult4x4/mult4x4test.vhd
-- Project Name:  mult4x4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mult4X4
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
 
ENTITY mult4x4test IS
END mult4x4test;
 
ARCHITECTURE behavior OF mult4x4test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mult4X4
    PORT(
         Clk : IN  std_logic;
         St : IN  std_logic;
         Mplier : IN  std_logic_vector(3 downto 0);
         Mcand : IN  std_logic_vector(3 downto 0);
         Product : OUT  std_logic_vector(7 downto 0);
         Done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal St : std_logic := '0';
   signal Mplier : std_logic_vector(3 downto 0) := (others => '0');
   signal Mcand : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Product : std_logic_vector(7 downto 0);
   signal Done : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
	
	-- Test vector arrays
   constant N: integer := 3;
   type arr is array(1 to N) of std_logic_vector(3 downto 0);
   type arr2 is array(1 to N) of std_logic_vector(7 downto 0);
   constant Mcandarr: arr :=    (    "0110",     "0101",     "1101");
   constant Mplierarr: arr :=   (    "0100",     "0111",     "1011");
   constant Productarr: arr2 := ("00011000", "00100011", "10001111");

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mult4X4 PORT MAP (
          Clk => Clk,
          St => St,
          Mplier => Mplier,
          Mcand => Mcand,
          Product => Product,
          Done => Done
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
