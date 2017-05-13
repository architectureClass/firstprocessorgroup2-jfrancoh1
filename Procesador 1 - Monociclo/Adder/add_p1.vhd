library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity add_p1 is
    Port ( 	pc : in  STD_LOGIC_VECTOR (31 downto 0);
				npc : out  STD_LOGIC_VECTOR (31 downto 0));
end add_p1;

architecture Behavioral of add_p1 is

begin
		npc <= STD_LOGIC_VECTOR(unsigned(pc)+1);
end Behavioral;

