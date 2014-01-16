library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder_behave16 is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           Ci : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           Co : out  STD_LOGIC);
end Adder_behave16;

architecture Behave of Adder_behave16 is
signal sum17: std_logic_vector(16 downto 0);
begin
sum17 <= ('0' & A) + ('0' & B) + (X"0000" & Ci);
S <= sum17(15 downto 0);
Co <= sum17(16);

end Behave;

