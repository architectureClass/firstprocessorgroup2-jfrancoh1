library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InstructionMemory_p1 is
    Port ( rst : in  STD_LOGIC;
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           instructionout : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory_p1;

architecture Behavioral of InstructionMemory_p1 is
	type rom_type is array (0 to 63) of STD_LOGIC_VECTOR (31 downto 0);
	signal instructions : rom_type := (X"01000000",
												  "10100000000100000011111111111101",
												  "10110000000100000010000000000100",
												  "10110100101001000000000000011000",
												  "10000001111010000000000000000000",
												  "10010010000100000011111111110110",
												  "10110010000100000010000000010100",
												  "10100100011000100100000000011001",
												  "10000001111000000000000000000000",
												  "10010100100000100110000000000011",
												  "10100010000001101000000000001010",
												  X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000", 
												  X"01000000", X"01000000", X"01000000", X"01000000");
	
begin
	process (rst, pc)
		begin
			if (rst = '1') then
				instructionout <= (others => '0');
			else
				instructionout <= instructions(conv_integer(pc(5 downto 0)));
			end if;
	end process;
end Behavioral;

