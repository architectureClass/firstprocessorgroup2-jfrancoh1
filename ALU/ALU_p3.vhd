library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;

entity ALU_p3 is
	 Port ( opalu : in  STD_LOGIC_VECTOR (5 downto 0);
           crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           carry : in  STD_LOGIC;
           salu : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU_p3;

architecture Behavioral of ALU_p3 is

begin

process(opalu, crs1, crs2, carry)
begin
	case opalu is
		when "000000" => salu <= crs1 + crs2; -- ADD
		when "010000" => salu <= crs1 + crs2; -- ADDcc
		when "001000" => salu <= crs1 + crs2 + carry; -- ADDX
		when "011000" => salu <= crs1 + crs2 + carry; -- ADDXcc
		when "000100" => salu <= crs1 - crs2; -- SUB
		when "010100" => salu <= crs1 - crs2; -- SUBcc
		when "001100" => salu <= crs1 - crs2 - carry; -- SUBX
		when "011100" => salu <= crs1 - crs2 - carry; -- SUBXcc
		when "000001" => salu <= crs1 and crs2; -- AND
		when "010001" => salu <= crs1 and crs2; -- ANDcc
		when "000101" => salu <= crs1 and not(crs2); -- ANDN
		when "010101" => salu <= crs1 and not(crs2); -- ANDNcc
		when "000010" => salu <= crs1 or crs2; -- OR
		when "010010" => salu <= crs1 or crs2; -- ORcc
		when "000110" => salu <= crs1 or not(crs2); -- ORN
		when "010110" => salu <= crs1 or not(crs2); -- ORNcc
		when "000011" => salu <= crs1 xor crs2; -- XOR
		when "010011" => salu <= crs1 xor crs2; -- XORcc
		when "000111" => salu <= crs1 xnor crs2; -- XNOR
		when "010111" => salu <= crs1 xnor crs2; -- XNORcc
		when "100101" => salu <= to_stdlogicvector(to_bitvector(crs1) SLL conv_integer(crs2)); -- SLL
		when "100110" => salu <= to_stdlogicvector(to_bitvector(crs1) SRL conv_integer(crs2)); -- SRL
		when others => salu <= "00000000000000000000000000000000";
	end case;
end process;

end Behavioral;

