LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUX_p1_tb IS
END MUX_p1_tb;
 
ARCHITECTURE behavior OF MUX_p1_tb IS 
 
    COMPONENT MUX_p1
    PORT(
         crs1 : IN  std_logic_vector(31 downto 0);
         rs1imm : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         sal : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal rs1imm : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal sal : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_p1 PORT MAP (
          crs1 => crs1,
          rs1imm => rs1imm,
          i => i,
          sal => sal
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      crs1 <= "00000000000000000000000000001100";
		rs1imm <= "00000000000000000000000000001100";
		i <= '0';
      wait for 100 ns;
		crs1 <= "00000000000000000000000000001100";
		rs1imm <= "00000000000000000000000000001100";
		i <= '1';
      wait for 100 ns;
		crs1 <= "00000000000000000001000100001101";
		rs1imm <= "11111111111111111111000000001100";
		i <= '0';
      wait for 100 ns;
		crs1 <= "00000000000000000000000000010001";
		rs1imm <= "00000000000000000000000000010001";
		i <= '0';
      wait for 100 ns;
		crs1 <= "00000000000000000001000100001101";
		rs1imm <= "11111111111111111111000000001100";
		i <= '1';
      wait for 100 ns;
		crs1 <= "00000000000000000001010010001100";
		rs1imm <= "11111111111111111111010010001100";
		i <= '0';
      wait for 100 ns;
		crs1 <= "00000000000000000001010010001100";
		rs1imm <= "11111111111111111111010010001100";
		i <= '1';
      wait for 100 ns;
      wait;
   end process;

END;
