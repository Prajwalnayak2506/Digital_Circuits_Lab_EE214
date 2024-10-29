library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity SIX_BIT_ADDER is
	port (A,B: in std_logic_vector(5 downto 0); S: out std_logic_vector(5 downto 0); Cout: out std_logic);
end entity SIX_BIT_ADDER;

architecture Structure of SIX_BIT_ADDER is
	signal C: std_logic_vector(5 downto 0);
	component FULL_ADDER is 
		port ( A , B, Cin: in std_logic; S , Cout: out std_logic);
	end component FULL_ADDER;
begin
	
	
	FULLADDER0: FULL_ADDER port map (A => A(0), B => B(0), Cin=> '0',S => S(0), Cout=> C(1));
	
	GNN_A: for i in 1 to 4 generate
	
	FULLADDER_K: FULL_ADDER port map (A => A(i), B => B(i), Cin=> C(i),S => S(i), Cout=> C(i+1));
	
	end generate;
	
	FULLADDER5: FULL_ADDER port map (A => A(5), B => B(5), Cin=> C(5),S => S(5), Cout=> Cout);
	
	
end architecture;