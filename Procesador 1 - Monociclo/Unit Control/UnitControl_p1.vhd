library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UnitControl_p1 is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);  -- Op
           op3 : in  STD_LOGIC_VECTOR (5 downto 0); -- Op3
           opalu : out  STD_LOGIC_VECTOR (5 downto 0)); -- Salida para la ALU
end UnitControl_p1;

architecture Behavioral of UnitControl_p1 is

begin

process (op, op3)
begin
	if (op = "10") then
		case op3 is
			when "000000" => opalu <= "000000"; -- ADD
			when "000100" => opalu <= "000100"; -- SUB
			when "000001" => opalu <= "000001"; -- AND
			when "000101" => opalu <= "000101"; -- NAND
			when "000010" => opalu <= "000010"; -- OR
			when "000110" => opalu <= "000110"; -- NOR
			when "000011" => opalu <= "000011"; -- XOR
			when "000111" => opalu <= "000111"; -- XNOR
			when "100101" => opalu <= "100101"; -- SLL
			when "100110" => opalu <= "100110"; -- SRL
			when others => opalu <= "111111";
		end case;
	end if;
end process;


end Behavioral;

