-- Company: The Citadel
-- Engineer: Dr. Ron Hayne
-- Modification Date: 2/26/2014
-- Design Name: Processor

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.PROCESSOR_COMPONENTS.all;

entity PROCESSOR is
  port(CLK, RESET: in std_logic);
end PROCESSOR;

architecture Behave of PROCESSOR is

-- Data Path
  signal PC          : std_logic_vector(11 downto 0) := X"080";
  signal Load_PC     : std_logic := '0';
  signal Inc_PC      : std_logic := '0';
  signal IR          : std_logic_vector(15 downto 0) := X"0000";
  signal Load_IR     : std_logic := '0';

  signal REGS_Read1  : std_logic := '0';
  signal REGS_Read2  : std_logic := '0';
  signal REGS_Write  : std_logic := '0';
  
  signal ALU_A       : std_logic_vector(15 downto 0) := X"0000";
  signal ALU_B       : std_logic_vector(15 downto 0) := X"0000";
  signal Extend      : std_logic := '0';
  signal Address     : std_logic := '0';
  signal Sign        : std_logic := '0';
  signal Sign_Extend : std_logic_vector(15 downto 5) := "00000000000";
  signal Extend_0    : std_logic_vector(15 downto 5) := "00000000000";
  signal Extend_1    : std_logic_vector(15 downto 5) := "11111111111";    
  signal VV          : std_logic_vector(15 downto 5) := "00000000000"; 
  signal ALU_Op      : std_logic_vector(2 downto 0) := "000";
  constant Pass_A    : std_logic_vector(2 downto 0) := "000";
  constant Pass_B    : std_logic_vector(2 downto 0) := "111";
  signal N, Z        : std_logic := '0';
  signal STATUS      : std_logic_vector(1 downto 0) := "00";
  signal Load_STATUS : std_logic := '0';

  signal MDR         : std_logic_vector(15 downto 0) := X"0000";
  signal Load_MDR    : std_logic := '0';  
  signal MAR         : std_logic_vector(11 downto 0) := X"000";  
  signal Load_MAR    : std_logic := '0';

  signal MEM_Read    : std_logic := '0';
  signal MEM_Write   : std_logic := '0';
  signal MEM_Out     : std_logic_vector(15 downto 0) := X"0000";
  
  signal BUS_A       : std_logic_vector(15 downto 0) := (others => 'Z');
  signal BUS_B       : std_logic_vector(15 downto 0) := (others => 'Z');
  signal BUS_C       : std_logic_vector(15 downto 0) := (others => 'Z');
  
-- Control Unit
  signal Clear       : std_logic := '0';
  signal STEP        : std_logic_vector(2 downto 0) := "000";
  constant T0        : std_logic_vector(2 downto 0) := "000"; -- Time Steps
  constant T1        : std_logic_vector(2 downto 0) := "001";
  constant T2        : std_logic_vector(2 downto 0) := "010";
  constant T3        : std_logic_vector(2 downto 0) := "011";
  constant T4        : std_logic_vector(2 downto 0) := "100";
  constant T5        : std_logic_vector(2 downto 0) := "101";
  constant T6        : std_logic_vector(2 downto 0) := "110";
  constant T7        : std_logic_vector(2 downto 0) := "111";
  constant MOVE      : std_logic_vector(2 downto 0) := "000"; -- OPCODES
  constant ADD       : std_logic_vector(2 downto 0) := "001";
  constant INV       : std_logic_vector(2 downto 0) := "010"; 
  constant AND2      : std_logic_vector(2 downto 0) := "011";
  constant SHL       : std_logic_vector(2 downto 0) := "100";
  constant ASHR      : std_logic_vector(2 downto 0) := "101";
  constant BRANCH    : std_logic_vector(2 downto 0) := "111"; 
  constant M0        : std_logic_vector(1 downto 0) := "00";  -- Modes
  constant M1        : std_logic_vector(1 downto 0) := "01";
  constant M2        : std_logic_vector(1 downto 0) := "10";
  constant M3        : std_logic_vector(1 downto 0) := "11";
  constant BRA       : std_logic_vector(2 downto 0) := "000"; -- Branch Instructions
  constant BZ        : std_logic_vector(2 downto 0) := "001";
  constant BNZ       : std_logic_vector(2 downto 0) := "010";
  constant BN        : std_logic_vector(2 downto 0) := "011";
  constant BNN       : std_logic_vector(2 downto 0) := "100";
  constant BSR       : std_logic_vector(2 downto 0) := "110";
  constant RTN       : std_logic_vector(2 downto 0) := "111";

  -- Instruction Fields
  alias OP       : std_logic_vector(2 downto 0) is IR(15 downto 13);
  alias SRC_MODE : std_logic_vector(1 downto 0) is IR(12 downto 11);
  alias SRC_REG  : std_logic_vector(1 downto 0) is IR(10 downto 9);
  alias DST_MODE : std_logic_vector(1 downto 0) is IR(8 downto 7); 
  alias DST_REG  : std_logic_vector(1 downto 0) is IR(6 downto 5); 
  alias BR_MODE  : std_logic_vector(2 downto 0) is IR(12 downto 10);
  alias IMM_SIGN : std_logic is IR(10);
  alias BR_SIGN  : std_logic is IR(9);
  alias N_FLAG   : std_logic is STATUS(1);
  alias Z_FLAG   : std_logic is STATUS(0);

