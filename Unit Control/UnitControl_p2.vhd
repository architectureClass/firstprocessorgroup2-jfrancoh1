library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UnitControl_p2 is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           opalu : out  STD_LOGIC_VECTOR (5 downto 0));
end UnitControl_p2;

architecture Behavioral of UnitControl_p2 is

begin

process (op, op3)
begin
	if (op = "10") then
		case op3 is
			when "000000" => opalu <= "000000"; -- ADD
			when "010000" => opalu <= "010000"; -- ADDcc
			when "001000" => opalu <= "001000"; -- ADDX
			when "011000" => opalu <= "011000"; -- ADDXcc
			when "000100" => opalu <= "000100"; -- SUB
			when "010100" => opalu <= "010100"; -- SUBcc
			when "001100" => opalu <= "001100"; -- SUBX
			when "011100" => opalu <= "011100"; -- SUBXcc
			when "000001" => opalu <= "000001"; -- AND
			when "010001" => opalu <= "010001"; -- ANDcc
			when "000101" => opalu <= "000101"; -- ANDN
			when "010101" => opalu <= "010101"; -- ANDNcc
			when "000010" => opalu <= "000010"; -- OR
			when "010010" => opalu <= "010010"; -- ORcc
			when "000110" => opalu <= "000110"; -- ORN
			when "010110" => opalu <= "010110"; -- ORNcc
			when "000011" => opalu <= "000011"; -- XOR
			when "010011" => opalu <= "010011"; -- XORcc
			when "000111" => opalu <= "000111"; -- XNOR
			when "010111" => opalu <= "010111"; -- XNORcc
			when "100101" => opalu <= "100101"; -- SLL
			when "100110" => opalu <= "100110"; -- SRL
			when "111100" => opalu <= "000100"; -- SAVE
			when "111101" => opalu <= "000000"; -- RESTORE
			when others => opalu <= "111111";
		end case;
	end if;
end process;

end Behavioral;

