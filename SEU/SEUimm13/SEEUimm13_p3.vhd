library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEEUimm13_p3 is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           crs2SEU : out  STD_LOGIC_VECTOR (31 downto 0));
end SEEUimm13_p3;

architecture Behavioral of SEEUimm13_p3 is

begin
process (imm13)
	begin
		for r in 13 to 31 loop
			crs2SEU(r) <= ('0' or imm13(12));
		end loop;
		crs2SEU(12 downto 0) <= imm13(12 downto 0);
	end process;
	
end Behavioral;

