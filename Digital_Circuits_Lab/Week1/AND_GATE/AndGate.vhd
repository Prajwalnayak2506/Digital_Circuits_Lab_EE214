library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity AndGate is
	port (P,Q: in std_logic; OUTPUT: out std_logic);
end entity AndGate;

architecture Structure of AndGate is
	signal P_BAR, Q_BAR : std_logic;
begin
	NOR1: NOR_2 port map (A => P, B => P, Y=> P_BAR);
	NOR2: NOR_2 port map (A => Q, B => Q, Y=> Q_BAR);
	
	NOR3: NOR_2 port map (A => P_BAR, B => Q_BAR, Y=> OUTPUT);
end architecture;