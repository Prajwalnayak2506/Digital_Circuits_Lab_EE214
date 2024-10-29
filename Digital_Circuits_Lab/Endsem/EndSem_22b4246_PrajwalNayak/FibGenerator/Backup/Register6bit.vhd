library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity Register6bit is
	port(Clk, ResetA,ResetB : in std_logic;
	data_in : in std_logic_vector(5 downto 0);
	data_out : out std_logic_vector(5 downto 0));
end entity;

architecture BHV_R of Register6bit is

	component DFF_JK is
		port( D, clock, enable, preset, reset : in std_logic; Q,QBAR : out std_logic);
	end component DFF_JK;
	signal RESET: std_logic;
	signal D_OUT_BAR : std_logic_vector(5 downto 0);
begin
	
	OR0: OR_2 port map (RESETA, RESETB, RESET);
	
	DFF_R0: DFF_JK port map (D=>data_in(0), clock=> clk, enable=>'1', preset=>ResetA, reset=> ResetB, Q=> data_out(0),QBAR=>D_OUT_BAR(0));

	
	GNN: for i in 1 to 5 generate
	
		DFF_R: DFF_JK port map (D=>data_in(i), clock=> clk, enable=>'1', preset=>'0', reset=> Reset, Q=> data_out(i),QBAR=>D_OUT_BAR(i));
	
	end generate;
	

end BHV_R;