library ieee;
use ieee.std_logic_1164.all;

library work;
use work.gates.all;

entity Fibonacci_Detector is
	port (x0, x1, x2, x3, x4: in std_logic; y: out std_logic);
end Fibonacci_Detector;

architecture structure of Fibonacci_Detector is
	signal x1b, x4_nor_x2, x1_or_x0, x3_nor_x1_or_x0, x4_nor_x3, x2_and_x0, x1b_and_x2_and_x0, t1, t2  : std_logic;
	-- x4b, x2b, x3b,  x0b
begin
	--NOT0: INVERTER port map (A=>x0, Y=> x0b);
	NOT1: INVERTER port map (A=>x1, Y=> x1b);
--	NOT2: INVERTER port map (A=>x2, Y=> x2b);
	--NOT3: INVERTER port map (A=>x3, Y=> x3b);
	--NOT4: INVERTER port map (A=>x4, Y=> x4b);

	NOR1: NOR_2 port map (A=>x4, B=> x2, Y=> x4_nor_x2);
	OR1: OR_2 port map ( A=> x1, B=> x0, Y=> x1_or_x0);
	NAND1: NAND_2 port map ( A=> x3, B=> x1_or_x0, Y=> x3_nor_x1_or_x0);
	AND1: AND_2 port map(A=> x3_nor_x1_or_x0, B=> x4_nor_x2, Y=> t1);
	
	NAND2: NAND_2 port map(A=>x4, B=> x3, Y=> x4_nor_x3);
	AND2: AND_2 port map(A=>x2, B=> x0, Y=> x2_and_x0);
	AND3: AND_2 port map(A=>x2_and_x0, B=> x1b, Y=> x1b_and_x2_and_x0);
	AND4: AND_2 port map(A=>x1b_and_x2_and_x0, B=> x4_nor_x3, Y=> t2);
	
	OR2: OR_2 port map (A=> t1, B=> t2, Y=>y);

end structure;

	