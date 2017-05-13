library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DataMemory_p3 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           WrEnMem : in  STD_LOGIC;
           RdEnMem : in  STD_LOGIC;
           crd : in  STD_LOGIC_VECTOR (31 downto 0);
           salu : in  STD_LOGIC_VECTOR (31 downto 0);
           Datatomem : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory_p3;

architecture Behavioral of DataMemory_p3 is

type ram_type is array (0 to 63) of std_logic_vector (31 downto 0);
signal ramMemory : ram_type :=(others => "00000000000000000000000000000000");

begin

process (clk, rst, WrEnMem, RdEnMem, crd, salu)
	begin
		if(rst = '1')then
			DatatoMem <= (others => '0');
			ramMemory <= (others => "00000000000000000000000000000000");
		else 
			if(rising_edge(clk))then
				if (WrEnMem = '1') then
					ramMemory(conv_integer(salu(5 downto 0))) <= crd;
				else
					if(RdEnMem = '1')then
						DatatoMem <= ramMemory(conv_integer(salu(5 downto 0)));
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

