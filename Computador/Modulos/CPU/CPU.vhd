
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CPU is
    port(
        clock:	     in  STD_LOGIC;                        -- sinal de clock para CPU
        inM:         in  STD_LOGIC_VECTOR(15 downto 0);    -- dados lidos da memória RAM
        instruction: in  STD_LOGIC_VECTOR(15 downto 0);    -- instrução (dados) vindos da memória ROM
        reset:       in  STD_LOGIC;                        -- reinicia toda a CPU (inclusive o Program Counter)
        outM:        out STD_LOGIC_VECTOR(15 downto 0);    -- dados para gravar na memória RAM
        writeM:      out STD_LOGIC;                        -- faz a memória RAM gravar dados da entrada
        addressM:    out STD_LOGIC_VECTOR(14 downto 0);    -- envia endereço para a memória RAM
        pcout:       out STD_LOGIC_VECTOR(14 downto 0)     -- endereço para ser enviado a memória ROM
  );
end entity;

architecture arch_CPU of CPU is

--COMPONENTES

component ALU is
  	port (
  			x,y:   in STD_LOGIC_VECTOR(15 downto 0); -- entradas de dados da ALU
  			zx:    in STD_LOGIC;                     -- zera a entrada x
  			nx:    in STD_LOGIC;                     -- inverte a entrada x
  			zy:    in STD_LOGIC;                     -- zera a entrada y
  			ny:    in STD_LOGIC;                     -- inverte a entrada y
  			f:     in STD_LOGIC;                     -- se 0 calcula x & y, senão x + y
  			no:    in STD_LOGIC;                     -- inverte o valor da saída
  			zr:    out STD_LOGIC;                    -- setado se saída igual a zero
  			ng:    out STD_LOGIC;                    -- setado se saída é negativa
  			saida: out STD_LOGIC_VECTOR(15 downto 0) -- saída de dados da ALU
  	);
end component;


component Mux16 is
  	port (
  			a:   in  STD_LOGIC_VECTOR(15 downto 0);
  			b:   in  STD_LOGIC_VECTOR(15 downto 0);
  			sel: in  STD_LOGIC;
  			q:   out STD_LOGIC_VECTOR(15 downto 0));
end component;


component Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
end component;


component PC is
    port(
        clock     : in  STD_LOGIC;
		increment : in  STD_LOGIC;
		load      : in  STD_LOGIC;
		reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(14 downto 0)
    );
end component;

component ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(15 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e ng(se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre instrução e ALU para reg. A
		muxAM_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. A e Mem. RAM para ALU
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadM, loadPC : out STD_LOGIC                      -- sinais de load do reg. A, reg. D, Mem. RAM e Program Counter
    );
end component;

--Signals
signal muxALUI_A,muxAM_ALU,loadA, loadD, loadM, loadPC: std_logic;
signal saida_mux_a,saida_mux_b,outM,saida_d, address, saida_alu,saida_a: STD_LOGIC_VECTOR(15 downto 0);
signal zx,nx,zy,ny,f,no,zr,ng: std_logic;


begin

t0: ControlUnit port map (instruction, zr,ng, muxALUI_A,muxAM_ALU,zx,nx,zy,ny,f,no,loadA, loadD, writeM, loadPC);
a1: Mux16 port map (saida_alu, instruction, muxALUI_A, saida_mux_a); --MUX 1
a2: Register16 port map (clock, saida_mux_a, loadA, saida_a); -- REGISTRADOR A
a3: Mux16 port map (saida_a, inM, muxAM_ALU, saida_mux_b); -- MUX 2
a4: Register16 port map (clock, saida_alu, loadD, saida_d); -- REGISTRADOR D
a5: ALU port map (saida_d,saida_mux_b,zx,nx,zy,ny,f,no,zr,ng,saida_alu);
a6: PC port map (clock,'1',loadPC,reset,saida_a,pcout);


writeM <= loadM;
outM <= saida_alu;
addressM <= saida_a(14 downto 0);







end arch_CPU;
