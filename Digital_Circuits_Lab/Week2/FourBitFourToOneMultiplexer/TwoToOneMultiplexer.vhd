library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity TwoToOneMultiplexer is
	port (I1,I0, S: in std_logic; Y: out std_logic);
end entity TwoToOneMultiplexer;

architecture Structure of TwoToOneMultiplexer is

	signal I1_AND_S, I2_AND_S_BAR, S_BAR: std_logic;

begin
	NOT1: INVERTER port map(A=> S, Y=> S_BAR);
	
	AND1: AND_2 port map (A=> I1, B=> S, Y=> I1_AND_S);
	
	AND2: AND_2 port map (A=> I0, B=> S_BAR, Y=> I2_AND_S_BAR);
	
	OR1: OR_2 port map (A=> I1_AND_S, B=> I2_AND_S_BAR, Y=> Y);

end Structure;