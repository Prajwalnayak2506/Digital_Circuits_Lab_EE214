library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MealyFSM is
	port( inp:in std_logic_vector(4 downto 0);
			reset,clock:in std_logic;
			outp: out std_logic);
end MealyFSM;


architecture bhv of MealyFSM is
	
component runFSM is
	port( inp:in std_logic_vector(4 downto 0);
			reset,clock:in std_logic;
			outp: out std_logic);
end component runFSM;

component cryFSM is
	port( inp:in std_logic_vector(4 downto 0);
			reset,clock:in std_logic;
			outp: out std_logic);
end component cryFSM;

component broomFSM is
	port( inp:in std_logic_vector(4 downto 0);
			reset,clock:in std_logic;
			outp: out std_logic);
end component broomFSM;

	signal o1,o2,o3 : STD_LOGIC;

	--begin
	--clock_proc:process(clock,reset)
	begin
	runFSM1 : runFSM port map (inp=>inp, reset=>reset, clock=>clock , outp=> o1);
	cryFSM1 : cryFSM port map (inp=>inp, reset=>reset, clock=>clock , outp=> o2);
	broomFSM1 : broomFSM port map (inp=>inp, reset=>reset, clock=>clock , outp=> o3); 
	outp <= o1 or (o2 or o3);
	--end process;
end bhv;