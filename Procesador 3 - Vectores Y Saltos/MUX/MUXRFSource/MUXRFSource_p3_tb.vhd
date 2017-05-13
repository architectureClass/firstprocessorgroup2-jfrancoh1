LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUXRFSource_p3_tb IS
END MUXRFSource_p3_tb;
 
ARCHITECTURE behavior OF MUXRFSource_p3_tb IS 
 
    COMPONENT MUXRFSource_p3
    PORT(
         Ralu : IN  std_logic_vector(31 downto 0);
         DatoMem : IN  std_logic_vector(31 downto 0);
         PC : IN  std_logic_vector(31 downto 0);
         RFSource : IN  std_logic_vector(1 downto 0);
         DWR : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ralu : std_logic_vector(31 downto 0) := (others => '0');
   signal DatoMem : std_logic_vector(31 downto 0) := (others => '0');
   signal PC : std_logic_vector(31 downto 0) := (others => '0');
   signal RFSource : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal DWR : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXRFSource_p3 PORT MAP (
          Ralu => Ralu,
          DatoMem => DatoMem,
          PC => PC,
          RFSource => RFSource,
          DWR => DWR
        );
		  
   stim_proc: process
   begin		
      Ralu <= "00000000000000001101010111001110";
		DatoMem <= "00000000000000000000011111101111";
		PC <= "00000000000011111000000111110000";
		RFSource <= "00";
      wait for 100 ns;
		Ralu <= "00000000000000001101010111001110";
		DatoMem <= "00000000000000000000011111101111";
		PC <= "00000000000011111000000111110000";
		RFSource <= "01";
      wait for 100 ns;
		Ralu <= "00000000000000001101010111001110";
		DatoMem <= "00000000000000000000011111101111";
		PC <= "00000000000011111000000111110000";
		RFSource <= "10";
      wait for 100 ns;
		Ralu <= "00000000000000001101010111001110";
		DatoMem <= "00000000000000000000011111101111";
		PC <= "00000000000011111000000111110000";
		RFSource <= "11";
      wait for 100 ns;
		
   end process;

END;
