-- Elementos de Sistemas
-- by Luciano Soares
-- ShiftRegisterPISO16.vhd

-- shift register tipo PISO de 16 bits:
-- If load == 1 then load in
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

component FlipFlopD is
	port(
		clock:  in std_logic;
		d:      in std_logic;
		clear:  in std_logic;
		preset: in std_logic;
		q:     out std_logic
	);
end component;
--signal tmp: STD_LOGIC_VECTOR(15 downto 0);
-- paulo, nao sei direito escrever, apesar deu ter entendido como funciona o shifter,
-- a gramatica esta me pegando aqui, entao acho que esta beeem errado, haha
begin

p01: FlipFlopD port map (clock,input(15 downto 0),load,output(15 downto 0));
p02: FlipFlopD port map (clock,input(p01(output)),load,output(15 downto 0));
p03: FlipFlopD port map (clock,input(p02(output)),load,output(15 downto 0));
p04: FlipFlopD port map (clock,input(p03(output)),load,output(15 downto 0));
p05: FlipFlopD port map (clock,input(p04(output)),load,output(15 downto 0));
p06: FlipFlopD port map (clock,input(p05(output)),load,output(15 downto 0));
p07: FlipFlopD port map (clock,input(p06(output)),load,output(15 downto 0));
p08: FlipFlopD port map (clock,input(p07(output)),load,output(15 downto 0));
p09: FlipFlopD port map (clock,input(p08(output)),load,output(15 downto 0));
p10: FlipFlopD port map (clock,input(p09(output)),load,output(15 downto 0));
p11: FlipFlopD port map (clock,input(p10(output)),load,output(15 downto 0));
p12: FlipFlopD port map (clock,input(p11(output)),load,output(15 downto 0));
p13: FlipFlopD port map (clock,input(p12(output)),load,output(15 downto 0));
p14: FlipFlopD port map (clock,input(p13(output)),load,output(15 downto 0));
p15: FlipFlopD port map (clock,input(p14(output)),load,output(15 downto 0));
p16: FlipFlopD port map (clock,input(p15(output)),load,output(15 downto 0));

output <= p16(output);

end architecture;
