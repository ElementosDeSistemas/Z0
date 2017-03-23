-- Elementos de Sistemas
-- by Luciano Soares
-- ShiftRegisterPISO16.vhd

-- shift register tipo PISO de 16 bits:
-- If shift == 1 then shift in
-- out = in[0], out = in[1], out = in[2], ...
-- os outros bits podem ser preenchidos com 0

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
w15, w16, w17,w18, w19, w20, w21, w22, w23, w24, w25, 
w26, w27, w28, w29, w30, w31: STD_LOGIC;

-- enter para melhor vizualizaçao

component BinaryDigit
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		load:    in STD_LOGIC;
		output: out STD_LOGIC
	);
end component;

component Mux2way
		port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC);
end component;
--ajudaLuciano com os flip e os flop
begin

	p01: Mux2way port map ('0',input(00),shift,w01); 
	p02: BinaryDigit port map (clock,w01,shift,w02);
	p03: Mux2way port map (w02,input(01),shift,w03);
	p04: BinaryDigit port map (clock,w03,shift,w04);
	p05: Mux2way port map (w04,input(02),shift,w05);
	p06: BinaryDigit port map (clock,w05,shift,w06);
	p07: Mux2way port map (w06,input(03),shift,w07);
	p08: BinaryDigit port map (clock,w07,shift,w08);
	p09: Mux2way port map (w08,input(04),shift,w09);
	p10: BinaryDigit port map (clock,w09,shift,w10);
	p11: Mux2way port map (w10,input(05),shift,w11);
	p12: BinaryDigit port map (clock,w11,shift,w12);
	p13: Mux2way port map (w12,input(06),shift,w13);
	p14: BinaryDigit port map (clock,w13,shift,w14);
	p15: Mux2way port map (w14,input(07),shift,w15);
	p16: BinaryDigit port map (clock,w15,shift,w16);
	p17: Mux2way port map (w16,input(08),shift,w17);
	p18: BinaryDigit port map (clock,w17,shift,w18);
	p19: Mux2way port map (w18,input(09),shift,w19);
	p20: BinaryDigit port map (clock,w19,shift,w20);
	p21: Mux2way port map (w20,input(10),shift,w21);
	p22: BinaryDigit port map (clock,w21,shift,w22);
	p23: Mux2way port map (w22,input(11),shift,w23);
	p24: BinaryDigit port map (clock,w23,shift,w24);
	p25: Mux2way port map (w24,input(12),shift,w25);
	p26: BinaryDigit port map (clock,w25,shift,w26);
	p27: Mux2way port map (w26,input(13),shift,w27);
	p28: BinaryDigit port map (clock,w27,shift,w28);
	p29: Mux2way port map (w28,input(14),shift,w29);
	p30: BinaryDigit port map (clock,w29,shift,w30);
	p31: Mux2way port map (w30,input(15),shift,w31);
	p32: BinaryDigit port map (clock,w31,shift,output);

end architecture;