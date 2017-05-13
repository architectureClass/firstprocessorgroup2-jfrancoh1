library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador5 is
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
end Procesador5;

architecture Behavioral of Procesador5 is

COMPONENT Adder_p2
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		saladder : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ProgramCounter_p3
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		pcin : IN std_logic_vector(31 downto 0);          
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
	
	COMPONENT SEEUimm13_p3
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		crs2SEU : OUT std_logic_vector(31 downto 0)
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
	
signal saladderpc, salnpc, salpc, imsal, dwr, ralu, crs1rf, crs2rf, crdrf, datomem, salseuimm13, crs2muximm13: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal cwpsr, ncwpwin, carrypsr, WEMUC, REMUC, WERFUC, RFDUC : STD_LOGIC := '0'; 	
signal nrs1win, nrs2win, nrdwin, reg7, aluopuc : STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
signal nzvcpsrm, iccpsr : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal RFSUC, PCSUC : STD_LOGIC_VECTOR (1 downto 0) := "00";
	
begin


AdderPC: Adder_p2 PORT MAP(
		A => salnpc,
		B => "00000000000000000000000000000001",
		saladder => saladderpc
	);
	
PC: ProgramCounter_p3 PORT MAP(
		clk => clk,
		rst => rst,
		pcin => salnpc,
		pcout => salpc 
	);

NPC: ProgramCounter_p3 PORT MAP(
		clk => clk,
		rst => rst,
		pcin => saladderpc,
		pcout => salnpc 
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
		r7 => reg7
	);

SEUimm13: SEEUimm13_p3 PORT MAP(
		imm13 => imsal(12 downto 0),
		crs2SEU => salseuimm13
	);	
	
RF: RegisterFile_p3 PORT MAP(
		rst => rst,
		rs1 => nrs1win,
		rs2 => nrs2win,
		rd => nrdwin,
		WriteEnableRF => werfuc,
		dwr => dwr,
		crs1 => crs1rf,
		crs2 => crs2rf,
		crd => crdrf
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
	
MUXimm13: MUXimm13_p3 PORT MAP(
		SEUimm13 => salseuimm13,
		crs2 => crs2rf,
		i => imsal(13),
		op2alu => crs2muximm13
	);
	
ALU: ALU_p3 PORT MAP(
		opalu => aluopuc,
		crs1 => crs1rf,
		crs2 => crs2muximm13,
		carry => carrypsr,
		salu => ralu
	);

PSR: PSR_p3 PORT MAP(
		clk => clk,
		rst => rst,
		ncwp => ncwpwin,
		nzvc => nzvcpsrm,
		cwp => cwpsr,
		icc => iccpsr,
		c => carrypsr 
	);
	
PSRM: PSRModifier_p3 PORT MAP(
		rst => rst,
		aluop => aluopuc,
		crs1 => crs1rf,
		crs2alu => crs2muximm13,
		salu => ralu,
		nzvc => nzvcpsrm
	);
	
DM: DataMemory_p3 PORT MAP(
		clk => clk,
		rst => rst,
		WrEnMem => WEMUC,
		RdEnMem => REMUC,
		crd => crdrf,
		salu => ralu,
		Datatomem => datomem 
	);
	
MUXRFS: MUXRFSource_p3 PORT MAP(
		Ralu => ralu,
		DatoMem => datomem,
		PC => salpc,
		RFSource => RFSUC,
		DWR => dwr
	);
	
cwpc <= cwpsr;
ncwpc <= ncwpwin;
nzvcc <= iccpsr;
resultado <= dwr ;
op3 <= imsal(24 downto 19);
rs1c <= imsal(18 downto 14);
rs2c <= imsal(4 downto 0);
rdc <= imsal(29 downto 25);
nrs1c <= nrs1win;
nrs2c <= nrs2win;
nrdc <= nrdwin;
end Behavioral;

