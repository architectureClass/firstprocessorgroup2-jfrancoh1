library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEUdisp30_p3 is
    Port ( disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
           SEUCall : out  STD_LOGIC_VECTOR (31 downto 0));
end SEUdisp30_p3;

architecture Behavioral of SEUdisp30_p3 is

begin

process (disp30)
	begin
		for r in 30 to 31 loop
			SEUcall(r) <= ('0' or disp30(29));
		end loop;
		SEUCall(29 downto 0) <= disp30(29 downto 0);
	end process;
	
end Behavioral;

