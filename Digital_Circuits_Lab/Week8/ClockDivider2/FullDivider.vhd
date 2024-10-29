library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TwoFiftyHertzClock is
	port( inputclock, reset:in std_logic;
			outputclock: out std_logic);
end TwoFiftyHertzClock;


architecture bhv of TwoFiftyHertzClock is
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
				if count = 100000 then
					tempOP <= not tempOP;
					count <= 0;
				end if;
			end if;
	end process;
	outputclock <= tempOP;

end bhv;