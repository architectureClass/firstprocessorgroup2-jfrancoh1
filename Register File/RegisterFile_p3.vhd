library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile_p3 is
    Port ( rst : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           WriteEnableRF : in  STD_LOGIC;
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0);
           crd : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile_p3;

architecture Behavioral of RegisterFile_p3 is

type ram is array (39 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
signal registros : ram := (others => "00000000000000000000000000000000");

begin

	process (rst, rs1, rs2, rd, dwr, WriteEnableRF)
		begin
			if (rst = '1') then
				registros <= (others => "00000000000000000000000000000000");
				crs1 <= (others => '0');
				crs2 <= (others => '0');
				crd <= (others => '0');
			else
				if ((WriteEnableRF = '1') and (rd /= "000000")) then
					registros(conv_integer(rd)) <= dwr;
				end if;
				crs1 <= registros(conv_integer(rs1));
				crs2 <= registros(conv_integer(rs2));
				crd <= registros(conv_integer(rd));
			end if;
		end process;

end Behavioral;

