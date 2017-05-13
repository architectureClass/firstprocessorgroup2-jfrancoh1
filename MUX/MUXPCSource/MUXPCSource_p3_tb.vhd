LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUXPCSource_p3_tb IS
END MUXPCSource_p3_tb;
 
ARCHITECTURE behavior OF MUXPCSource_p3_tb IS 
 
    COMPONENT MUXPCSource_p3
    PORT(
         PCCall : IN  std_logic_vector(31 downto 0);
         PCBranch : IN  std_logic_vector(31 downto 0);
         PC : IN  std_logic_vector(31 downto 0);
         PCJMPL : IN  std_logic_vector(31 downto 0);
         PCSource : IN  std_logic_vector(1 downto 0);
         PCMUX : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PCCall : std_logic_vector(31 downto 0) := (others => '0');
   signal PCBranch : std_logic_vector(31 downto 0) := (others => '0');
   signal PC : std_logic_vector(31 downto 0) := (others => '0');
   signal PCJMPL : std_logic_vector(31 downto 0) := (others => '0');
   signal PCSource : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal PCMUX : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUXPCSource_p3 PORT MAP (
          PCCall => PCCall,
          PCBranch => PCBranch,
          PC => PC,
          PCJMPL => PCJMPL,
          PCSource => PCSource,
          PCMUX => PCMUX
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      PCCall <= "00000000000000000000000000001010";
		PCBranch <= "00000000000000000000000000001111";
		PC <= "00000000000000000000000000000001";
		PCJMPL <= "00000000000000000000000000000011";
		PCSource <= "00";
      wait for 100 ns;
		PCCall <= "00000000000000000000000000001010";
		PCBranch <= "00000000000000000000000000001111";
		PC <= "00000000000000000000000000000001";
		PCJMPL <= "00000000000000000000000000000011";
		PCSource <= "01";
      wait for 100 ns;
		PCCall <= "00000000000000000000000000001010";
		PCBranch <= "00000000000000000000000000001111";
		PC <= "00000000000000000000000000000001";
		PCJMPL <= "00000000000000000000000000000011";
		PCSource <= "10";
      wait for 100 ns;
		PCCall <= "00000000000000000000000000001010";
		PCBranch <= "00000000000000000000000000001111";
		PC <= "00000000000000000000000000000001";
		PCJMPL <= "00000000000000000000000000000011";
		PCSource <= "11";
      wait for 100 ns;

      wait;
   end process;

END;
