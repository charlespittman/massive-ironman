-------------------------------------------------------------------------------
-- Title      : 2-bit counter
-------------------------------------------------------------------------------
-- File       : proj4/circuit.vhd
-- Author     : Charles Pittman  <cpittman@shellwing-239>
-------------------------------------------------------------------------------
-- Description: Synchronous sequential circuit (2-bit binary counter)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library UNISIM;
use UNISIM.VComponents.all;

entity counter is
  port (EL  : in  std_logic;
        UP  : in  std_logic;
        CLK : in  std_logic;
        CLR : in  std_logic;
        Z   : out std_logic_vector (1 downto 0));
end counter;

architecture Behavioral of circuit is

begin

end Behavioral;
