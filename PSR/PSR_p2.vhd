library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR_p2 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           ncwp : in  STD_LOGIC;
           c : out  STD_LOGIC;
           cwp : out  STD_LOGIC);
end PSR_p2;

architecture Behavioral of PSR_p2 is

begin
process(clk, rst, nzvc, ncwp)
begin
	if (rst = '1') then
		c <= '0';
		cwp <= '0';
	else
		c <= nzvc(0);
		cwp <= ncwp;
	end if;
end process;

end Behavioral;

