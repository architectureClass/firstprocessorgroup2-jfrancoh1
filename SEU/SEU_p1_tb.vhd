LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SEU_p1_tb IS
END SEU_p1_tb;
 
ARCHITECTURE behavior OF SEU_p1_tb IS 
 
    COMPONENT SEU_p1
    PORT(
         rs1 : IN  std_logic_vector(12 downto 0);
         es : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal es : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU_p1 PORT MAP (
          rs1 => rs1,
          es => es
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
	
      rs1 <= "0000000010100";
      wait for 100 ns;
		rs1 <= "1111111110100";
      wait for 100 ns;
		rs1 <= "1000000010100";
      wait for 100 ns;
		rs1 <= "0000001010100";
      wait for 100 ns;
		rs1 <= "0000000011100";
      wait for 100 ns;
		rs1 <= "0000000010001";
      wait for 100 ns;
		rs1 <= "0001000010010";
      wait for 100 ns;
		rs1 <= "1010000010110";
      wait for 100 ns;
		
      wait;
   end process;

END;
