library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UC is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           salu : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture Behavioral of UC is


begin
process (op, op3)
begin
	if (op = "10") then 
		case op3 is
			when "000000" => salu <= "000000"; --suma 
			when "000100" => salu <= "000001"; --resta
			when "000001" => salu <= "000010"; --and
			when "000010" => salu <= "000011"; --or
			when "000011" => salu <= "000100"; --xor
			when "000111" => salu <= "000101"; --xnor
			when "100101" => salu <= "000110"; --SLL
			when "100110" => salu <= "000111"; --SRL
			when others => salu <= "000000";
		end case;
	end if;
end process;
end Behavioral;

