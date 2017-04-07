library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU_p1 is
    Port ( rs1 : in  STD_LOGIC_VECTOR (12 downto 0);
           es : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_p1;

architecture Behavioral of SEU_p1 is

begin
	
	process (rs1)
	
	begin
		for r in 13 to 31 loop
			es(r) <= ('0' or rs1(12));
		end loop;
		es(12 downto 0) <= rs1(12 downto 0);
	end process;
		
end Behavioral;

