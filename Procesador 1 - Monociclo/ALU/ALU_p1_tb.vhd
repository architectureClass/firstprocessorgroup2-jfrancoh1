LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_p1_tb IS
END ALU_p1_tb;
 
ARCHITECTURE behavior OF ALU_p1_tb IS 
 
    COMPONENT ALU_p1
    PORT(
         opalu : IN  std_logic_vector(5 downto 0);
         crs1 : IN  std_logic_vector(31 downto 0);
         crs2 : IN  std_logic_vector(31 downto 0);
         salu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal opalu : std_logic_vector(5 downto 0) := (others => '0');
   signal crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_p1 PORT MAP (
          opalu => opalu,
          crs1 => crs1,
          crs2 => crs2,
          salu => salu
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
      opalu <= "000010";  -- or
		crs1 <= "00000000000000000000000000000000"; -- 0
		crs2 <= "11111111111111111111111111111110"; -- -2
		wait for 100 ns;	
		opalu <= "000010"; -- or
		crs1 <= "00000000000000000000000000000000";
		crs2 <= "00000000000000000000000000000101";
		wait for 100 ns;	
		opalu <= "000000"; -- ADD
		crs1 <= "11111111111111111111111111111110";
		crs2 <= "00000000000000000000000000000101";
		wait for 100 ns;	
		opalu <= "000100"; -- SUB
		crs1 <= "00000000000000000000000000000101";
		crs2 <= "11111111111111111111111111111110";
		wait for 100 ns;	
		opalu <= "000000"; -- ADD
		opalu <= "000000"; -- ADD
		crs1 <= "00000000000000000000000000000011";
		crs2 <= "00000000000000000000000000000111";
		wait for 100 ns;	
		--opalu <= "000110"; -- ORN
		--crs1 <= "00000000000000000000000000110000";
		--crs2 <= "00000000000000000000000000100011";
		--wait for 100 ns;	
		--opalu <= "000011"; -- XOR
		--crs1 <= "00000000000000000000000000110000";
		--crs2 <= "00000000000000000000000000100011";
		--wait for 100 ns;	
		--opalu <= "000111"; -- XNOR
		--crs1 <= "00000000000000000000000000110000";
		--crs2 <= "00000000000000000000000000100011";
		--wait for 100 ns;	
      -- insert stimulus here 
      wait;
   end process;

END;
