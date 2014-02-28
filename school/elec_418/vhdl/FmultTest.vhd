--------------------------------------------------------------------------------
-- Company: The Citadel
-- Engineer: Dr. Ron Hayne
--
-- Create Date:   14:30:45 07/24/2013
-- Design Name:   
-- Module Name:   C:/Hayne/ELEC418/Xilinx/fmul2/fmultest.vhd
-- Project Name:  fmul
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FMUL
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
 
ENTITY FmulTest IS
END FmulTest;
 
ARCHITECTURE behavior OF FmulTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FMUL
    PORT(
         CLK : IN  std_logic;
         St : IN  std_logic;
         F1 : IN  std_logic_vector(3 downto 0);
         E1 : IN  std_logic_vector(3 downto 0);
         F2 : IN  std_logic_vector(3 downto 0);
         E2 : IN  std_logic_vector(3 downto 0);
         F : OUT  std_logic_vector(6 downto 0);
         E : OUT  std_logic_vector(4 downto 0);
         V : OUT  std_logic;
         done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal St : std_logic := '0';
   signal F1 : std_logic_vector(3 downto 0) := (others => '0');
   signal E1 : std_logic_vector(3 downto 0) := (others => '0');
   signal F2 : std_logic_vector(3 downto 0) := (others => '0');
   signal E2 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal F : std_logic_vector(6 downto 0);
   signal E : std_logic_vector(4 downto 0);
   signal V : std_logic;
   signal done : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
	
	--Test vector arrays
	constant N: integer := 5;
   type arr is array(1 to N) of std_logic_vector(3 downto 0);
   type arr2 is array(1 to N) of std_logic_vector(6 downto 0);
   type arr3 is array(1 to N) of std_logic_vector(4 downto 0);
   constant F1arr: arr := ("0101", "1010", "1000", "0101", "0110");
   constant E1arr: arr := ("0010", "1011", "0000", "0010", "0111");
   constant F2arr: arr := ("1001", "1100", "1000", "0000", "1001");
   constant E2arr: arr := ("0011", "0100", "0000", "1000", "0011");
   constant Farr: arr2 := ("1011101", "0110000", "0100000", "0000000", "1010110");
   constant Earr: arr3 := ("00101", "11110", "00001", "11000", "01010");
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FMUL PORT MAP (
          CLK => CLK,
          St => St,
          F1 => F1,
          E1 => E1,
          F2 => F2,
          E2 => E2,
          F => F,
          E => E,
          V => V,
          done => done
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
      F1 <= F1arr(i);
      E1 <= E1arr(i);
      F2 <= F2arr(i);
      E2 <= E2arr(i);
      St <= '1';
      wait until CLK = '1' and CLK'event;
      St <= '0';
      wait until Done = '1' and Done'event;
      assert (F = Farr(i) and E = Earr(i))	-- compare with expected answer
        report "Incorrect Product"
        severity error;
      wait until Done = '0' and Done'event;  
    end loop;
    report "TEST COMPLETED";
   end process;

END;
