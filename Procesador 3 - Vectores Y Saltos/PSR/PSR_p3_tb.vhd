LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PSR_p3_tb IS
END PSR_p3_tb;
 
ARCHITECTURE behavior OF PSR_p3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR_p3
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ncwp : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
         cwp : OUT  std_logic;
         icc : OUT  std_logic_vector(3 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ncwp : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal cwp : std_logic;
   signal icc : std_logic_vector(3 downto 0);
   signal c : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR_p3 PORT MAP (
          clk => clk,
          rst => rst,
          ncwp => ncwp,
          nzvc => nzvc,
          cwp => cwp,
          icc => icc,
          c => c
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
		ncwp <= '1';
		nzvc <= "0001";
      wait for 100 ns;
		rst <= '0';
		ncwp <= '1';
		nzvc <= "0001";
      wait for 100 ns;
		rst <= '0';
		ncwp <= '0';
		nzvc <= "0001";
      wait for 100 ns;
		rst <= '0';
		ncwp <= '0';
		nzvc <= "0000";
      wait for 100 ns;
		rst <= '1';
		ncwp <= '0';
		nzvc <= "0001";
      wait for 100 ns;
		rst <= '0';
		ncwp <= '0';
		nzvc <= "0001";
      wait for 100 ns;
		rst <= '0';
		ncwp <= '1';
		nzvc <= "0000";
      wait for 100 ns;
		rst <= '0';
		ncwp <= '1';
		nzvc <= "0001";
      wait for 100 ns;
   end process;

END;