begin
  
-- Data Path
REGS : REG4 port map (CLK, REGS_Read1, REGS_Read2, REGS_Write, SRC_REG, DST_REG, BUS_C, BUS_A, BUS_B);

ALU  : ALU16 port map (ALU_OP, ALU_A, ALU_B, BUS_C, N, Z);
Extend_0 <= "000000" & BUS_A(9 downto 5) when OP = Branch else "000000000" & BUS_A(10 downto 9);
Extend_1 <= "111111" & BUS_A(9 downto 5) when OP = Branch else "111111111" & BUS_A(10 downto 9);
Sign <= BR_SIGN when OP = Branch else IMM_SIGN;
Sign_Extend <=  Extend_0 when Sign = '0' else Extend_1;
ALU_A(15 downto 5) <= BUS_A(15 downto 5) when Extend = '0' else Sign_Extend;
ALU_A(4 downto 0) <= BUS_A(4 downto 0);
VV <= "000000000" & BUS_B(10 downto 9) when SRC_MODE = M2 else 
      "000000000" & BUS_B(6 downto 5) when DST_MODE = M2 else "00000000000";
ALU_B(15 downto 5) <= BUS_B(15 downto 5) when Address = '0' else VV;
ALU_B(4 downto 0) <= BUS_B(4 downto 0);

MEM  : MEM4K port map (CLK, MEM_Read, MEM_Write, MAR, MDR, MEM_Out);

