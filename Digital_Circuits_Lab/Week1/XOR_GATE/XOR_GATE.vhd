library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity XOR_GATE is
	port (P,Q: in std_logic; OUTPUT: out std_logic);
end entity XOR_GATE;

architecture Structure of XOR_GATE is
	signal P_BAR, Q_BAR, P_AND_Q, P_XOR_Q : std_logic;
begin
	NOR1: NOR_2 port map (A => P, B => P, Y=> P_BAR);
	
	NOR2: NOR_2 port map (A => Q, B => Q, Y=> Q_BAR);
	
	
	NOR3: NOR_2 port map (A => P_BAR, B => Q_BAR, Y=> P_AND_Q);
	
	NOR4: NOR_2 port map (A => P, B => Q, Y=> P_XOR_Q);
	
	NOR5: NOR_2 port map (A => P_AND_Q, B => P_XOR_Q, Y=> OUTPUT);
	
	
end architecture;