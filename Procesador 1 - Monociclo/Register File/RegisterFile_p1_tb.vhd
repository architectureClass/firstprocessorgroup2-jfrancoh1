LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RegisterFile_p1_tb IS
END RegisterFile_p1_tb;
 
ARCHITECTURE behavior OF RegisterFile_p1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisteFile_p1
    PORT(
         rst : IN  std_logic;
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         salu : IN  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal salu : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisteFile_p1 PORT MAP (
          rst => rst,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          salu => salu,
          crs1 => crs1,
          crs2 => crs2
        );

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '0';
		rs1 <= "00000";
		rs2 <= "11110";
		rd <= "10000";
		salu <= "11111111111111111111111111111110";
      wait for 100 ns; 
		rst <= '0';
		rs1 <= "00000";
		rs2 <= "00101";
		rd <= "10001";
		salu <= "00000000000000000000000000000101";
      wait for 100 ns; 
		rst <= '0';
		rs1 <= "10000";
		rs2 <= "10001";
		rd <= "10010";
		salu <= "00000000000000000000000000000011";
      wait for 100 ns; 
		rst <= '0';
		rs1 <= "10001";
		rs2 <= "10000";
		rd <= "10011";
		salu <= "00000000000000000000000000000111";
      wait for 100 ns;
		rst <= '0';
		rs1 <= "10010";
		rs2 <= "10011";
		rd <= "01000";
		salu <= "00000000000000000000000000001010";
      wait for 100 ns;
		rst <= '0';
		rs1 <= "10010";
		rs2 <= "10011";
		rd <= "01001";
		salu <= "00000000000000000000000001110010";
      wait for 100 ns; 
		rst <= '0';
		rs1 <= "01000";
		rs2 <= "10111";
		rd <= "10011";
		salu <= "00000000000000000000000001110010";
      wait for 100 ns;
		rst <= '1';
		rs1 <= "10001";
		rs2 <= "10111";
		rd <= "10011";
		salu <= "00000000000000000000000001110010";
      wait for 100 ns;		
      wait;
   end process;

END;
