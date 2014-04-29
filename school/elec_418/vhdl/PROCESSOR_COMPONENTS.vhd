-- Company: The Citadel
-- Engineer: Dr. Ron Hayne
-- Modification Date: 2/26/2014
-- Design Name: Processor_Components

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

package PROCESSOR_COMPONENTS is 
  
  component REG4 is
    port(CLK: in std_logic;
         REGS_Read1: in std_logic;
         REGS_Read2: in std_logic;
         REGS_Write: in std_logic;
         Addr1, Addr2: in std_logic_vector(1 downto 0);
         Data_In: in std_logic_vector(15 downto 0);
         Data_Out1, Data_Out2: out std_logic_vector(15 downto 0));
  end component;
  
  component MEM4K is
    port(CLK: in std_logic;
         MEM_Read: in std_logic;
         MEM_Write: in std_logic;
         Addr: in std_logic_vector(11 downto 0);
         Data_In: in std_logic_vector(15 downto 0);
         Data_Out: out std_logic_vector(15 downto 0));
  end component;
  
  component ALU16 is
    port(OP: in std_logic_vector(2 downto 0);
         A, B: in std_logic_vector(15 downto 0);
         R: out std_logic_vector(15 downto 0);
         N, Z: out std_logic);
  end component;
  
end package;

-------------------------------------------------------------------------------
-- 4x16 Register Array

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity REG4 is
  port(CLK: in std_logic;
       REGS_Read1: in std_logic;
       REGS_Read2: in std_logic;
       REGS_Write: in std_logic;
       Addr1, Addr2: in std_logic_vector(1 downto 0);
       Data_In: in std_logic_vector(15 downto 0);
       Data_Out1, Data_Out2: out std_logic_vector(15 downto 0));
end REG4;

architecture Behave of REG4 is
  type RAM4 is array (0 to 3) of std_logic_vector(15 downto 0);
  signal REG4: RAM4 := (others => X"0000");  -- set all reg bits to '0'
begin
  process(REGS_Read1, REGS_Read2, Addr1, Addr2) -- async read
  begin
    if REGS_Read1 = '1' then
      Data_Out1 <= REG4(conv_integer(Addr1));
    else
      Data_Out1 <= (others => 'Z');
    end if;
    if REGS_Read2 = '1' then
      Data_Out2 <= REG4(conv_integer(Addr2));
    else
      Data_Out2 <= (others => 'Z');
    end if;
  end process;
  process(CLK)
  begin
    if rising_edge(CLK) then -- sync write
      if REGS_Write = '1' then
        REG4(conv_integer(Addr2)) <= Data_In;
      end if;
    end if;
  end process;
end Behave;

-------------------------------------------------------------------------------
-- 4Kx16 Memory

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

entity MEM4K is
  port(CLK: in std_logic;
       MEM_Read: in std_logic;
       MEM_Write: in std_logic;
       Addr: in std_logic_vector(11 downto 0);
       Data_In: in std_logic_vector(15 downto 0);
       Data_Out: out std_logic_vector(15 downto 0));
end MEM4K;

architecture Behave of MEM4K is
  type RAM4K is array (0 to 4095) of std_logic_vector(15 downto 0);

  -- From Xilinx XST User Guide
  impure function InitRamFromFile(RamFileName: in string) return RAM4K is
    FILE RamFile: text is in RamFileName;
    variable RamFileLine: line;
    variable RAM: RAM4K;
    variable TempLine: bit_vector(15 downto 0);
  begin
    for I in RAM4K'range loop
      readline (RamFile, RamFileLine);
      exit when endfile (RamFile);
      read (RamFileLine, TempLine);
      RAM(I) := to_stdlogicvector(TempLine);
    end loop;
    return RAM;
  end function;

  signal MEM4K: RAM4K := InitRamFromFile("program.bin");

begin
  process(CLK)
  begin
    if falling_edge(CLK) then
      if MEM_Read = '1' then
        Data_Out <= MEM4K(conv_integer(Addr)); -- sync read
	   else
        Data_Out <= (others => 'Z');
      end if;
      if MEM_Write = '1' then
        MEM4K(conv_integer(Addr)) <= Data_In; --sync write
      end if;
    end if;
  end process;
end Behave;

------------------------------------------------------------------------------
-- 16-bit ALU

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ALU16 is
  port(OP: in std_logic_vector(2 downto 0);
       A, B: in std_logic_vector(15 downto 0);
       R: out std_logic_vector(15 downto 0);
       N, Z: out std_logic);
end ALU16;

architecture Behave of ALU16 is
  signal RESULT: std_logic_vector(15 downto 0);
begin
  process(OP, A, B)
  begin
    case OP is
      when "000" =>  -- Pass_A
        RESULT <= A;
      when "001" =>  -- ADD
        RESULT <= A + B;
      when "010" =>  -- INV
        RESULT <= not A;
      when "011" =>  -- AND
        RESULT <= A and B;
      when "100" =>  -- SHL
        RESULT <= A(14 downto 0) & '0';
      when "101" =>  -- ASHR
        RESULT <= A(15) & A(15 downto 1);
      when "110" =>
        RESULT <= (others => '0');
      when "111" =>  -- Pass_B
        RESULT <= B;
      when others =>
        RESULT <= (others => '0');
    end case;
  end process;
  R <= RESULT;
  N <= RESULT(15);
  Z <= not (RESULT(15) or RESULT(14) or RESULT(13) or RESULT(12) or RESULT(11) or RESULT(10)
         or RESULT(9) or RESULT(8) or RESULT(7) or RESULT(6) or RESULT(5) or RESULT(4)
         or RESULT(3) or RESULT(2) or RESULT(1) or RESULT(0));
end Behave;
    
