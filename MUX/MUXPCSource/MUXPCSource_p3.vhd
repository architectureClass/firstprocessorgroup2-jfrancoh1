library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUXPCSource_p3 is
    Port ( PCCall : in  STD_LOGIC_VECTOR (31 downto 0);
           PCBranch : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           PCJMPL : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSource : in  STD_LOGIC_VECTOR (1 downto 0);
           PCMUX : out  STD_LOGIC_VECTOR (31 downto 0));
end MUXPCSource_p3;

architecture Behavioral of MUXPCSource_p3 is

begin

process (PCCall, PCBranch, PC, PCJMPL, PCSource)
	begin
		if (PCSource = "00") then  
			PCMUX <= PC; 					-- Pasa PC normal
		elsif (PCSource = "01") then
			PCMUX <= PCCall;				-- Pasa Call
		elsif (PCSource = "10") then
			PCMUX <= PCBranch;			-- Pasa Branch
		elsif (PCSource = "11") then
			PCMUX <= PCJMPL;				-- Pasa JMPL
		end if;
	end process;
	
end Behavioral;

