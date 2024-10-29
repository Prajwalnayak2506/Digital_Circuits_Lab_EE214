-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	Component BCD_Adder is
		port (A3, A2, A1, A0, B3, B2, B1, B0 : in std_logic; Y4, Y3, Y2, Y1, Y0: out std_logic);
	end component BCD_Adder;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: BCD_Adder port map (A3 => input_vector(7),
												 A2 => input_vector(6),
												 A1 => input_vector(5),
												 A0 => input_vector(4),
												 B3 => input_vector(3),
												 B2 => input_vector(2),
												 B1 => input_vector(1),
												 B0 => input_vector(0),
												 Y4 => output_vector(4),
												 Y3 => output_vector(3),
												 Y2 => output_vector(2),
												 Y1 => output_vector(1),
												 Y0 => output_vector(0));
												 

end DutWrap;

