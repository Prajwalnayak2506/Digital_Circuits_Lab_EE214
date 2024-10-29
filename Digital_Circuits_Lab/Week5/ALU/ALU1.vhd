library ieee;
use ieee.std_logic_1164.all;



library work;
use work.Gates.all;


entity ALU1 is 
	port ( A : in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0);Y: out std_logic_vector(5 downto 0));
end entity ALU1;


architecture Struct of ALU1 is
	--signal TEMP: std_logic_vector(3 downto 0); 
	--signal P, Q, R : std_logic;
	--variable P,Q,R : integer;
	
	function AandB(A : in std_logic_vector(3 downto 0);
		B: in std_logic_vector(3 downto 0))
	return std_logic_vector is 
		variable BandA : std_logic_vector(3 downto 0);
		
	begin
		L1: for i in 0 to 3 loop
				BandA(i) := A(i) and B(i);
			end loop L1;
		return BandA;
	end AandB;

	function NOTA(A : in std_logic_vector(3 downto 0))
	return std_logic_vector is 
		variable Anot : std_logic_vector(3 downto 0);
	begin
		L2: for j in 0 to 3 loop
				Anot(j) := not A(j);
			end loop L2;
		return Anot;
	end NOTA;

	function EQCHECK(A : in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
	return std_logic_vector is 
		variable NUM : std_logic_vector(3 downto 0);
		variable P: INTEGER;
	begin
		
		L3: for k in 0 to 3 loop
				if A(k) = B(k) then
					NUM(k) := A(k);
				else
					P := 1;
				end if;
		end loop L3;
		if P = 1 then
			L6: for m in 0 to 3 loop
				NUM(m) := '0';
			end loop L6;
		end if;
		return NUM;
	
	end EQCHECK;

	function MAXAB(A : in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
	return std_logic_vector is 
		variable MAXIMUM : std_logic_vector(3 downto 0);
		variable R,Q : INTEGER;
	begin
		
		R := 0;
		L4: for l in 0 to 3 loop
			if R = 0 then
				if (A(3-l) xor B(3-l)) = '1' then
					if A(3-l) = '1' then
						R := 1;
						Q := 1;
					else
						R := 1;
						Q := 0;
					end if;
				end if;
			end if;
		end loop L4;
		if Q=1 then
			MAXIMUM := A;
		else
			MAXIMUM := B;
		end if;
		if A = B then
			L7: for n in 0 to 3 loop
				MAXIMUM(n) := '0';
			end loop L7;
		end if;
		return MAXIMUM;
	end MAXAB;
	
	
	
	
	
begin
	process (A,B)
		begin
		if B(3) = '0' then
			if A(3) = '0' then
				Y(3 downto 0) <= MAXAB(A,B);
			else
				Y(3 downto 0) <= AandB(A,B);
			end if;
		else 
			if A(3) = '0' then
				Y(3 downto 0) <= NOTA(A);
			else 
				Y(3 downto 0) <= EQCHECK(A,B);
			end if;
		end if;
		
		--Y(3 downto 0) <= TEMP;
		Y(5) <= '0';
		Y(4) <= '0';
	end process;
	
end architecture;