library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HalfHertzClock is
	port( inputclock, reset:in std_logic;
			outputclock: out std_logic);
end HalfHertzClock;


architecture bhv of HalfHertzClock is
signal tempOP : STD_LOGIC;
signal count:INTEGER := 0;

begin
	--clock_proc:process(clock,reset)
	process (inputclock,reset)
		begin
			if reset = '1' then
				count <= 0;
				tempOP <= '0';
			else
				count <= count+1;
				if count = 50000000 then
					tempOP <= not tempOP;
					count <= 0;
				end if;
			end if;
	end process;
	outputclock <= tempOP;

end bhv;