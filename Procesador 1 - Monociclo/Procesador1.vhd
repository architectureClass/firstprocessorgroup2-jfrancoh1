library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador1 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           salalu : out  STD_LOGIC_VECTOR (31 downto 0);
           conrs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           conrs2 : out  STD_LOGIC_VECTOR (31 downto 0);
           opproc : out  STD_LOGIC_VECTOR (1 downto 0);
           op3proc : out  STD_LOGIC_VECTOR (5 downto 0);
           conrd : out  STD_LOGIC_VECTOR (4 downto 0));
end Procesador1;


architecture Behavioral of Procesador1 is

COMPONENT ProgramCounter_p1
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		pc : IN std_logic_vector(31 downto 0);          
		pcout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT add_p1
	PORT(
		pc : IN std_logic_vector(31 downto 0);          
		npc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT InstructionMemory_p1
	PORT(
		rst : IN std_logic;
		pc : IN std_logic_vector(31 downto 0);          
		instructionout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT RegisteFile_p1
	PORT(
		rst : IN std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		salu : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT SEU_p1
	PORT(
		rs1 : IN std_logic_vector(12 downto 0);          
		es : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT UnitControl_p1
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		opalu : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
COMPONENT MUX_p1
	PORT(
		crs1 : IN std_logic_vector(31 downto 0);
		rs1imm : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		sal : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT ALU_p1
	PORT(
		opalu : IN std_logic_vector(5 downto 0);
		crs1 : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);          
		salu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
signal saladd, npcsal, pcsal, IM, ralu, oprs1, oprs2, esout, sel: std_logic_vector(31 downto 0) := (others => '0');
signal opcalu: std_logic_vector(5 downto 0) := (others => '0');
begin

NPC: ProgramCounter_p1 PORT MAP(
		clk => clk,
		rst => rst,
		pc => saladd,
		pcout => npcsal
	);

Adder: add_p1 PORT MAP(
		pc => npcsal,
		npc => saladd
	);
	
PC: ProgramCounter_p1 PORT MAP(
		clk => clk,
		rst => rst,
		pc => npcsal,
		pcout => pcsal
	);
	
InstM: InstructionMemory_p1 PORT MAP(
		rst => rst,
		pc => pcsal,
		instructionout => IM
	);
	
RF: RegisteFile_p1 PORT MAP(
		rst => rst,
		rs1 => IM(18 downto 14),
		rs2 => IM(4 downto 0),
		rd => IM(29 downto 25),
		salu => ralu,
		crs1 => oprs1,
		crs2 => oprs2
	);
	
UC: UnitControl_p1 PORT MAP(
		op => IM(31 downto 30),
		op3 => IM(24 downto 19),
		opalu => opcalu
	);

SEU: SEU_p1 PORT MAP(
		rs1 => IM(12 downto 0),
		es => esout
	);
	
MUX: MUX_p1 PORT MAP(
		crs1 => oprs2,
		rs1imm => esout,
		i => IM(13),
		sal => sel
	);
	
ALU: ALU_p1 PORT MAP(
		opalu => opcalu,
		crs1 => oprs1,
		crs2 => sel,
		salu => ralu
	);
	
	salalu <= ralu;
   conrs1 <= oprs1;
   conrs2 <= oprs2;
   opproc <= IM(31 downto 30);
   op3proc <= IM(24 downto 19);
   conrd <= IM(29 downto 25);
end Behavioral;

