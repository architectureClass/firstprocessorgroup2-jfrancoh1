LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RegisterFile_p2_tb IS
END RegisterFile_p2_tb;
 
ARCHITECTURE behavior OF RegisterFile_p2_tb IS 
 
    COMPONENT RegisterFile_p2
    PORT(
         rst : IN  std_logic;
         rs1 : IN  std_logic_vector(5 downto 0);
         rs2 : IN  std_logic_vector(5 downto 0);
         rd : IN  std_logic_vector(5 downto 0);
         salu : IN  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal rs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal salu : std_logic_vector(31 downto 0) := (others => '0');
	
	signal crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile_p2 PORT MAP (
          rst => rst,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          salu => salu,
			 crs1 => crs1,
			 crs2	=> crs2
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '0';
		rs1 <= "000000";
		rs2 <= "011110";
		rd <= "010000";
		salu <= "11111111111111111111111111111110";
      wait for 100 ns; 
		rst <= '0';
		rs1 <= "000000";
		rs2 <= "000101";
		rd <= "010001";
		salu <= "00000000000000000000000000000101";
      wait for 100 ns; 
		rst <= '0';
		rs1 <= "010000";
		rs2 <= "010001";
		rd <= "010010";
		salu <= "00000000000000000000000000000011";
      wait for 100 ns; 
		rst <= '0';
		rs1 <= "010001";
		rs2 <= "010000";
		rd <= "010011";
		salu <= "00000000000000000000000000000111";
      wait for 100 ns;
		rst <= '0';
		rs1 <= "010010";
		rs2 <= "010011";
		rd <= "001000";
		salu <= "00000000000000000000000000001010";
      wait for 100 ns;
		rst <= '0';
		rs1 <= "010010";
		rs2 <= "010011";
		rd <= "001001";
		salu <= "00000000000000000000000001110010";
      wait for 100 ns; 
		rst <= '0';
		rs1 <= "001000";
		rs2 <= "010111";
		rd <= "010011";
		salu <= "00000000000000000000000001110010";
      wait for 100 ns;
		rst <= '1';
		rs1 <= "010001";
		rs2 <= "010111";
		rd <= "100011";
		salu <= "00000000000000000000000001110010";
      wait for 100 ns;

      wait;
   end process;

END;
