library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


entity ProgramCounter is
    Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin

process (Din,rst,clk)
begin
    if rising_edge(clk) then
      if (rst = '0') then 
			Dout <= Din;
		else
			Dout <= "00000000000000000000000000000000";
		end if;
	 end if;		
		
end process;

end Behavioral;

