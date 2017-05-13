LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_p3_tb IS
END ALU_p3_tb;
 
ARCHITECTURE behavior OF ALU_p3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_p3
    PORT(
         opalu : IN  std_logic_vector(5 downto 0);
         crs1 : IN  std_logic_vector(31 downto 0);
         crs2 : IN  std_logic_vector(31 downto 0);
         carry : IN  std_logic;
         salu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal opalu : std_logic_vector(5 downto 0) := (others => '0');
   signal crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal carry : std_logic := '0';

 	--Outputs
   signal salu : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_p3 PORT MAP (
          opalu => opalu,
          crs1 => crs1,
          crs2 => crs2,
          carry => carry,
          salu => salu
        );
 

   -- Stimulus process
   stim_proc: process
   begin				
      opalu <= "000000";  -- ADD
		carry <= '0';
		crs1 <= "00000000000000000000000000000000"; 
		crs2 <= "11111111111111111111111111111110"; 
		wait for 100 ns;	
		opalu <= "010000"; -- ADDcc
		carry <= '0';
		crs1 <= "00000000000000000000000000000000";
		crs2 <= "00000000000000000000000000000101";
		wait for 100 ns;	
		opalu <= "001000"; -- ADDX
		carry <= '0';
		crs1 <= "11111111111111111111111111111110";
		crs2 <= "00000000000000000000000000000101";
		wait for 100 ns;	
		opalu <= "011000"; -- ADDXcc
		carry <= '0';
		crs1 <= "00000000000000000000000000000101";
		crs2 <= "11111111111111111111111111111110";
		wait for 100 ns;
		opalu <= "000100"; -- SUB
		carry <= '0';
		crs1 <= "00000000000000000000000000000011";
		crs2 <= "00000000000000000000000000000111";
		wait for 100 ns;	
		opalu <= "010100"; -- SUBcc
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;	
		opalu <= "001100"; -- SUBX
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;	
		opalu <= "011100"; -- SUBXcc
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;
		opalu <= "000001"; -- AND
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;
		opalu <= "010001"; -- ANDcc
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;
		opalu <= "000101"; -- ANDN
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;
		opalu <= "010101"; -- ANDNcc
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;
		opalu <= "000010"; -- OR
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;
		opalu <= "010010"; -- ORcc
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;		
		opalu <= "000110"; -- ORN
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;	
		opalu <= "010110"; -- ORNcc
		carry <= '1';
		crs1 <= "00000000000000000000000000110000";
		crs2 <= "00000000000000000000000000100011";
		wait for 100 ns;	
		opalu <= "100101"; -- SLL
		carry <= '1';
		crs1 <= "00000000000000000000000000000011";
		crs2 <= "00000000000000000000000000000011";
		wait for 100 ns;	
		opalu <= "100110"; -- SRL
		carry <= '1';
		crs1 <= "00000000000000000000000000001100";
		crs2 <= "00000000000000000000000000000010";
		wait for 100 ns;
     
   end process;

END;
