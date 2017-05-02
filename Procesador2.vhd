library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador2 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           cwpc : out  STD_LOGIC;
           ncwpc : out  STD_LOGIC;
			  op3 : out STD_LOGIC_VECTOR (5 downto 0);
			  rs1c : out STD_LOGIC_VECTOR(4 downto 0);
			  rs2c : out STD_LOGIC_VECTOR(4 downto 0);
			  rdc : out STD_LOGIC_VECTOR(4 downto 0);
			  nrs1c : out STD_LOGIC_VECTOR(5 downto 0);
			  nrs2c : out STD_LOGIC_VECTOR(5 downto 0);
			  nrdc : out STD_LOGIC_VECTOR(5 downto 0);
           nzvcc : out  STD_LOGIC_VECTOR(3 downto 0);
           resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador2;

architecture Behavioral of Procesador2 is

COMPONENT Adder_p2
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		saladder : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ProgramCounter_p1
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		pc : IN std_logic_vector(31 downto 0);          
		pcout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT InstructionMemory_p1
	PORT(
		rst : IN std_logic;
		pc : IN std_logic_vector(31 downto 0);          
		instructionout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RegisterFile_p2
	PORT(
		rst : IN std_logic;
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		salu : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT WindowsManager_p2
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		cwp : IN std_logic;          
		nrd : OUT std_logic_vector(5 downto 0);
		nrs1 : OUT std_logic_vector(5 downto 0);
		nrs2 : OUT std_logic_vector(5 downto 0);
		ncwp : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT UnitControl_p2
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		opalu : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU_rs1_p2
	PORT(
		rs1 : IN std_logic_vector(12 downto 0);          
		crs1_SEU : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSR_p2
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		nzvc : IN std_logic_vector(3 downto 0);
		ncwp : IN std_logic;          
		c : OUT std_logic;
		cwp : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT PSRModifier_p2
	PORT(
		rst : IN std_logic;
		crs1 : IN std_logic_vector(31 downto 0);
		crs2alu : IN std_logic_vector(31 downto 0);
		aluop : IN std_logic_vector(5 downto 0);
		salu : IN std_logic_vector(31 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUX_RF_p2
	PORT(
		crs2 : IN std_logic_vector(31 downto 0);
		rs2imm : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		crs2alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU_p2
	PORT(
		opalu : IN std_logic_vector(5 downto 0);
		crs1 : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);
		carry : IN std_logic;          
		salu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal saladder, salnpc, salpc, imsal, dwr, crs1rf, crs2rf, salseu, crs2mux: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal cwpsr, ncwpwin, carrypsr: STD_LOGIC := '0'; 	
signal nrs1win, nrs2win, nrdwin, aluopuc : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
signal nzvcpsr : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

begin
	
NPC: ProgramCounter_p1 PORT MAP(
		clk => clk,
		rst => rst,
		pc => saladder,
		pcout => salnpc 
	);
	
PC: ProgramCounter_p1 PORT MAP(
		clk => clk,
		rst => rst,
		pc => salnpc,
		pcout => salpc
	);

	
Adder: Adder_p2 PORT MAP(
		A => salnpc,
		B => "00000000000000000000000000000001",
		saladder => saladder
	);
	
IM: InstructionMemory_p1 PORT MAP(
		rst => rst,
		pc => salpc,
		instructionout => imsal 
	);

WM: WindowsManager_p2 PORT MAP(
		op => imsal(31 downto 30),
		op3 => imsal(24 downto 19),
		rd => imsal(29 downto 25),
		rs1 => imsal(18 downto 14),
		rs2 => imsal(4 downto 0),
		cwp => cwpsr,
		nrd => nrdwin,
		nrs1 => nrs1win,
		nrs2 => nrs2win,
		ncwp => ncwpwin 
	);	
	
RF: RegisterFile_p2 PORT MAP(
		rst => rst,
		rs1 => nrs1win,
		rs2 => nrs2win,
		rd => nrdwin,
		salu => dwr,
		crs1 => crs1rf,
		crs2 => crs2rf 
	);
	

UC: UnitControl_p2 PORT MAP(
		op => imsal(31 downto 30),
		op3 => imsal(24 downto 19),
		opalu => aluopuc
	);
	
SEU: SEU_rs1_p2 PORT MAP(
		rs1 => imsal(12 downto 0),
		crs1_SEU => salseu
	);
	
PSR: PSR_p2 PORT MAP(
		clk => clk,
		rst => rst,
		nzvc => nzvcpsr,
		ncwp => ncwpwin,
		c => carrypsr,
		cwp => cwpsr 
	);
	
PSRM: PSRModifier_p2 PORT MAP(
		rst => rst,
		crs1 => crs1rf,
		crs2alu => crs2mux,
		aluop => aluopuc,
		salu => dwr,
		nzvc => nzvcpsr
	);
	
MUX: MUX_RF_p2 PORT MAP(
		crs2 => crs2rf,
		rs2imm => salseu,
		i => imsal(13),
		crs2alu => crs2mux
	);
	
ALU: ALU_p2 PORT MAP(
		opalu => aluopuc,
		crs1 => crs1rf,
		crs2 => crs2mux,
		carry => carrypsr,
		salu => dwr
	);	

cwpc <= cwpsr;
ncwpc <= ncwpwin;
nzvcc <= nzvcpsr;
resultado <= dwr ;
op3 <= imsal(24 downto 19);
rs1c <= imsal(18 downto 14);
rs2c <= imsal(4 downto 0);
rdc <= imsal(29 downto 25);
nrs1c <= nrs1win;
nrs2c <= nrs2win;
nrdc <= nrdwin;	
end Behavioral;

