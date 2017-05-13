LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUXimm13_p3_tb IS
END MUXimm13_p3_tb;
 
ARCHITECTURE behavior OF MUXimm13_p3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUXimm13_p3
    PORT(
         SEUimm13 : IN  std_logic_vector(31 downto 0);
         crs2 : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         op2alu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SEUimm13 : std_logic_vector(31 downto 0) := (others => '0');
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal op2alu : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXimm13_p3 PORT MAP (
          SEUimm13 => SEUimm13,
          crs2 => crs2,
          i => i,
          op2alu => op2alu
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      SEUimm13 <= "00000000000000000000000000110111";
		crs2 <= "00000000000000000000000000001010";
		i <= '0';
      wait for 100 ns;
		SEUimm13 <= "00000000000000000000000000110111";
		crs2 <= "00000000000000000000000000001010";
		i <= '1';
      wait for 100 ns;
   end process;

END;
