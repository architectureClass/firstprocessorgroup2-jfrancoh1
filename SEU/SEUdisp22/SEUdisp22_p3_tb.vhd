LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SEUdisp22_p3_tb IS
END SEUdisp22_p3_tb;
 
ARCHITECTURE behavior OF SEUdisp22_p3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEUdisp22_p3
    PORT(
         disp22 : IN  std_logic_vector(21 downto 0);
         SEUBranch : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal disp22 : std_logic_vector(21 downto 0) := (others => '0');

 	--Outputs
   signal SEUBranch : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEUdisp22_p3 PORT MAP (
          disp22 => disp22,
          SEUBranch => SEUBranch
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      disp22 <= "0101010101010101010101";
		wait for 100 ns;
		disp22 <= "1101010101010101010101";
		wait for 100 ns;
   end process;
	

END;
