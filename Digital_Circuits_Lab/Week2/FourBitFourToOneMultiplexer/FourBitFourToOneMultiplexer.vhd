library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity FourBitFourToOneMultiplexer is
	port (d3,d2,d1,d0, c3,c2,c1,c0, b3,b2,b1,b0, a3,a2,a1,a0, Sel1, Sel0: in std_logic; Y3, Y2, Y1, Y0: out std_logic);
end entity FourBitFourToOneMultiplexer;

architecture Structure of FourBitFourToOneMultiplexer is


component FourToOneMultiplexer is
	port (I4,I3,I2,I1,S2, S1: in std_logic; Y: out std_logic);
end component FourToOneMultiplexer;

	
begin
	
	FourToOneMultiplexer_1: FourToOneMultiplexer port map (I4 => d3 ,I3=> c3,I2=> b3 ,I1=> a3,S2=> Sel1, S1=> Sel0, Y=> Y3);
	
	FourToOneMultiplexer_2: FourToOneMultiplexer port map (I4 => d2 ,I3=> c2,I2=> b2 ,I1=> a2,S2=> Sel1, S1=> Sel0, Y=> Y2);

	FourToOneMultiplexer_3: FourToOneMultiplexer port map (I4 => d1 ,I3=> c1,I2=> b1 ,I1=> a1,S2=> Sel1, S1=> Sel0, Y=> Y1);

	FourToOneMultiplexer_4: FourToOneMultiplexer port map (I4 => d0 ,I3=> c0,I2=> b0 ,I1=> a0,S2=> Sel1, S1=> Sel0, Y=> Y0);

end Structure;