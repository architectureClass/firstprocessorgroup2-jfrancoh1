LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY MUX_RF_p2_tb IS
END MUX_RF_p2_tb;
 
ARCHITECTURE behavior OF MUX_RF_p2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_RF_p2
    PORT(
         crs2 : IN  std_logic_vector(31 downto 0);
         rs2imm : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         crs2alu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal rs2imm : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal crs2alu : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_RF_p2 PORT MAP (
          crs2 => crs2,
          rs2imm => rs2imm,
          i => i,
          crs2alu => crs2alu
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      crs2 <= "00000000000000000000000000001100";
		rs2imm <= "00000000000000000000000000001100";
		i <= '0';
      wait for 100 ns;
		crs2 <= "00000000000000000000000000001100";
		rs2imm <= "00000000000000000000000000001100";
		i <= '1';
      wait for 100 ns;
		crs2 <= "00000000000000000001000100001101";
		rs2imm <= "11111111111111111111000000001100";
		i <= '0';
      wait for 100 ns;
		crs2 <= "00000000000000000000000000010001";
		rs2imm <= "00000000000000000000000000010001";
		i <= '0';
      wait for 100 ns;
		crs2 <= "00000000000000000001000100001101";
		rs2imm <= "11111111111111111111000000001100";
		i <= '1';
      wait for 100 ns;
		crs2 <= "00000000000000000001010010001100";
		rs2imm <= "11111111111111111111010010001100";
		i <= '0';
      wait for 100 ns;
		crs2 <= "00000000000000000001010010001100";
		rs2imm <= "11111111111111111111010010001100";
		i <= '1';
      wait for 100 ns;

      wait;
   end process;

END;
