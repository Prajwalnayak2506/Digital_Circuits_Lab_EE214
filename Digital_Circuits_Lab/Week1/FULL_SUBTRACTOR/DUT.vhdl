-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(2 downto 0);
       	output_vector: out std_logic_vector(1 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	Component FULL_SUBTRACTOR is
		--generic (operand_width : integer := 4);
		port (P,Q,R: in std_logic; BORROW, DIFFERENCE: out std_logic);
	end component FULL_SUBTRACTOR;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: FULL_SUBTRACTOR port map (P => input_vector(2), Q => input_vector(1), R => input_vector(0),
											BORROW => output_vector(0), DIFFERENCE => output_vector(1));

end DutWrap;

