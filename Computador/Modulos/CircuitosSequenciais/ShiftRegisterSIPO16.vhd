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

signal saida_0,saida_1,saida_2: STD_LOGIC_VECTOR(15 downto 0);

begin
	w : port map FlipFlopD(clock,input,'1','1',saida_0);
	w1 : port map FlipFlopD(clock,saida_0,'1','1',saida_1);
	w2 : port map FlipFlopD(clock,saida_1,'1','1',saida_2);
	w3 : port map FlipFlopD(clock,saida_2,'1','1',q);

end architecture;