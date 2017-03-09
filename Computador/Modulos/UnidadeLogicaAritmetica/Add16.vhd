-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE; 
use IEEE.STD_LOGIC_1164.all;
  
entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0) 
	); 
end entity; 

architecture a_add16 of Add16 is

component FullAdder is
	port(
		a,b,c: 		in STD_LOGIC;
		soma, valum: out STD_LOGIC
		);
end component;

signal s: STD_LOGIC_VECTOR(14 downto 0);

Begin

	add1: FullAdder port map (a(0), b(0), '0', q(0), s(0));
	add2: FullAdder port map (a(1), b(1), s(0), q(1), s(1));
	add3: FullAdder port map (a(2), b(2), s(1), q(2), s(2));
	add4: FullAdder port map (a(3), b(3), s(2), q(3), s(3));
	add5: FullAdder port map (a(4), b(4), s(3), q(4), s(4));
	add6: FullAdder port map (a(5), b(5), s(4), q(5), s(5));
	add7: FullAdder port map (a(6), b(6), s(5), q(6), s(6));
	add8: FullAdder port map (a(7), b(7), s(6), q(7), s(7));
	add9: FullAdder port map (a(8), b(8), s(7), q(8), s(8));
	add10: FullAdder port map (a(9), b(9), s(8), q(9), s(9));
	add11: FullAdder port map (a(10), b(10), s(9), q(10), s(10));
	add12: FullAdder port map (a(11), b(11), s(10), q(11), s(11));
	add13: FullAdder port map (a(12), b(12), s(11), q(12), s(12));
	add14: FullAdder port map (a(13), b(13), s(12), q(13), s(13));
	add15: FullAdder port map (a(14), b(14), s(13), q(14), s(14));
	add16: FullAdder port map (a(15), b(15), s(14), q(15), s(15));
	

End a_add16;