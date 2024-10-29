library ieee;
use ieee.std_logic_1164.all;
package FULL_ADDER is
  component FULLADDER is
	port ( A , B, Cin: in std_logic; S , Cout: out std_logic);
  end component FULLADDER;
end package FULL_ADDER;


library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity FULLADDER is 
	port ( A , B, Cin: in std_logic; S , Cout: out std_logic);
end entity FULLADDER;

architecture Struct of FULLADDER is
	signal A_XOR_B, A_OR_B, Cin_AND_AORB, A_B: std_logic;
begin
	
	-- Sum = Cin xor (A xor B)
	XOR1: XOR_2 port map ( A=> A, B=> B, Y=> A_XOR_B);
	
	XOR2: XOR_2 port map (A=> A_XOR_B, B => Cin, Y=> S);
	
	--Cout = Cin.A +A.B + B.Cin
	
	OR1: OR_2 port map (A=> A, B=> B, Y=> A_OR_B);
	
	AND1: AND_2 port map (A => Cin, B=> A_OR_B, Y => Cin_AND_AORB);

	AND2: AND_2 port map (A => B, B=> A, Y => A_B);
	
	OR2: OR_2 port map (A=> A_B, B=> Cin_AND_AORB, Y=> Cout);

end architecture;