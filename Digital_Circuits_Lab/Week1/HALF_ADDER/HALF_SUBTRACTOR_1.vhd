library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity HALF_SUBTRACTOR_1 is
	port (P,Q: in std_logic; BORROW,DIFFERENCE: out std_logic);
end entity HALF_SUBTRACTOR_1;

architecture Structure of HALF_SUBTRACTOR_1 is
	signal  P_BAR_Q,P_Q_BAR, P_NOR_Q, NOT_DIFFERENCE : std_logic;
	-- BORROW == P_BAR_Q
begin
	NOR1: NOR_2 port map (A => P, B => Q, Y=> P_NOR_Q);
	
	NOR2: NOR_2 port map (A => P, B => P_NOR_Q, Y=> BORROW);
	
	NOR3: NOR_2 port map (A => P, B => P_NOR_Q, Y=> P_BAR_Q);
	
	NOR4: NOR_2 port map (A => P_NOR_Q, B => Q, Y=> P_Q_BAR);
	
	NOR5: NOR_2 port map (A => P_BAR_Q, B => P_Q_BAR, Y=> NOT_DIFFERENCE);
	
	NOR6: NOR_2 port map (A => NOT_DIFFERENCE, B => NOT_DIFFERENCE, Y=> DIFFERENCE);
	
	end architecture;