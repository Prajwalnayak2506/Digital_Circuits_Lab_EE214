-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(4 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	Component Fibonacci_Detector is
		--generic (operand_width : integer := 4);
		port (x0, x1, x2, x3, x4: in std_logic; y: out std_logic);
	end component Fibonacci_Detector;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: Fibonacci_Detector port map (x4 => input_vector(4),
															x3 => input_vector(3),
															x2 => input_vector(2),
															x1 => input_vector(1),
															x0 => input_vector(0),
															y => output_vector(0));

end DutWrap;

