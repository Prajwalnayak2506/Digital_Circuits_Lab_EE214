library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Register6bit is
	port(Clk, Reset : in std_logic;
	data_in : in std_logic_vector(5 downto 0);
	data_out : out std_logic_vector(5 downto 0));
end entity;

architecture BHV_R of Register6bit is

	component DFF_JK is
		port( D, clock, enable, preset, reset : in std_logic; Q,QBAR : out std_logic);
	end component DFF_JK;
	
	signal D_OUT_BAR,temp : std_logic_vector(5 downto 0);
begin
	
	GNN: for i in 0 to 5 generate
	
		DFF_R: DFF_JK port map (D=>data_in(i), clock=> clk, enable=>'1', preset=>'0', reset=> '0', Q=> temp(i),QBAR=>D_OUT_BAR(i));
		
		NOR_1 : NOR_2 port map (Reset, temp(i), data_out(i));
		
	
	end generate;
	

end BHV_R;