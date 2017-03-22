LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY UC_tb IS
END UC_tb;
 
ARCHITECTURE behavior OF UC_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UC
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         salu : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salu : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UC PORT MAP (
          op => op,
          op3 => op3,
          salu => salu
        );

   -- Stimulus process
   stim_proc: process
   begin		
      op <= "10";
		op3 <= "000000";
      wait for 100 ns;
		op <= "10";
		op3 <= "100101";
      wait for 100 ns;
		op <= "10";
		op3 <= "000111";
      wait for 100 ns;		

      -- insert stimulus here 
      wait;
   end process;

END;
