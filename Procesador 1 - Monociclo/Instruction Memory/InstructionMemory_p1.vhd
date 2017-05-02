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
												  "10100000000100000011111111111110",
												  "10100010000100000010000000000101",
												  "10100100000001000000000000010001",
												  "10100110001001000100000000010000",
												  "10010000000001001000000000010011",
												  X"01000000", X"01000000", 
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

