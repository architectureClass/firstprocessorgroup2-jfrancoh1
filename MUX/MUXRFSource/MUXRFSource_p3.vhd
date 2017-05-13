library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUXRFSource_p3 is
    Port ( Ralu : in  STD_LOGIC_VECTOR (31 downto 0);
           DatoMem : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           RFSource : in  STD_LOGIC_VECTOR (1 downto 0);
           DWR : out  STD_LOGIC_VECTOR (31 downto 0));
end MUXRFSource_p3;

architecture Behavioral of MUXRFSource_p3 is

begin

process (Ralu, DatoMem, PC, RFSource)
	begin
		if(RFSource = "00") then
			DWR <= DatoMem;
		elsif(RFSource = "01") then
			DWR <= Ralu;
			elsif(RFSource = "10") then
				DWR <= PC;
			else
				DWR <= (OTHERS => '0');
		end if;	
	end process;
	
end Behavioral;

