LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUXRFDest_p3_tb IS
END MUXRFDest_p3_tb;
 
ARCHITECTURE behavior OF MUXRFDest_p3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUXRFDest_p3
    PORT(
         nrd : IN  std_logic_vector(5 downto 0);
         r7 : IN  std_logic_vector(5 downto 0);
         RFDest : IN  std_logic;
         nrdout : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nrd : std_logic_vector(5 downto 0) := (others => '0');
   signal r7 : std_logic_vector(5 downto 0) := (others => '0');
   signal RFDest : std_logic := '0';

 	--Outputs
   signal nrdout : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXRFDest_p3 PORT MAP (
          nrd => nrd,
          r7 => r7,
          RFDest => RFDest,
          nrdout => nrdout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      nrd <= "111100";
		r7 <= "001111";
		RFDest <= '0';
      wait for 100 ns;	
		nrd <= "111100";
		r7 <= "011111";
		RFDest <= '0';
      wait for 100 ns;	
		nrd <= "111100";
		r7 <= "001111";
		RFDest <= '1';
      wait for 100 ns;	
		nrd <= "111100";
		r7 <= "011111";
		RFDest <= '1';
      wait for 100 ns;
   end process;

END;
