library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_RF_p2 is
    Port ( crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           rs2imm : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           crs2alu : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_RF_p2;

architecture Behavioral of MUX_RF_p2 is

begin
	process(crs2, rs2imm, i)
	begin
		if (i = '0') then
			crs2alu <= crs2;
		else
			crs2alu <= rs2imm;
		end if;
	end process;
end Behavioral;

