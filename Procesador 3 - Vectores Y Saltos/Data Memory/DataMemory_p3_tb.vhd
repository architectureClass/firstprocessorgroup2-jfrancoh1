LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DataMemory_p3_tb IS
END DataMemory_p3_tb;
 
ARCHITECTURE behavior OF DataMemory_p3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory_p3
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         WrEnMem : IN  std_logic;
         RdEnMem : IN  std_logic;
         crd : IN  std_logic_vector(31 downto 0);
         salu : IN  std_logic_vector(31 downto 0);
         Datatomem : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal WrEnMem : std_logic := '0';
   signal RdEnMem : std_logic := '0';
   signal crd : std_logic_vector(31 downto 0) := (others => '0');
   signal salu : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Datatomem : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory_p3 PORT MAP (
          clk => clk,
          rst => rst,
          WrEnMem => WrEnMem,
          RdEnMem => RdEnMem,
          crd => crd,
          salu => salu,
          Datatomem => Datatomem
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
		WrEnMem <= '1';
		RdEnMem <= '0';
		crd <= "00000000000000000000000000001010";
		salu <= "00000000000000000000000000011001";
      wait for 100 ns;	
		rst <= '0';
		WrEnMem <= '1';
		RdEnMem <= '0';
		crd <= "00000000000000000000000000001010";
		salu <= "00000000000000000000000000011001";
      wait for 100 ns;
		rst <= '0';
		WrEnMem <= '0';
		RdEnMem <= '1';
		crd <= "00000000000000000000000000001010";
		salu <= "00000000000000000000000000011001";
      wait for 100 ns;
		
      wait for clk_period*10;
      wait;
   end process;

END;
