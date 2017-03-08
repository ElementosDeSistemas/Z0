---- Full Adder

Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC);   -- sum e carry
end entity;
architecture arch_FullAdder of FullAdder is
component HalfAdder is
	port (
		  a,b: in STD_LOGIC;	
		  soma,vaium: out STD_LOGIC
		  );
end component;
signal t1,t2,t3: std_logic;
begin
	u1: HalfAdder port map(a, b,t1,t2);
	u2: HalfAdder port map(t1,c,soma,t3);
	vaium <= t2 or t3;
end arch_FullAdder;
