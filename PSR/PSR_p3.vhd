library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR_p3 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ncwp : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           cwp : out  STD_LOGIC;
           icc : out  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end PSR_p3;

architecture Behavioral of PSR_p3 is

begin

process (clk, rst, ncwp, nzvc)
	begin
		if (rst = '1') then
			c <= '0';
			cwp <= '0';
			icc <= "0000";
		elsif(rising_edge(clk))then
				c <= nzvc(0);
				cwp <= ncwp;
				icc <= nzvc;
		end if;
	end process;

end Behavioral;

