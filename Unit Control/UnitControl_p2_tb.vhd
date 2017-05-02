LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY UnitControl_p2_tb IS
END UnitControl_p2_tb;
 
ARCHITECTURE behavior OF UnitControl_p2_tb IS 
 
    COMPONENT UnitControl_p2
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         opalu : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal opalu : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
  -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UnitControl_p2 PORT MAP (
          op => op,
          op3 => op3,
          opalu => opalu
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      op <= "10";
		op3 <= "000000";
      wait for 100 ns;
		op <= "10";
		op3 <= "010000";
      wait for 100 ns;
		op <= "10";
		op3 <= "001000";
      wait for 100 ns;
		op <= "10";
		op3 <= "011000";
      wait for 100 ns;
		op <= "10";
		op3 <= "000100";
      wait for 100 ns;
		op <= "10";
		op3 <= "010100";
      wait for 100 ns;
		op <= "10";
		op3 <= "001100";
      wait for 100 ns;
		op <= "10";
		op3 <= "011100";
      wait for 100 ns;
		op <= "10";
		op3 <= "000001";
      wait for 100 ns;
		op <= "10";
		op3 <= "000101";
      wait for 100 ns;
		op <= "10";
		op3 <= "010101";
      wait for 100 ns;
		op <= "10";
		op3 <= "000010";
      wait for 100 ns;
		op <= "10";
		op3 <= "010010";
      wait for 100 ns;
		op <= "10";
		op3 <= "000110";
      wait for 100 ns;
		op <= "10";
		op3 <= "010110";
      wait for 100 ns;
		op <= "10";
		op3 <= "000011";
      wait for 100 ns;
		op <= "10";
		op3 <= "010011";
      wait for 100 ns;
		op <= "10";
		op3 <= "000111";
      wait for 100 ns;
		op <= "10";
		op3 <= "010111";
      wait for 100 ns;
		op <= "10";
		op3 <= "100101";
      wait for 100 ns;
		op <= "10";
		op3 <= "100110";
      wait for 100 ns;
      wait;
   end process;

END;
