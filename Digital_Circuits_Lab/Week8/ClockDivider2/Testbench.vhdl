library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is 
end; 
architecture Behave of TestBench is 

component HalfHertzClock is
	port( inputclock, reset:in std_logic;
			outputclock: out std_logic);
end component HalfHertzClock;

signal clock_in, reset:std_logic :='1' ;
signal clock1_out:std_logic:='1'; 

begin 
clock_in <= not clock_in after 10 ns;
reset <= '1','0' after 700 ns;
 
dut_instance:HalfHertzClock port map (clock_in, reset, clock1_out);
end Behave;
