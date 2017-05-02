library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_p1 is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           rs1imm : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           sal : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_p1;

architecture Behavioral of MUX_p1 is

begin

	process (crs1, rs1imm, i)
	
	begin
		if (i = '0') then
			sal <= crs1;
		end if;
		if (i = '1') then
			sal <= rs1imm;
		end if;
	end process;
	
end Behavioral;

