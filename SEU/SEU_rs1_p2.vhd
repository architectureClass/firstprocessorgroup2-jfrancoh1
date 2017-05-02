library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEU_rs1_p2 is
    Port ( rs1 : in  STD_LOGIC_VECTOR (12 downto 0);
           crs1_SEU : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_rs1_p2;

architecture Behavioral of SEU_rs1_p2 is

begin
process (rs1)
	begin
		for r in 13 to 31 loop
			crs1_SEU(r) <= ('0' or rs1(12));
		end loop;
		crs1_SEU(12 downto 0) <= rs1(12 downto 0);
	end process;
end Behavioral;

