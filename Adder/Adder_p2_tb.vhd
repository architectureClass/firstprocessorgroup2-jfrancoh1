LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Adder_p2_tb IS
END Adder_p2_tb;
 
ARCHITECTURE behavior OF Adder_p2_tb IS 
 
    COMPONENT Adder_p2
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         saladder : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal saladder : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder_p2 PORT MAP (
          A => A,
          B => B,
          saladder => saladder
        );


   -- Stimulus process
   stim_proc: process
   begin		
      A <= "00000000000000000000000000010000";
		B <= "00000000000000000000000000000001";
      wait for 100 ns;
      wait;
   end process;

END;
