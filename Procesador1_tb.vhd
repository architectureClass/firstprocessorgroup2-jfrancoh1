LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Procesador1_tb IS
END Procesador1_tb;
 
ARCHITECTURE behavior OF Procesador1_tb IS 
 
    COMPONENT Procesador1
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         salalu : OUT  std_logic_vector(31 downto 0);
         conrs1 : OUT  std_logic_vector(31 downto 0);
         conrs2 : OUT  std_logic_vector(31 downto 0);
         opproc : OUT  std_logic_vector(1 downto 0);
         op3proc : OUT  std_logic_vector(5 downto 0);
         conrd : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal salalu : std_logic_vector(31 downto 0);
   signal conrs1 : std_logic_vector(31 downto 0);
   signal conrs2 : std_logic_vector(31 downto 0);
   signal opproc : std_logic_vector(1 downto 0);
   signal op3proc : std_logic_vector(5 downto 0);
   signal conrd : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador1 PORT MAP (
          rst => rst,
          clk => clk,
          salalu => salalu,
          conrs1 => conrs1,
          conrs2 => conrs2,
          opproc => opproc,
          op3proc => op3proc,
          conrd => conrd
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
      wait for 100 ns;
		rst <= '0';
      wait for 100 ns;		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
