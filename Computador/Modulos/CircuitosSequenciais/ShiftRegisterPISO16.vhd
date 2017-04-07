-- Elementos de Sistemas
-- by Luciano Soares
-- ShiftRegisterPISO16.vhd

-- shift register tipo PISO de 16 bits:
-- If shift == 0 then carrega dados da entrada (input)
-- Senão a saída (output) vai emitindo bit a bit o valor do registrar interno
-- ou seja, a cada pulso de clock: output = input[0], output = input[1], output = input[2], ...
-- os outros bits necessário para preencher o espaço que abriu no shift podem ser preenchidos com 0


Library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegisterPISO16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		shift:   in STD_LOGIC;
		output: out STD_LOGIC
	);
end entity;
architecture piso16 of ShiftRegisterPISO16 is

signal w01, w02, w03, w04, w05, w06, w07, w08, w09, w10, w11, w12, w13, w14,
w15, w16, w17,w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30,
w31,load: STD_LOGIC;

component FlipFlopD
	port(
		clock:  in std_logic;
		d:      in std_logic;
		clear:  in std_logic;
		preset: in std_logic;
		q:     out std_logic
	);
end component;

component Mux2way
		port (
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC);
end component;

begin
	load <= not shift;
	p01: Mux2way port map ('0',input(00),load,w01);
	p02: FlipFlopD port map (clock,w01,'1', '1',w02);
	p03: Mux2way port map (w02,input(01),load,w03);
	p04: FlipFlopD port map (clock,w03,'1', '1',w04);
	p05: Mux2way port map (w04,input(02),load,w05);
	p06: FlipFlopD port map (clock,w05,'1', '1',w06);
	p07: Mux2way port map (w06,input(03),load,w07);
	p08: FlipFlopD port map (clock,w07,'1','1',w08);
	p09: Mux2way port map (w08,input(04),load,w09);
	p10: FlipFlopD port map (clock,w09,'1','1',w10);
	p11: Mux2way port map (w10,input(05),load,w11);
	p12: FlipFlopD port map (clock,w11,'1','1',w12);
	p13: Mux2way port map (w12,input(06),load,w13);
	p14: FlipFlopD port map (clock,w13,'1','1',w14);
	p15: Mux2way port map (w14,input(07),load,w15);
	p16: FlipFlopD port map (clock,w15,'1','1',w16);
	p17: Mux2way port map (w16,input(08),load,w17);
	p18: FlipFlopD port map (clock,w17,'1','1',w18);
	p19: Mux2way port map (w18,input(09),load,w19);
	p20: FlipFlopD port map (clock,w19,'1','1',w20);
	p21: Mux2way port map (w20,input(10),load,w21);
	p22: FlipFlopD port map (clock,w21,'1','1',w22);
	p23: Mux2way port map (w22,input(11),load,w23);
	p24: FlipFlopD port map (clock,w23,'1','1',w24);
	p25: Mux2way port map (w24,input(12),load,w25);
	p26: FlipFlopD port map (clock,w25,'1','1',w26);
	p27: Mux2way port map (w26,input(13),load,w27);
	p28: FlipFlopD port map (clock,w27,'1','1',w28);
	p29: Mux2way port map (w28,input(14),load,w29);
	p30: FlipFlopD port map (clock,w29,'1','1',w30);
	p31: Mux2way port map (w30,input(15),load,w31);
	p32: FlipFlopD port map (clock,w31,'1','1',output);
end architecture;
