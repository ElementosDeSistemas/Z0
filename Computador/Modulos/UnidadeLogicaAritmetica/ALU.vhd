-- Unidade Lógica Aritmética (ULA)
-- Recebe dois valores de 16bits e
-- calcula uma das seguintes funções:
-- X+y, x-y, y-x, 0, 1, -1, x, y, -x, -y,
-- X+1, y+1, x-1, y-1, x&y, x|y
-- De acordo com os 6 bits de entrada denotados:
-- zx, nx, zy, ny, f, no.
-- Também calcula duas saídas de 1 bit:
-- Se a saída == 0, zr é definida como 1, senão 0;
-- Se a saída <0, ng é definida como 1, senão 0.
-- a ULA opera sobre os valores, da seguinte forma:
-- se (zx == 1) então x = 0
-- se (nx == 1) então x =! X
-- se (zy == 1) então y = 0
-- se (ny == 1) então y =! Y
-- se (f == 1) então saída = x + y
-- se (f == 0) então saída = x & y
-- se (no == 1) então saída = !saída
-- se (out == 0) então zr = 1
-- se (out <0) então ng = 1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
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
end entity;


architecture arch_alu of ALU is

-- COMPONENTES
	component Zerador16 is
		port(
			a   :  in STD_LOGIC_VECTOR(15 downto 0);
			sel   : in STD_LOGIC;
			q:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Inv16 is
		port(
			a   :  in STD_LOGIC_VECTOR(15 downto 0);
			sel   : in STD_LOGIC;
	    q:  out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component Add16 is
		port(
			a   :  in STD_LOGIC_VECTOR(15 downto 0);
			b   :  in STD_LOGIC_VECTOR(15 downto 0);
			q   : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component And16 is
		port (
				a:   in  STD_LOGIC_VECTOR(15 downto 0);
				b:   in  STD_LOGIC_VECTOR(15 downto 0);
				q:   out STD_LOGIC_VECTOR(15 downto 0));

	end component;

	component Mux16 is
		port (
				a:   in  STD_LOGIC_VECTOR(15 downto 0);
				b:   in  STD_LOGIC_VECTOR(15 downto 0);
				sel: in  STD_LOGIC;
				q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;


signal saida_nx, saida_ny, saida_zx, saida_zy, saida_mux, saida_and, saida_add: STD_LOGIC_VECTOR(15 downto 0);

signal saida2: STD_LOGIC_VECTOR(15 downto 0);

begin

		u: Zerador16 port map(x, zx, saida_zx);
		u2: Inv16 port map(saida_zx, nx, saida_nx);

		i: Zerador16 port map(y, zy, saida_zy);
		i2: Inv16 port map(saida_zy, ny, saida_ny);

		a: Add16 port map(saida_nx, saida_ny, saida_add);
		a2: And16 port map(saida_nx, saida_ny, saida_and);
		a3: Mux16 port map(saida_and, saida_add, f, saida_mux);

		a4: Inv16 port map(saida_mux, no, saida2);
		zr <= '1' when (saida2="0000000000000000") else
			  '0';
		ng <= '1' when (saida2(15) = '1') else	
				'0';
				
		saida <= saida2;
				
end arch_alu;
