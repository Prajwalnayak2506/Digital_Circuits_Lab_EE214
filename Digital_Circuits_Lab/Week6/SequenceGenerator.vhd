
library ieee;
use ieee.std_logic_1164.all;
-- write the Flipflops packege declaration
library work;
use work.Flipflops.all;


entity Sequence_generator_stru_dataflow is
port (reset,clock: in std_logic;
y:out std_logic);
end entity Sequence_generator_stru_dataflow;
architecture struct of Sequence_generator_stru_dataflow is
signal D :std_logic_vector(2 downto 0);
signal Q :std_logic_vector(2 downto 0);

begin

	
	D(2) <= (Q(2) xor Q(1)) or (Q(1) and Q(0));
	D(1) <= (Q(0) and (Q(2) or (not Q(1))));
	D(0) <= (Q(1) nand Q(2));
	
	
	dff00 : dff_set port map (D=>D(0),clock => clock , set=> reset , Q=>Q(0));
	dff10 : dff_reset port map (D=>D(1),clock => clock , reset=> reset , Q=>Q(1));
	dff20 : dff_set port map (D=>D(2),clock => clock , set=> reset , Q=>Q(2));
	
	y <= Q(0);
-- write the equations in dataflow e.g z=a+bc written as z <= a or (b and c)
-- for DFF inputs which was derived and also for y.
-- Instantiate components dff_reset
-- and dff_set appropriately using port map statements.
end struct;

