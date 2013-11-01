----------------------------------------------------------------------------------
-- Author : Charles Pittman
-- Course : ELEC-311
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.project3_gates.all;

-- This sums two 4-bit two's-complement numbers.  A SEL line is used to
-- subtract the second number instead.  The output is a 4-bit two's complement
-- number and indicators for a carry-out and overflows.
entity circuit is
  port (X    : in  std_logic_vector(3 downto 0);
        Y    : in  std_logic_vector(3 downto 0);
        Z    : out std_logic_vector(3 downto 0);
        SEL  : in  std_logic;
        Cout : out std_logic;
        OVR  : out std_logic);
end circuit;

architecture Structural of circuit is

  signal C : std_logic_vector(3 downto 0);  -- Carries
  signal S : std_logic_vector(3 downto 0);  -- Sums

begin

  -- If SEL is active, give 1's complement.
  -- ExclusiveOR port map(A, B, F)
  y3 : ExclusiveOR port map(SEL, Y(3), S(3));
  y2 : ExclusiveOR port map(SEL, Y(2), S(2));
  y1 : ExclusiveOR port map(SEL, Y(1), S(1));
  y0 : ExclusiveOR port map(SEL, Y(0), S(0));

  -- Add X, Y.  Note Cin of fa0 is SEL.  If active, finishes inverting Y from above.
  -- FullAdder port map(A, B, Cin, Cout, Sum)
  fa3 : FullAdder port map(X(3), S(3), C(2), C(3), Z(3));
  fa2 : FullAdder port map(X(2), S(2), C(1), C(2), Z(2));
  fa1 : FullAdder port map(X(1), S(1), C(0), C(1), Z(1));
  fa0 : FullAdder port map(X(0), S(0), SEL, C(0), Z(0));

  -- Cout is used to determine if overflow occurs, so a signal must be used in
  -- the architecture.
  Cout <= C(3);

  -- Overflow occurs when Cin != Cout in the last adder.
  -- (x != y) -> (xy + x'y')' -> (x+y)(x' + y') -> (x xor y)
  ovf : ExclusiveOR port map(C(2), C(3), OVR);

end Structural;
