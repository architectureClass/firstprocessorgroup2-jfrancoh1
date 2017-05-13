library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEUdisp22_p3 is
    Port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           SEUBranch : out  STD_LOGIC_VECTOR (31 downto 0));
end SEUdisp22_p3;

architecture Behavioral of SEUdisp22_p3 is

begin

process (disp22)
	begin
		for r in 22 to 31 loop
			SEUBranch(r) <= ('0' or disp22(21));
		end loop;
		SEUBranch(21 downto 0) <= disp22(21 downto 0);
	end process;

end Behavioral;

