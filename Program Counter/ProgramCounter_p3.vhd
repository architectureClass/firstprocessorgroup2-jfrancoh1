library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter_p3 is
    Port ( clk : in STD_LOGIC;
				rst : in STD_LOGIC;
				pcin : in  STD_LOGIC_VECTOR (31 downto 0);
           pcout : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter_p3;

architecture Behavioral of ProgramCounter_p3 is

begin

process(clk, rst, pcin)
		begin
			if (rst = '1') then
				pcout <= (others => '0');
			elsif (rising_edge(clk)) then
				pcout <= pcin;
			end if;
	end process;

end Behavioral;

