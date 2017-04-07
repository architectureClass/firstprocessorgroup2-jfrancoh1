LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ProgramCounter_p1_tb IS
END ProgramCounter_p1_tb;
 
ARCHITECTURE behavior OF ProgramCounter_p1_tb IS 
 
    COMPONENT ProgramCounter_p1
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         pc : IN  std_logic_vector(31 downto 0);
         pcout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal pc : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal pcout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter_p1 PORT MAP (
          clk => clk,
          rst => rst,
          pc => pc,
          pcout => pcout
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
      rst <= '0';
		pc <= "00000000000000000000000000000000";
      wait for 20 ns;	
		rst <= '0';
		pc <= "00000000000000000000000000000100";
      wait for 20 ns;	
		rst <= '0';
		pc <= "00000000000000000000000000100100";
      wait for 20 ns;
		rst <= '1';
		pc <= "00000000000000000000000000000111";
      wait for 20 ns;		
		rst <= '0';
		pc <= "00000000000000000000000000000001";
      wait for 20 ns;	
		rst <= '0';
		pc <= "00000000000000000000000000000111";
      wait for 20 ns;	
		rst <= '0';
		pc <= "00000000000000000000000000010010";
      wait for 20 ns;	
      wait for clk_period*5;
      wait;
   end process;

END;
