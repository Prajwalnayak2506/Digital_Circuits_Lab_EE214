-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(5 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	Component FourToOneMultiplexer is
		port (I4,I3,I2,I1,S2, S1: in std_logic; Y: out std_logic);
	end component FourToOneMultiplexer;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: FourToOneMultiplexer port map (I4 => input_vector(5),
																I3 => input_vector(4),
																I2 => input_vector(3),
																I1 => input_vector(2),
																S2 => input_vector(1),
																S1 => input_vector(0),
																Y => output_vector(0));

end DutWrap;

