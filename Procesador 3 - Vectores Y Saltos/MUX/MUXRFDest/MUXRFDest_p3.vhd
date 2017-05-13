library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUXRFDest_p3 is
    Port ( nrd : in  STD_LOGIC_VECTOR (5 downto 0);
           r7 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDest : in  STD_LOGIC;
           nrdout : out  STD_LOGIC_VECTOR (5 downto 0));
end MUXRFDest_p3;

architecture Behavioral of MUXRFDest_p3 is

begin

process(nrd, r7, RFDest)
	begin
		if (RFDest = '0') then
			nrdout <= nrd;       	-- Deja pasar el nrd
		elsif (RFDest = '1') then
			nrdout <= r7;				-- Obliga a guardar en O7
		end if;
	end process;

end Behavioral;

