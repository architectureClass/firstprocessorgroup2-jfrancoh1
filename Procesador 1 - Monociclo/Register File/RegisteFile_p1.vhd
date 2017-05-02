library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisteFile_p1 is
    Port ( rst : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           salu : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisteFile_p1;

architecture Behavioral of RegisteFile_p1 is

type ram is array (39 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
signal registros : ram := (others => "00000000000000000000000000000000");

begin

	process (rst, rs1, rs2, rd, salu )
	
	begin
		if (rst = '1') then
			registros <= (others => "00000000000000000000000000000000");
			crs1 <= (others => '0');
			crs2 <= (others => '0');
		else
			if (rd /= "00000") then
				registros(conv_integer(rd)) <= salu;
			end if;
			crs1 <= registros(conv_integer(rs1));
			crs2 <= registros(conv_integer(rs2));
		end if;
	end process;

end Behavioral;