LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY WindowsManager_p2_tb IS
END WindowsManager_p2_tb;
 
ARCHITECTURE behavior OF WindowsManager_p2_tb IS 
 
    COMPONENT WindowsManager_p2
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         cwp : IN  std_logic;
         nrd : OUT  std_logic_vector(5 downto 0);
         nrs1 : OUT  std_logic_vector(5 downto 0);
         nrs2 : OUT  std_logic_vector(5 downto 0);
         ncwp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal cwp : std_logic := '0';

 	--Outputs
   signal nrd : std_logic_vector(5 downto 0);
   signal nrs1 : std_logic_vector(5 downto 0);
   signal nrs2 : std_logic_vector(5 downto 0);
   signal ncwp : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WindowsManager_p2 PORT MAP (
          op => op,
          op3 => op3,
          rd => rd,
          rs1 => rs1,
          rs2 => rs2,
          cwp => cwp,
          nrd => nrd,
          nrs1 => nrs1,
          nrs2 => nrs2,
          ncwp => ncwp
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      op <= "11";
		op3 <= "111111";
		rd <= "00001";
		rs1 <= "01000";
		rs2 <= "01001";
		cwp <= '0';
      wait for 100 ns;
		op <= "10";
		op3 <= "000100";
		rd <= "00001";
		rs1 <= "01000";
		rs2 <= "01001";
		cwp <= '0';
      wait for 100 ns;
		op <= "10";
		op3 <= "000100";
		rd <= "00001";
		rs1 <= "01000";
		rs2 <= "01001";
		cwp <= '1';
      wait for 100 ns;
		op <= "10";
		op3 <= "111101";
		rd <= "00001";
		rs1 <= "01000";
		rs2 <= "01001";
		cwp <= '0';
      wait for 100 ns;
		op <= "10";
		op3 <= "111100";
		rd <= "00001";
		rs1 <= "01000";
		rs2 <= "01001";
		cwp <= '1';
      wait for 100 ns;
		op <= "10";
		op3 <= "111101";
		rd <= "00001";
		rs1 <= "01000";
		rs2 <= "01001";
		cwp <= '0';
      wait for 100 ns;
		op <= "10";
		op3 <= "111100";
		rd <= "10111";
		rs1 <= "00001";
		rs2 <= "11000";
		cwp <= '1';
      wait for 100 ns;
		op <= "10";
		op3 <= "111101";
		rd <= "10101";
		rs1 <= "01000";
		rs2 <= "10111";
		cwp <= '0';
      wait for 100 ns;
		op <= "10";
		op3 <= "000100";
		rd <= "10100";
		rs1 <= "01000";
		rs2 <= "10111";
		cwp <= '1';
      wait for 100 ns;
		op <= "10";
		op3 <= "000000";
		rd <= "10010";
		rs1 <= "10000";
		rs2 <= "10001";
		cwp <= '0';
      wait for 100 ns;
		op <= "10";
		op3 <= "111101";
		rd <= "10010";
		rs1 <= "10000";
		rs2 <= "10001";
		cwp <= '0';
      wait for 100 ns;
		op <= "10";
		op3 <= "000100";
		rd <= "01010";
		rs1 <= "01000";
		rs2 <= "01001";
		cwp <= '1';
      wait for 100 ns;
		op <= "10";
		op3 <= "111100";
		rd <= "01010";
		rs1 <= "01000";
		rs2 <= "01001";
		cwp <= '1';
      wait for 100 ns;
   end process;

END;
