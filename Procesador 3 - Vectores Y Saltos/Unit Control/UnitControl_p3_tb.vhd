LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY UnitControl_p3_tb IS
END UnitControl_p3_tb;
 
ARCHITECTURE behavior OF UnitControl_p3_tb IS 
 
    COMPONENT UnitControl_p3
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         op2 : IN  std_logic_vector(2 downto 0);
         cond : IN  std_logic_vector(3 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         WrEnMem : OUT  std_logic;
         RdEnMem : OUT  std_logic;
         WrEnRF : OUT  std_logic;
         RFDest : OUT  std_logic;
         RFSource : OUT  std_logic_vector(1 downto 0);
         PCSource : OUT  std_logic_vector(1 downto 0);
         Aluop : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal op2 : std_logic_vector(2 downto 0) := (others => '0');
   signal cond : std_logic_vector(3 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal WrEnMem : std_logic;
   signal RdEnMem : std_logic;
   signal WrEnRF : std_logic;
   signal RFDest : std_logic;
   signal RFSource : std_logic_vector(1 downto 0);
   signal PCSource : std_logic_vector(1 downto 0);
   signal Aluop : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UnitControl_p3 PORT MAP (
          op => op,
          op3 => op3,
          op2 => op2,
          cond => cond,
          icc => icc,
          WrEnMem => WrEnMem,
          RdEnMem => RdEnMem,
          WrEnRF => WrEnRF,
          RFDest => RFDest,
          RFSource => RFSource,
          PCSource => PCSource,
          Aluop => Aluop
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      op <= "10";     -- ADD
		op3 <= "000000";
		op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- ADDcc
		op <= "10";
		op3 <= "010000";
		op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- ADDX
		op <= "10";
		op3 <= "001000";
		op2 <= "001";
		icc <= "0000";
      wait for 100 ns; -- ADDXcc
		op <= "10";
		op3 <= "011000";
		op2 <= "011";
		icc <= "0000";
      wait for 100 ns; -- SUB
		op <= "10";
		op3 <= "000100";
		op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- SUBcc
		op <= "10";
		op3 <= "010100";
		op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- SUBX
		op <= "10";
		op3 <= "001100";
		op2 <= "001";
		icc <= "0000";
      wait for 100 ns; -- SUBXcc
		op <= "10";
		op3 <= "011100";
		op2 <= "011";
		icc <= "0000";
      wait for 100 ns; -- AND
		op <= "10";
		op3 <= "000001";
		op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- ANDcc
		op <= "10";
		op3 <= "000101";
		op2 <= "001";
		icc <= "0000";
      wait for 100 ns; -- ANDN
		op <= "10";
		op3 <= "010101";
		op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- OR
		op <= "10";
		op3 <= "000010";
		op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- ORcc
		op <= "10";
		op3 <= "010010";
		op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- ORN
		op <= "10";
		op3 <= "000110";
		op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- ORNcc
		op <= "10";
		op3 <= "010110";
		op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- XOR
		op <= "10";
		op3 <= "000011";
		op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- XORcc
		op <= "10";
		op3 <= "010011";
		op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- XNOR
		op <= "10";
		op3 <= "000111";
		op2 <= "000";
		icc <= "0000";
      wait for 100 ns; -- XNORcc
		op <= "10";
		op3 <= "010111";
		op2 <= "010";
		icc <= "0000";
      wait for 100 ns; -- SLL
		op <= "10";
		op3 <= "100101";
		op2 <= "100";
		icc <= "0000";
      wait for 100 ns; -- SRL
		op <= "10";
		op3 <= "100110";
		op2 <= "100";
		icc <= "0000";
      wait for 100 ns; -- STORE
		op <= "11";
		op3 <= "000100";
		op2 <= "100";
		icc <= "0000";
      wait for 100 ns;
		wait for 100 ns; -- LOAD
		op <= "11";
		op3 <= "000000";
		op2 <= "100";
		icc <= "0000";
      wait for 100 ns;
      wait;
   end process;

END;
