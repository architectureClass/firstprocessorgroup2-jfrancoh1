library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSRModifier_p2 is
    Port ( rst : in STD_LOGIC;
		     crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2alu : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           salu : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRModifier_p2;

architecture Behavioral of PSRModifier_p2 is

begin

process(rst, crs1, crs2alu, aluop, salu)
begin
	if (rst = '1') then
		nzvc <= "0000";
	
	else
	
	-- ADDcc y ADDXcc
	if ((aluop = "010000") or (aluop = "011000")) then
		nzvc(3) <= salu(31);
		if (salu = "00000000000000000000000000000000") then
			nzvc(2) <= '1';
		else
			nzvc(2) <= '0';
		end if;
		nzvc(1) <= (crs1(31) and crs2alu(31) and not(salu(31))) or (not(crs1(31)) and not(crs2alu(31)) and salu(31));
		nzvc(0) <= (crs1(31) and crs2alu(31)) or (not(salu(31)) and (crs1(31) or crs2alu(31)));
	end if;
	
	-- SUBcc y SUBXcc
	if ((aluop = "010100") or (aluop = "011100")) then
		nzvc(3) <= salu(31);
		if (salu = "00000000000000000000000000000000") then
			nzvc(2) <= '1';
		else
			nzvc(2) <= '0';
		end if;
		nzvc(1) <= (crs1(31) and not(crs2alu(31)) and not(salu(31))) or (not(crs1(31)) and crs2alu(31) and salu(31));
		nzvc(0) <= (not(crs1(31)) and crs2alu(31)) or (salu(31) and (not(crs1(31)) or crs2alu(31)));
	end if;
	
	-- ANDcc, ANDNcc, ORcc, ORNcc, XORcc, XNORcc
	if ((aluop = "010001") or (aluop = "010101") or (aluop = "010010")
	  or(aluop = "010110") or (aluop = "010011") or (aluop = "010111")) then
		nzvc(3) <= salu(31);
		if (salu = "00000000000000000000000000000000") then
			nzvc(2) <= '1';
		else
			nzvc(2) <= '0';
		end if;
		nzvc(1) <= '0';
		nzvc(0) <= '0';
	end if;	
	end if;
end process;

end Behavioral;

