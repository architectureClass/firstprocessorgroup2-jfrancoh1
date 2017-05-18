LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_p7 IS
END tb_p7;
 
ARCHITECTURE behavior OF tb_p7 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador7
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         npcp : OUT  std_logic_vector(31 downto 0);
         pcp : OUT  std_logic_vector(31 downto 0);
         op3 : OUT  std_logic_vector(5 downto 0);
         rs1c : OUT  std_logic_vector(4 downto 0);
         rs2c : OUT  std_logic_vector(4 downto 0);
         rdc : OUT  std_logic_vector(4 downto 0);
         ralupr : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal npcp : std_logic_vector(31 downto 0);
   signal pcp : std_logic_vector(31 downto 0);
   signal op3 : std_logic_vector(5 downto 0);
   signal rs1c : std_logic_vector(4 downto 0);
   signal rs2c : std_logic_vector(4 downto 0);
   signal rdc : std_logic_vector(4 downto 0);
   signal ralupr : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador7 PORT MAP (
          clk => clk,
          rst => rst,
          npcp => npcp,
          pcp => pcp,
          op3 => op3,
          rs1c => rs1c,
          rs2c => rs2c,
          rdc => rdc,
          ralupr => ralupr
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
      wait;
   end process;

END;
