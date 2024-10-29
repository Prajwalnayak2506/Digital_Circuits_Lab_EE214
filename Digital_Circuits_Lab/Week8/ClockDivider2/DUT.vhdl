-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(1 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
component HalfHertzClock is
port( inputclock, reset:in std_logic;
			outputclock: out std_logic);
end component HalfHertzClock;

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: HalfHertzClock
			port map (
					-- order of inputs B A
					inputclock => input_vector(1),
					reset => input_vector(0),
               -- order of output OUTPUT
					outputclock => output_vector(0));
--	add_instance: TwoFiftyHertzClock
--			port map (
--					-- order of inputs B A
--					inputclock => input_vector(1),
--					reset => input_vector(0),
--               -- order of output OUTPUT
--					outputclock => output_vector(0));
	
end DutWrap;