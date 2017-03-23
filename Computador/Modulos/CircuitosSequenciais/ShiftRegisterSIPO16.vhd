-- Elementos de Sistemas
-- by Luciano Soares
-- ShiftRegisterSIPO16.vhd

-- shift register tipo SIPO de 16 bits:
-- out[0] = in[t], out[1] = in[t+1], out[2] = in[t+2], ...

Library ieee; 
use ieee.std_logic_1164.all;
  
entity ShiftRegisterSIPO16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

-- Componentes

component FlipFlopD is
	port(
		clock:  in std_logic;
		d:      in std_logic;
		clear:  in std_logic;
		preset: in std_logic;
		q:     out std_logic
	);
end component;

architecture arch_SIPO of ShiftRegisterSIPO16 is

signal saida: STD_LOGIC_VECTOR(15 downto 0);

begin
	w : port map FlipFlopD(clock,input,'1','1',saida(0));
	w1 : port map FlipFlopD(clock,saida(0),'1','1',saida(1));
	w2 : port map FlipFlopD(clock,saida(1),'1','1',saida(2));
	w3 : port map FlipFlopD(clock,saida(2),'1','1',saida(3));
	w4 : port map FlipFlopD(clock,saida(3),'1','1',saida(4));
	w5 : port map FlipFlopD(clock,saida(4),'1','1',saida(5));
	w6 : port map FlipFlopD(clock,saida(5),'1','1',saida(6));
	w7 : port map FlipFlopD(clock,saida(6),'1','1',saida(7));
	w8: port map FlipFlopD(clock,saida(7),'1','1',saida(8));
	w9 : port map FlipFlopD(clock,saida(8),'1','1',saida(9));
	w10 : port map FlipFlopD(clock,saida(9),'1','1',saida(10));
	w11 : port map FlipFlopD(clock,saida(10),'1','1',saida(11));
	w12 : port map FlipFlopD(clock,saida(11),'1','1',saida(12));
	w13 : port map FlipFlopD(clock,saida(12),'1','1',saida(13));
	w14 : port map FlipFlopD(clock,saida(13),'1','1',saida(14));
	w15 : port map FlipFlopD(clock,saida(14),'1','1',saida(15));
	q <= saida;
	
end architecture;