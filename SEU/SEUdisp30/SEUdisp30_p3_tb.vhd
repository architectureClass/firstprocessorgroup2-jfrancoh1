LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SEUdisp30_p3_tb IS
END SEUdisp30_p3_tb;
 
ARCHITECTURE behavior OF SEUdisp30_p3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEUdisp30_p3
    PORT(
         disp30 : IN  std_logic_vector(29 downto 0);
         SEUCall : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal disp30 : std_logic_vector(29 downto 0) := (others => '0');

 	--Outputs
   signal SEUCall : std_logic_vector(31 downto 0);
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEUdisp30_p3 PORT MAP (
          disp30 => disp30,
          SEUCall => SEUCall
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      disp30 <= "010101010101010101010101010101";
		wait for 100 ns;
		disp30 <= "110101010101010101010101010101";
		wait for 100 ns;
		
   end process;

END;
