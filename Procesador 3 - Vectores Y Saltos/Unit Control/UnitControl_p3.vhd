library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UnitControl_p3 is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op2 : in  STD_LOGIC_VECTOR (2 downto 0);
           cond : in  STD_LOGIC_VECTOR (3 downto 0);
           icc : in  STD_LOGIC_VECTOR (3 downto 0);
           WrEnMem : out  STD_LOGIC;
           RdEnMem : out  STD_LOGIC;
           WrEnRF : out  STD_LOGIC;
           RFDest : out  STD_LOGIC;
           RFSource : out  STD_LOGIC_VECTOR (1 downto 0);
           PCSource : out  STD_LOGIC_VECTOR (1 downto 0);
           Aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end UnitControl_p3;

architecture Behavioral of UnitControl_p3 is

begin

process (op, op3, op2, cond, icc)
	begin
		if (op = "01") then -- CALL
			WrEnMem <= '0';
			RdEnMem <= '1';
			WrEnRf <= '1';
			RFDest <= '1';
			RFSource <= "10";
			PCSource <= "01";
			AluOp <= "111111";
		else
			if(op = "10")then				
				case op3 is
					when "000000" => -- ADD
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000000";
					when "010000" => -- ADDcc
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "010000";
					when "001000" => -- ADDX
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "001000";
					when "011000" => -- ADDXcc
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "011000";
					when "000100" => -- SUB
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000100";
					when "010100" => -- SUBcc
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "010100";
					when "001100" => -- SUBX
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "001100";
					when "011100" => -- SUBXcc
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "011100";
					when "000001" => -- AND
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000001";
					when "010001" => -- ANDcc
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "010001";
					when "000101" => -- ANDN
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000101";
					when "010101" => -- ANDNcc
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "010101";
					when "000010" => -- OR
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000010";
					when "010010" => -- ORcc
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "010010";
					when "000110" => -- ORN
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000110";
					when "010110" => -- ORNcc
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "010110";
					when "000011" => -- XOR
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000011";
					when "010011" => -- XORcc
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "010011";
					when "000111" => -- XORN
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000111";
					when "010111" => -- XORNcc
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "010111";
					when "100101" => -- SLL
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "100101";
					when "100110" => -- SRL
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "100110";
					when "111000" => -- JMPL
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "10";
						PCSource <= "11";
						AluOp <= "000000";
					when "111100" => -- SAVE
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000000";
					when "111101" => -- RESTORE
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000000";
					when others => 
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '0';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000000";
				end case;
			else
				if (op = "11") then
					case op3 is
					when "000100" => -- STORE
						WrEnMem <= '1';
						RdEnMem <= '1';
						WrEnRf <= '0';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000000";
					when "000000" => -- LOAD
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '1';
						RFDest <= '0';
						RFSource <= "00";
						PCSource <= "00";
						AluOp <= "000000";
					when others => 
						WrEnMem <= '0';
						RdEnMem <= '1';
						WrEnRf <= '0';
						RFDest <= '0';
						RFSource <= "01";
						PCSource <= "00";
						AluOp <= "000000";
					end case;
				else
					if (op = "00") then
						if (op2 = "010") then -- Branch
							case cond is
								when "1000" => -- Branch Always
									WrEnMem <= '0';
									RdEnMem <= '1';
									WrEnRf <= '0';
									RFDest <= '0';
									RFSource <= "00";
									PCSource <= "10";
									AluOp <= "111111";
								when "1001" => -- Branch on Not equal
									if(not(icc(2)) = '1') then -- not Z
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "10";
										AluOp <= "111111";
									else
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "00";
										AluOp <= "111111";
									end if;
								when "0001" => -- Branch on equal
									if(icc(2) = '1') then -- Z
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "10";
										AluOp <= "111111";
									else
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "00";
										AluOp <= "111111";
									end if;
								when "1010" => -- Branch on Greater
									if((not(icc(2) or (icc(3) xor icc(1)))) = '1') then -- not(Z or (N xor V))
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "10";
										AluOp <= "111111";
									else
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "00";
										AluOp <= "111111";
									end if;
								when "1011" => -- Branch on Greater or equal
									if((not(icc(3) xor icc(1))) = '1') then -- not (N xor V)
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "10";
										AluOp <= "111111";
									else
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "00";
										AluOp <= "111111";
									end if;
								when "0011" => -- Branch on less
									if((icc(3) xor icc(1)) = '1') then -- (N xor V)
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "10";
										AluOp <= "111111";
									else
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "00";
										AluOp <= "111111";
									end if;
								when "0010" => -- Branch Less Or Equal
									if((icc(2) or (icc(3) xor icc(1))) = '1') then -- Z or (N xor V)
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "10";
										AluOp <= "111111";
									else
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "10";
										PCSource <= "00";
										AluOp <= "111111";
									end if;
								when others => 
										WrEnMem <= '0';
										RdEnMem <= '1';
										WrEnRf <= '0';
										RFDest <= '0';
										RFSource <= "00";
										PCSource <= "00";
										AluOp <= "111111";
							end case;
						else 
							if (op2 = "100") then
								WrEnMem <= '0';
								RdEnMem <= '1';
								WrEnRf <= '0';
								RFDest <= '0';
								RFSource <= "01";
								PCSource <= "00";
								AluOp <= "111111";
							end if;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

