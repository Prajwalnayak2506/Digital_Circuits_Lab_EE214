library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led is
port( on_switch,reset,clock: in std_logic;
outp: out std_logic_vector(7 downto 0));
end led;

architecture light of led is

component TwoHertzClock is
	port( inputclock, reset:in std_logic;
			outputclock: out std_logic);
end component TwoHertzClock;

--component hz_clock is
--port( inclock,reset: in std_logic;
--outclock: out std_logic);
--end component hz_clock;

signal half_hz:std_logic;
signal counter:INTEGER := 0;
signal number:INTEGER :=128;

begin

clock_1: TwoHertzClock port map(clock,reset,half_hz);
--clock_2: hz_clock port map(clock,reset,hz);

light_proc:process(half_hz)
	
	

	begin
	
	if (on_switch='0') then
		for i in 0 to 7 loop
			if i = (2*counter) or i = ((2*counter)+1) then
				outp(i) <= '1';
			else
				outp(i) <= '0';
			end if;
		end loop;
		if counter = 3 then
			counter <= 0;
		else
			counter <= counter+1;
		end if;
	else
--		if (half_hz='1' and half_hz' event)then
			if (number >63) then
				outp<= std_logic_vector(to_unsigned(number,8));
				number <= number-1;
			else
				number <=128;
				outp<= std_logic_vector(to_unsigned(number,8));
			end if;
--		end if;
		--outp <= std_logic_vector(to_unsigned(50,8));
	end if;
end process;


end light;