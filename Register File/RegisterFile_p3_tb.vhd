LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RegisterFile_p3_tb IS
END RegisterFile_p3_tb;
 
ARCHITECTURE behavior OF RegisterFile_p3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile_p3
    PORT(
         rst : IN  std_logic;
         rs1 : IN  std_logic_vector(5 downto 0);
         rs2 : IN  std_logic_vector(5 downto 0);
         rd : IN  std_logic_vector(5 downto 0);
         WriteEnableRF : IN  std_logic;
         dwr : IN  std_logic_vector(31 downto 0);
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0);
         crd : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal rs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal WriteEnableRF : std_logic := '0';
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   signal crd : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile_p3 PORT MAP (
          rst => rst,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          WriteEnableRF => WriteEnableRF,
          dwr => dwr,
          crs1 => crs1,
          crs2 => crs2,
          crd => crd
        );
		  
   stim_proc: process
   begin		
      rst <= '0';
		WriteEnableRF <= '0';
		rs1 <= "000000";
		rs2 <= "011110";
		rd <= "010000";
		dwr <= "11111111111111111111111111111110";
      wait for 100 ns;
		rst <= '0';
		WriteEnableRF <= '1';
		rs1 <= "000000";
		rs2 <= "011110";
		rd <= "010000";
		dwr <= "11111111111111111111111111111110";
      wait for 100 ns;	
		rst <= '0';
		WriteEnableRF <= '1';
		rs1 <= "010000";
		rs2 <= "011110";
		rd <= "011000";
		dwr <= "00000011111111111111111111111110";
      wait for 100 ns;
		rst <= '1';
		WriteEnableRF <= '1';
		rs1 <= "010000";
		rs2 <= "011110";
		rd <= "011000";
		dwr <= "00000011111111111111111111111110";
      wait for 100 ns;
		rst <= '0';
		WriteEnableRF <= '1';
		rs1 <= "010000";
		rs2 <= "011110";
		rd <= "011000";
		dwr <= "00000011111111111111111111111110";
      wait for 100 ns;
		rst <= '0';
		WriteEnableRF <= '1';
		rs1 <= "010000";
		rs2 <= "011110";
		rd <= "010001";
		dwr <= "00000011111111111111111111111110";
      wait for 100 ns;
		
   end process;

END;
