LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY add_p1_tb IS
END add_p1_tb;
 
ARCHITECTURE behavior OF add_p1_tb IS 
 
    COMPONENT add_p1
    PORT(
         pc : IN  std_logic_vector(31 downto 0);
         npc : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pc : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal npc : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: add_p1 PORT MAP (
          pc => pc,
          npc => npc
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      pc <= "00000000000000000000000000000000";
      wait for 100 ns;	
		pc <= "00000000000000000000000000000100";
      wait for 100 ns;	
		pc <= "00000000000000000000000000010000";
      wait for 100 ns;	
		pc <= "00000000000000000000000000000001";
      wait for 100 ns;
   end process;

END;
