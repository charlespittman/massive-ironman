library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

package PROCESSOR3_COMPONENTS is 
  
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
         Data_Out: out std_logic_vector(15 downto 0);
         SWITCH: in std_logic_vector(7 downto 0); -- Microcontroller ports
         LED: out std_logic_vector(7 downto 0);
         ANODE: out std_logic_vector(3 downto 0);
         CATHODE: out std_logic_vector(7 downto 0));
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
    if CLK = '1' and CLK'event then -- sync write
      if REGS_Write = '1' then
        REG4(conv_integer(Addr2)) <= Data_In;
      end if;
    end if;
  end process;
end Behave;

-------------------------------------------------------------------------------
-- 4Kx16 Memory
-- Expanded I/O

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
       Data_Out: out std_logic_vector(15 downto 0);
       SWITCH: in std_logic_vector(7 downto 0); -- Microcontroller ports
       LED: out std_logic_vector(7 downto 0);
       ANODE: out std_logic_vector(3 downto 0);
       CATHODE: out std_logic_vector(7 downto 0));
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
  signal Buff_Out: std_logic_vector(15 downto 0) := X"0000";

begin
  process(CLK)
  begin
    if CLK = '0' and CLK'event then -- falling edge
      if MEM_Read = '1' then
        Buff_Out <= MEM4K(conv_integer(Addr)); -- sync read
	   else
        Buff_Out <= (others => 'Z');
      end if;
      if MEM_Write = '1' then
        MEM4K(conv_integer(Addr)) <= Data_In; --sync write
      end if;
      if MEM_Write = '1' then -- Memory Mapped Output Ports
        if Addr = X"01" then -- LED
          LED <= Data_In(7 downto 0);
        elsif Addr = X"02" then -- ANODE
          ANODE <= Data_In(3 downto 0);
        elsif Addr = X"03" then -- CATHODE
          CATHODE <= Data_In(7 downto 0);
        end if;
      end if;
    end if;
  end process;
  -- Memory Mapped Input Ports
  Data_Out <= (X"00" & SWITCH) when (Addr = X"00" and MEM_Read = '1') else -- SWITCH
               Buff_Out; -- RAM
 
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
      when "000" =>  
        RESULT <= A;
      when "001" =>
        RESULT <= A + B;
      when "010" =>
        RESULT <= not A;
      when "011" =>
        RESULT <= A and B;
      when "100" =>
        RESULT <= A(14 downto 0) & A(15);
      when "101" =>
        RESULT <= (others => '0');
      when "110" =>
        RESULT <= (others => '0');
      when "111" =>
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
    
