library ieee;
use ieee.std_logic_1164.all;

library work;
use work.Gates.all;

entity FibGenerator is
	port(Clk, Reset : in std_logic;
	Seq_out : out std_logic_vector(5 downto 0));
end entity;

architecture BHV of FibGenerator is
	component Register6bit is
		port(Clk, Reset : in std_logic;
		data_in : in std_logic_vector(5 downto 0);
		data_out : out std_logic_vector(5 downto 0));
	end component Register6bit; 
	component SIX_BIT_ADDER is
		port (A,B: in std_logic_vector(5 downto 0);
				S: out std_logic_vector(5 downto 0);
				Cout: out std_logic);
	end component SIX_BIT_ADDER;
	component Clock_Divider is
	port ( Clk_50  : in std_logic;
		   Reset   : in std_logic;
		   Clk_Out : out std_logic );
	end component Clock_Divider;
	signal D_in_A, D_in_B, D_out_A,D_out_B, C,TempVec: std_logic_vector(5 downto 0);
	signal ResetBar,Temp,Clk_Out : std_logic;
	
begin
	
	CLOCK_DIV: Clock_Divider port map( Clk_50 =>Clk,Reset => '0',Clk_Out =>Clk_Out);
	
	SIX_BIT_ADDER_1: SIX_BIT_ADDER port map (D_out_A, D_out_B, TempVec,Temp);
	
	INV1: INVERTER port map (Reset, ResetBar);
	
	R_A : Register6bit port map(Clk=>Clk_Out, Reset=>Reset,data_in=>D_in_A,data_out=>D_out_A);
	
	R_B : Register6bit port map(Clk=>Clk_Out, Reset=>Reset,data_in=>D_in_B,data_out=>D_out_B);
	
	D_in_B <= D_out_A;
	
	
	GNN_F1: for i in 0 to 5 generate
		AND_F1: AND_2 port map(TempVec(i),RESETBAR,C(i));
	end generate;
	
	
	GNN_F2: for p in 1 to 5 generate
		D_in_A(p) <= C(p);
	end generate;
		
	OR2: OR_2 port map(C(0),RESET, D_in_A(0));
	--	

	
--	
--	GNN_F: for p in 1 to 5 generate
--		AND_F1: AND_2 port map (D_out_A(p),Resetbar,D_in_B(p));
--		AND_F2: AND_2 port map (C(p),Resetbar,D_in_A(p));
--	end generate;
--	AND_F10: AND_2 port map (D_out_A(0),Resetbar,D_in_B(0));
--	OR_F20: OR_2 port map (C(0),Reset,D_in_A(0));
	
	Seq_Out<=C;
	
	
end BHV;
