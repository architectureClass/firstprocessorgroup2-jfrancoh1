library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Procesador7 is
	Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           npcp : out  STD_LOGIC_VECTOR (31 downto 0);
           pcp : out  STD_LOGIC_VECTOR (31 downto 0);
			  op3 : out STD_LOGIC_VECTOR (5 downto 0);
			  rs1c : out STD_LOGIC_VECTOR(4 downto 0);
			  rs2c : out STD_LOGIC_VECTOR(4 downto 0);
			  rdc : out STD_LOGIC_VECTOR(4 downto 0);
           ralupr : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador7;

architecture Behavioral of Procesador7 is

COMPONENT ProgramCounter_p3
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		pcin : IN std_logic_vector(31 downto 0);          
		pcout : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;
	
COMPONENT Adder_p2
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		saladder : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;	

COMPONENT SEUdisp22_p3
	PORT(
		disp22 : IN std_logic_vector(21 downto 0);          
		SEUBranch : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;
	
COMPONENT SEUdisp30_p3
	PORT(
		disp30 : IN std_logic_vector(29 downto 0);          
		SEUCall : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;

COMPONENT MUXPCSource_p3
	PORT(
		PCCall : IN std_logic_vector(31 downto 0);
		PCBranch : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		PCJMPL : IN std_logic_vector(31 downto 0);
		PCSource : IN std_logic_vector(1 downto 0);          
		PCMUX : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;	

COMPONENT InstructionMemory_p1
	PORT(
		rst : IN std_logic;
		pc : IN std_logic_vector(31 downto 0);          
		instructionout : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;

COMPONENT WindowsManager_p3
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
		ncwp : OUT std_logic;
		r7 : OUT std_logic_vector(5 downto 0)
		);
END COMPONENT;

COMPONENT MUXRFDest_p3
	PORT(
		nrd : IN std_logic_vector(5 downto 0);
		r7 : IN std_logic_vector(5 downto 0);
		RFDest : IN std_logic;          
		nrdout : OUT std_logic_vector(5 downto 0)
		);
END COMPONENT;

COMPONENT UnitControl_p3
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		op2 : IN std_logic_vector(2 downto 0);
		cond : IN std_logic_vector(3 downto 0);
		icc : IN std_logic_vector(3 downto 0);          
		WrEnMem : OUT std_logic;
		RdEnMem : OUT std_logic;
		WrEnRF : OUT std_logic;
		RFDest : OUT std_logic;
		RFSource : OUT std_logic_vector(1 downto 0);
		PCSource : OUT std_logic_vector(1 downto 0);
		Aluop : OUT std_logic_vector(5 downto 0)
		);
END COMPONENT;

COMPONENT RegisterFile_p3
	PORT(
		rst : IN std_logic;
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		WriteEnableRF : IN std_logic;
		dwr : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0);
		crd : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;

COMPONENT SEEUimm13_p3
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		crs2SEU : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;	

COMPONENT MUXimm13_p3
	PORT(
		SEUimm13 : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		op2alu : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;

COMPONENT ALU_p3
	PORT(
		opalu : IN std_logic_vector(5 downto 0);
		crs1 : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);
		carry : IN std_logic;          
		salu : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;
	
COMPONENT PSRModifier_p3
	PORT(
		rst : IN std_logic;
		aluop : IN std_logic_vector(5 downto 0);
		crs1 : IN std_logic_vector(31 downto 0);
		crs2alu : IN std_logic_vector(31 downto 0);
		salu : IN std_logic_vector(31 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

COMPONENT PSR_p3
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		ncwp : IN std_logic;
		nzvc : IN std_logic_vector(3 downto 0);          
		cwp : OUT std_logic;
		icc : OUT std_logic_vector(3 downto 0);
		c : OUT std_logic
		);
END COMPONENT;

COMPONENT DataMemory_p3
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		WrEnMem : IN std_logic;
		RdEnMem : IN std_logic;
		crd : IN std_logic_vector(31 downto 0);
		salu : IN std_logic_vector(31 downto 0);          
		Datatomem : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;

COMPONENT MUXRFSource_p3
	PORT(
		Ralu : IN std_logic_vector(31 downto 0);
		DatoMem : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		RFSource : IN std_logic_vector(1 downto 0);          
		DWR : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;

signal saladderpc, salnpc, salpc, PCNEW, ralup, DataToReg, op2mux: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal imsal, outSEU22, saladder22, outSEU30, saladder30, outSEU13: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal crs1rf, crs2rf, crdrf, datatomemory : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal PCSUC, RFSUC : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
signal iccpsr, nzvcpsr : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal nrs1win, nrs2win, nrdwin, nr7win, nrdrf, aluopuc: STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
signal cwpsr, ncwpwin, RFDUC, WEMUC, REMUC, WERFUC, cpsr : STD_LOGIC := '0';


begin

NPC: ProgramCounter_p3 PORT MAP(
		clk => clk,
		rst => rst,
		pcin => PCNEW,
		pcout => salnpc
	);

PC: ProgramCounter_p3 PORT MAP(
		clk => clk,
		rst => rst,
		pcin => salnpc,
		pcout => salpc
	);
	
AdderPC: Adder_p2 PORT MAP(
		A => salnpc,
		B => "00000000000000000000000000000001",
		saladder => saladderpc
	);

SEU22: SEUdisp22_p3 PORT MAP(
		disp22 => imsal(21 downto 0),
		SEUBranch => outSEU22
	);
	
Adder22: Adder_p2 PORT MAP(
		A => outSEU22,
		B => salpc,
		saladder => saladder22
	);
	
SEU30: SEUdisp30_p3 PORT MAP(
		disp30 => imsal(29 downto 0),
		SEUCall => outSEU30
	);
	
Adder30: Adder_p2 PORT MAP(
		A => outSEU30,
		B => salpc,
		saladder => saladder30
	);

MUXPCSource: MUXPCSource_p3 PORT MAP(
		PCCall => saladder30,
		PCBranch => saladder22,
		PC => saladderpc,
		PCJMPL => ralup,
		PCSource => PCSUC,
		PCMUX => PCNEW
	);
	
IM: InstructionMemory_p1 PORT MAP(
		rst => rst,
		pc => salpc,
		instructionout => imsal
	);	

WM: WindowsManager_p3 PORT MAP(
		op => imsal(31 downto 30),
		op3 => imsal(24 downto 19),
		rd => imsal(29 downto 25),
		rs1 => imsal(18 downto 14),
		rs2 => imsal(4 downto 0),
		cwp => cwpsr,
		nrd => nrdwin,
		nrs1 => nrs1win,
		nrs2 => nrs2win,
		ncwp => ncwpwin,
		r7 => nr7win
	);
	
MUXRFDest: MUXRFDest_p3 PORT MAP(
		nrd => nrdwin,
		r7 => nr7win,
		RFDest => RFDUC,
		nrdout => nrdrf
	);
	
UC: UnitControl_p3 PORT MAP(
		op => imsal(31 downto 30),
		op3 => imsal(24 downto 19),
		op2 => imsal(24 downto 22),
		cond => imsal(28 downto 25),
		icc => iccpsr,
		WrEnMem => WEMUC,
		RdEnMem => REMUC,
		WrEnRF => WERFUC,
		RFDest => RFDUC,
		RFSource => RFSUC,
		PCSource => PCSUC,
		Aluop => aluopuc
	);
	
RF: RegisterFile_p3 PORT MAP(
		rst => rst,
		rs1 => nrs1win,
		rs2 => nrs2win,
		rd => nrdrf,
		WriteEnableRF => WERFUC,
		dwr => DataToReg,
		crs1 => crs1rf,
		crs2 => crs2rf,
		crd => crdrf 
	);
	
SEU13: SEEUimm13_p3 PORT MAP(
		imm13 => imsal(12 downto 0),
		crs2SEU => outSEU13
	);
	
MUX13: MUXimm13_p3 PORT MAP(
		SEUimm13 => outSEU13,
		crs2 => crs2rf,
		i => imsal(13),
		op2alu => op2mux
	);
	
ALU: ALU_p3 PORT MAP(
		opalu => aluopuc,
		crs1 => crs1rf,
		crs2 => op2mux,
		carry => cpsr,
		salu => ralup
	);

PSRM: PSRModifier_p3 PORT MAP(
		rst => rst,
		aluop => aluopuc,
		crs1 => crs1rf,
		crs2alu => op2mux,
		salu => ralup,
		nzvc => nzvcpsr
	);
	
PSR: PSR_p3 PORT MAP(
		clk => clk,
		rst => rst,
		ncwp => ncwpwin,
		nzvc => nzvcpsr,
		cwp => cwpsr,
		icc => iccpsr,
		c => cpsr
	);
	
DM: DataMemory_p3 PORT MAP(
		clk => clk,
		rst => rst,
		WrEnMem => WEMUC,
		RdEnMem => REMUC,
		crd => crdrf,
		salu => ralup,
		Datatomem => datatomemory
	);
	
MUXRFSource: MUXRFSource_p3 PORT MAP(
		Ralu => ralup,
		DatoMem => datatomemory,
		PC => salpc,
		RFSource => RFSUC,
		DWR => DataToReg
	);
	
npcp <= salnpc;
pcp <= salpc;
op3 <= imsal(24 downto 19);
rs1c <= imsal(18 downto 14);
rs2c <= imsal(4 downto 0);
rdc <= imsal(29 downto 25);
ralupr <= DataToReg;

end Behavioral;

