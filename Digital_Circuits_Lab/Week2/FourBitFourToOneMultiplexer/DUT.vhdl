-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(17 downto 0);
       	output_vector: out std_logic_vector(3 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	Component FourBitFourToOneMultiplexer is
		
		port (d3,d2,d1,d0, c3,c2,c1,c0, b3,b2,b1,b0, a3,a2,a1,a0, Sel1, Sel0: in std_logic; Y3, Y2, Y1, Y0: out std_logic);
	end component FourBitFourToOneMultiplexer;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: FourBitFourToOneMultiplexer port map(d3 => input_vector(17),
																		d2 => input_vector(16),
																		d1 => input_vector(15),
																		d0 => input_vector(14),
																		c3 => input_vector(13),
																		c2 => input_vector(12),
																		c1 => input_vector(11),
																		c0 => input_vector(10),
																		b3 => input_vector(9),
																		b2 => input_vector(8),
																		b1 => input_vector(7),
																		b0 => input_vector(6),
																		a3 => input_vector(5),
																		a2 => input_vector(4),
																		a1 => input_vector(3),
																		a0 => input_vector(2),
																		Sel1 => input_vector(1),
																		Sel0 => input_vector(0),
																		Y3 => output_vector(3),
																		Y2 => output_vector(2),
																		Y1 => output_vector(1),
																		Y0 => output_vector(0));

end DutWrap;

