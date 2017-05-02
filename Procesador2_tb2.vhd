LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Procesador2_tb2 IS
END Procesador2_tb2;
 
ARCHITECTURE behavior OF Procesador2_tb2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador2
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         cwpc : OUT  std_logic;
         ncwpc : OUT  std_logic;
         op3 : OUT  std_logic_vector(5 downto 0);
         rs1c : OUT  std_logic_vector(4 downto 0);
         rs2c : OUT  std_logic_vector(4 downto 0);
         rdc : OUT  std_logic_vector(4 downto 0);
         nrs1c : OUT  std_logic_vector(5 downto 0);
         nrs2c : OUT  std_logic_vector(5 downto 0);
         nrdc : OUT  std_logic_vector(5 downto 0);
         nzvcc : OUT  std_logic_vector(3 downto 0);
         resultado : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal cwpc : std_logic;
   signal ncwpc : std_logic;
   signal op3 : std_logic_vector(5 downto 0);
   signal rs1c : std_logic_vector(4 downto 0);
   signal rs2c : std_logic_vector(4 downto 0);
   signal rdc : std_logic_vector(4 downto 0);
   signal nrs1c : std_logic_vector(5 downto 0);
   signal nrs2c : std_logic_vector(5 downto 0);
   signal nrdc : std_logic_vector(5 downto 0);
   signal nzvcc : std_logic_vector(3 downto 0);
   signal resultado : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador2 PORT MAP (
          rst => rst,
          clk => clk,
          cwpc => cwpc,
          ncwpc => ncwpc,
          op3 => op3,
          rs1c => rs1c,
          rs2c => rs2c,
          rdc => rdc,
          nrs1c => nrs1c,
          nrs2c => nrs2c,
          nrdc => nrdc,
          nzvcc => nzvcc,
          resultado => resultado
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
      wait for 10 ns;	
		rst <= '0';
      wait for 100 ns;
      wait for clk_period*20; 

      wait;
   end process;

END;
