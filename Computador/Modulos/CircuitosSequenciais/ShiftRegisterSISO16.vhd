-- Elementos de Sistemas
-- by Luciano Soares
-- ShiftRegisterSISO16.vhd

-- shift register tipo SISO de 16 bits:
-- out[t+15] = in[t], out[t+16] = in[t+1], out[t+17] = in[t+2], ...

Library ieee; 
use ieee.std_logic_1164.all;
  
entity ShiftRegisterSISO16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		output: out STD_LOGIC
	);
end entity;
Component FlipFlopD is
	port(
		clock:  in std_logic;
		d:      in std_logic;
		clear:  in std_logic;
		preset: in std_logic;
		q:     out std_logic
	);
end component;

architecture siso16 of ShiftRegisterSISO16 is
signal saida: STD_LOGIC_VECTOR(0 to 15);

begin

u0: FlipFlopD port map (clock, input, '1', '1', saida(0))
u1: FlipFlopD port map (clock, saida(0), '1', '1', saida(1))
u2: FlipFlopD port map (clock, saida(1), '1', '1', saida(2))
u3: FlipFlopD port map (clock, saida(2), '1', '1', saida(3))
u4: FlipFlopD port map (clock, saida(3), '1', '1', saida(4))
u5: FlipFlopD port map (clock, saida(4), '1', '1', saida(5))
u6: FlipFlopD port map (clock, saida(5), '1', '1', saida(6))
u7: FlipFlopD port map (clock, saida(6), '1', '1', saida(7))
u8: FlipFlopD port map (clock, saida(7), '1', '1', saida(8))
u9: FlipFlopD port map (clock, saida(8), '1', '1', saida(9))
u10: FlipFlopD port map (clock, saida(9), '1', '1', saida(10))
u11: FlipFlopD port map (clock, saida(10), '1', '1', saida(11))
u12: FlipFlopD port map (clock, saida(11), '1', '1', saida(12))
u13: FlipFlopD port map (clock, saida(12), '1', '1', saida(13))
u14: FlipFlopD port map (clock, saida(13), '1', '1', saida(14))
u15: FlipFlopD port map (clock, saida(14), '1', '1', saida(15))

output <= saida(15)

end architecture;

