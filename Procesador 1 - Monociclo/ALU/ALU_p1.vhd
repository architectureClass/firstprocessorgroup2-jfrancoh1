library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity ALU_p1 is
    Port ( opalu : in  STD_LOGIC_VECTOR (5 downto 0); -- Operador de la ALU que viene de UC
           crs1 : in  STD_LOGIC_VECTOR (31 downto 0); -- Operando 1
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0); -- Operando 2
           salu : out  STD_LOGIC_VECTOR (31 downto 0)); -- Resultado
end ALU_p1;

architecture Behavioral of ALU_p1 is

begin

process(opalu, crs1, crs2)
begin
	case opalu is
		when "000000" => salu <= crs1 + crs2; -- ADD
		when "000100" => salu <= crs1 - crs2; -- SUB
		when "000001" => salu <= crs1 and crs2; -- AND
		when "000101" => salu <= crs1 and not(crs2); -- ANDN
		when "000010" => salu <= crs1 or crs2; -- OR
		when "000110" => salu <= crs1 or not(crs2); -- ORN
		when "000011" => salu <= crs1 xor crs2; -- XOR
		when "000111" => salu <= crs1 xnor crs2; -- XNOR
		-- when "010100" => salu <= to_stdlogicvector(to_bitvector(crs1) SLL conv_integer(crs2));
		-- when "010101" => salu <= to_stdlogicvector(to_bitvector(crs1) SRL conv_integer(crs2));
		when others => salu <= "00000000000000000000000000000000";
	end case;
end process;
end Behavioral;