-- Control Unit
Control : process(STEP, IR, STATUS)
begin 
  Clear <= '0'; Load_PC <= '0'; Inc_PC <= '0'; Load_IR <= '0'; 
  REGS_Read1 <= '0'; REGS_Read2 <= '0'; REGS_Write <= '0';
  ALU_OP <= "000"; Extend <= '0'; Address <= '0'; Load_STATUS <= '0';
  Load_MDR <= '0'; Load_MAR <= '0'; MEM_Read <= '0'; MEM_Write <= '0';
  BUS_A <= (others => 'Z'); BUS_B <= (others => 'Z');
  case STEP is
    when T0 =>
      BUS_B <= "0000" & PC;
      ALU_OP <= Pass_B;
      Load_MAR <= '1';
      Inc_PC <= '1';
    when T1 =>
      MEM_Read <= '1';
      Load_MDR <= '1';
    when T2 =>
      BUS_B <= MDR;
      ALU_OP <= Pass_B;
      Load_IR <= '1';
    when others =>
      null;
  end case;
  case OP is  -- Execute
    when MOVE =>
      case SRC_MODE is
        when M0 =>  -- Register Direct
          case DST_MODE is
            when M0 =>  -- MOVE Rs,Rd
              case STEP is
                when T3 =>
                  REGS_Read1 <= '1';
                  ALU_OP <= Pass_A;
                  Load_STATUS <= '1';
                  REGS_Write <= '1';
                  Clear <= '1';
                when others =>
                  null;
              end case;
            when M1 =>  -- MOVE Rs,(Rd)
              null;
            when M2 =>  -- MOVE Rs,Addr
              case STEP is
                when T3 =>
                  REGS_Read1 <= '1';
                  ALU_OP <= Pass_A;
                  Load_STATUS <= '1';
                  Load_MDR <= '1';
                when T4 =>
                  BUS_B <= IR;
                  Address <= '1';
                  ALU_OP <= Pass_B;
                  Load_MAR <= '1';
                when T5 =>
                  MEM_Write <= '1';
                  Clear <= '1';
                when others =>
                  null;
              end case;
            when others =>
              null;
          end case;
        when M1 =>  -- Register Indirect
          case DST_MODE is
            when M0 =>  -- MOVE (Rs),Rd
              null;
            when M2 =>  -- MOVE (Rs),Addr
              null;
            when others =>
              null;
          end case;
        when M2 =>  -- Absolute
          case DST_MODE is
            when M0 =>  -- MOVE Addr,Rd
              case STEP is
                when T3 =>
                  BUS_B <= IR;
                  Address <= '1';
                  ALU_OP <= Pass_B;
                  Load_MAR <= '1';
                when T4 =>
                  MEM_Read <= '1';
                  Load_MDR <= '1';
                when T5 =>
                  BUS_B <= MDR;
                  ALU_OP <= Pass_B;
                  Load_STATUS <= '1';
                  REGS_Write <= '1';
                  Clear <= '1';
                when others =>
                  null;
              end case;
            when M1 =>  -- MOVE Addr,(Rd)
              null;
            when M2 =>  -- MOVE Addr,Addr
              null;
            when others =>
              null;
          end case;
        when M3 =>  -- Immediate
          case DST_MODE is
            when M0 =>  -- MOVE #Value,Rd
              case STEP is
                when T3 =>
                  BUS_A <= IR;
                  Extend <= '1';
                  ALU_OP <= Pass_A;
                  Load_STATUS <= '1';
                  REGS_Write <= '1';
                  Clear <= '1';
                when others =>
                  null;
              end case;
            when M1 =>  -- MOVE #Value,(Rd)
              null;
            when M2 =>  -- MOVE #Value,Addr
              null;
            when others =>
              null;
          end case;
        when others =>
          null;
      end case;
    when ADD =>
      case SRC_MODE is
        when M0 =>  -- Register Direct
          case DST_MODE is
            when M0 =>  -- ADD Rs,Rd
              null;
            when M1 =>  -- ADD Rs,(Rd)
              null;
            when M2 =>  -- ADD Rs,Addr
              null;
            when others =>
              null;
          end case;
        when M1 =>  -- Register Indirect
          case DST_MODE is
            when M0 =>  -- ADD (Rs),Rd
              case STEP is
                when T3 =>
                  REGS_Read1 <= '1';
                  ALU_OP <= Pass_A;
                  Load_MAR <= '1';
                when T4 =>
                  MEM_Read <= '1';
                  Load_MDR <= '1';
                when T5 =>
                  BUS_A <= MDR;
                  REGS_Read2 <= '1';
                  ALU_OP <= OP;
                  Load_STATUS <= '1';
                  REGS_Write <= '1';
                  Clear <= '1';
                when others =>
                  null;
              end case;
            when M1 =>  -- ADD (Rs),(Rd)
              null;
            when M2 =>  -- ADD (Rs),Addr
              null;
            when others =>
              null;
          end case;
        when M2 =>  -- Absolute
          case DST_MODE is
            when M0 =>  -- ADD Addr,Rd
              null;
            when M1 =>  -- ADD Addr,(Rd)
              null;
            when M2 =>  -- ADD Addr,Addr
              null;
            when others =>
              null;
          end case;
        when M3 =>  -- Immediate
          case DST_MODE is
            when M0 =>  -- ADD #Value,Rd
              case STEP is
                when T3 =>
                  BUS_A <= IR;
                  Extend <= '1';
                  REGS_Read2 <= '1';
                  ALU_OP <= OP;
                  Load_STATUS <= '1';
                  REGS_Write <= '1';
                  Clear <= '1';
                when others =>
                  null;
              end case;
            when M1 =>  -- ADD #Value,(Rd)
              null;
            when M2 =>  -- ADD #Value,Addr
              null;
            when others =>
              null;
          end case;
        when others =>
          null;
      end case;
    when BRANCH => 
      case BR_MODE is
        when BRA => 
          case STEP is
            when T3 =>
              BUS_A <= IR;
              BUS_B <= "0000" & PC;
              Extend <= '1';
              ALU_OP <= ADD;
              Load_PC <= '1';
              Clear <= '1';
            when others =>
              null;
          end case;
        when BNZ => 
          case STEP is
            when T3 =>
              if Z_FLAG = '0' then
                BUS_A <= IR;
                BUS_B <= "0000" & PC;
                Extend <= '1';
                ALU_OP <= ADD;
                Load_PC <= '1';
              end if;
              Clear <= '1';
            when others =>
              null;
          end case;
        when others =>
          null;
      end case;
    when others =>
      null;
  end case;
  
end process;
        
        
-- Data Path
Data_Path : process (CLK)
begin
  if rising_edge(CLK) then
    if RESET = '1' then
      PC <= X"080";  -- New PC
    elsif Load_PC = '1' then
      PC <= BUS_C(11 downto 0);
    elsif Inc_PC = '1' then
      PC <= PC + 1;
    end if;
    if Load_IR = '1' then
      IR <= BUS_C;
    end if;
    if Load_STATUS = '1' then
      STATUS <= N & Z;
    end if;
    if Load_MDR = '1' then
      if MEM_Read = '1' then
        MDR <= MEM_Out;
      else
        MDR <= BUS_C;
      end if;
    end if;
    if Load_MAR = '1' then
      MAR <= BUS_C(11 downto 0);
    end if;
  end if;
end process;

-- Step Counter
Step_Counter : process (CLK)
begin
  if rising_edge(CLK) then
    if RESET = '1' then
      STEP <= "000"; 
    elsif Clear = '1' then
      STEP <= "000";
    else
      STEP <= STEP + 1;
    end if;
  end if;
end process;

end Behave;
                      
