library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ProgramCounter_p1 is
    Port ( 	clk : in STD_LOGIC;
				rst : in STD_LOGIC;
				pc : in  STD_LOGIC_VECTOR (31 downto 0);
				pcout : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter_p1;

architecture Behavioral of ProgramCounter_p1 is

begin

	process(clk, rst, pc)
		begin
			if (rst = '1') then
				pcout <= (others => '0');
			elsif (rising_edge(clk)) then
				pcout <= pc;
			end if;
	end process;
	
end Behavioral;

