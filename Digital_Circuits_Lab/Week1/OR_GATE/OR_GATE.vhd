library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity OR_GATE is
	port (P,Q: in std_logic; OUTPUT: out std_logic);
end entity OR_GATE;

architecture Structure of OR_GATE is
	signal P_NOR_Q : std_logic;
begin
	NOR1: NOR_2 port map (A => P, B => Q, Y=> P_NOR_Q);

	NOR2: NOR_2 port map (A => P_NOR_Q, B => P_NOR_Q, Y=> OUTPUT);
	
	
end architecture;