-- A DUT entity is used to wrap your design so that we can combine it with testbench.
-- This example shows how you can do this for the OR Gate

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(input_vector: in std_logic_vector(2 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
component led is
port( on_switch,reset,clock: in std_logic;
outp: out std_logic_vector(7 downto 0));
end component led;

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: led
			port map (
					-- order of inputs B A
					on_switch => input_vector(2),
					reset => input_vector(1),
					clock => input_vector(0),
               -- order of output OUTPUT
					outp => output_vector);
end DutWrap;