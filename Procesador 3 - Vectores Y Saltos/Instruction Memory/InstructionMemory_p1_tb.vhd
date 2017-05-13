LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY InstructionMemory_p1_tb IS
END InstructionMemory_p1_tb;
 
ARCHITECTURE behavior OF InstructionMemory_p1_tb IS 
 
 
    COMPONENT InstructionMemory_p1
    PORT(
         rst : IN  std_logic;
         pc : IN  std_logic_vector(31 downto 0);
         instructionout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal pc : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal instructionout : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory_p1 PORT MAP (
          rst => rst,
          pc => pc,
          instructionout => instructionout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '0';
		pc <= "00000000000000000000000000000000";
      wait for 100 ns;
		rst <= '0';
		pc <= "00000000000000000000000000000001";
      wait for 100 ns;
		rst <= '0';
		pc <= "00000000000000000000000000000010";
      wait for 100 ns;
		rst <= '0';
		pc <= "00000000000000000000000000000011";
      wait for 100 ns;
		rst <= '0';
		pc <= "00000000000000000000000000000100";
      wait for 100 ns;
		rst <= '0';
		pc <= "00000000000000000000000000000101";
      wait for 100 ns;
		rst <= '0';
		pc <= "00000000000000000000000000000110";
      wait for 100 ns;

      wait;
   end process;

END;
