library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUXimm13_p3 is
    Port ( SEUimm13 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           op2alu : out  STD_LOGIC_VECTOR (31 downto 0));
end MUXimm13_p3;

architecture Behavioral of MUXimm13_p3 is

begin

process (SEUimm13, crs2, i)
	begin
		if (i = '0') then
			op2alu <= crs2;
		else
			op2alu <= SEUimm13;
		end if;
	end process;

end Behavioral;

