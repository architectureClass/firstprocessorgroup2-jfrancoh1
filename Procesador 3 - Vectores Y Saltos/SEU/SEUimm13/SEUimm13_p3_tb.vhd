LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SEUimm13_p3_tb IS
END SEUimm13_p3_tb;
 
ARCHITECTURE behavior OF SEUimm13_p3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEEUimm13_p3
    PORT(
         imm13 : IN  std_logic_vector(12 downto 0);
         crs2SEU : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal crs2SEU : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEEUimm13_p3 PORT MAP (
          imm13 => imm13,
          crs2SEU => crs2SEU
        );

   -- Stimulus process
   stim_proc: process
   begin		
      imm13 <= "0000000010100";
      wait for 100 ns;
		imm13 <= "1111111110100";
      wait for 100 ns;
		imm13 <= "1000000010100";
      wait for 100 ns;
		imm13 <= "0000001010100";
      wait for 100 ns;
		imm13 <= "0000000011100";
      wait for 100 ns;
		imm13 <= "0000000010001";
      wait for 100 ns;
		imm13 <= "0001000010010";
      wait for 100 ns;
		imm13 <= "1010000010110";
      wait for 100 ns;	

      wait;
   end process;

END;
