library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity FourToOneMultiplexer is
	port (I4,I3,I2,I1,S2, S1: in std_logic; Y: out std_logic);
end entity FourToOneMultiplexer;

architecture Structure of FourToOneMultiplexer is

	

	component TwoToOneMultiplexer is
	port (I1,I0, S: in std_logic; Y: out std_logic);
	end component TwoToOneMultiplexer;

	signal O1, O2: std_logic;
	
begin
	
	mux2x1_1: TwoToOneMultiplexer port map (I1=> I4, I0=> I3, S=> S1, Y=> O1);
	
	mux2x1_2: TwoToOneMultiplexer port map (I1=> I2, I0=> I1, S=>S1, Y=> O2);
	
	mux2x1_3: TwoToOneMultiplexer port map (I1=> O1, I0=> O2, S=> S2, Y=> Y);
	
	
end Structure;