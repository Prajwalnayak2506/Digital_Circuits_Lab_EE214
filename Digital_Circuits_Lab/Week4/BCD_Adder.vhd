library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity BCD_Adder is
	port (A3, A2, A1, A0, B3, B2, B1, B0 : in std_logic; Y4, Y3, Y2, Y1, Y0: out std_logic);
end entity BCD_Adder;

architecture structure of BCD_Adder is
	component FOUR_BIT_ADDER_SUBTRACTOR is
		port (A0,A1, A2, A3, B0, B1, B2, B3, M: in std_logic; S0, S1, S2, S3, Cout : out std_logic);
	end component FOUR_BIT_ADDER_SUBTRACTOR;

	signal C, S3, S2, S1, S0,P, S3_AND_S2_OR_S1,S2_OR_S1,T  : std_logic;
begin
	FourBitAdder : FOUR_BIT_ADDER_SUBTRACTOR port map (A0 => A0 ,A1 => A1, A2 => A2, A3 => A3,
																		B0=>B0, B1=>B1, B2=>B2, B3=>B3,
																		M => '0',
																		S0 => S0, S1=>S1, S2=>S2, S3=> S3, Cout=>C);
	OR1 : OR_2 port map (A => S2, B=> S1,Y=> S2_OR_S1);
	AND1 : AND_2 port map (A=> S2_OR_S1, B=> S3, Y=> S3_AND_S2_OR_S1);
	OR2 : OR_2 port map (A => C, B=> S3_AND_S2_OR_S1, Y=> P);
	
	OR3: OR_2 port map (A => P, B=> '0', Y=> Y4);
	
	FourBitAdder2 : FOUR_BIT_ADDER_SUBTRACTOR port map (A0 => S0 ,A1 => S1, A2 => S2, A3 => S3,
																		B0=>'0', B1=>P, B2=>P, B3=>'0',
																		M => '0',
																		S0 => Y0, S1=>Y1, S2=>Y2, S3=> Y3, Cout=>T);
	
end architecture;