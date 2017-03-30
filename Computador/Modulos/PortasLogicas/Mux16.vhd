library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux16 is
	port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch_mux16 of Mux16 is
	component Mux2Way is
		port (
				a:   in  STD_LOGIC;
				b:   in  STD_LOGIC;
				sel: in  STD_LOGIC;
				q:   out STD_LOGIC);
	end component;
	begin
		 u0: Mux2Way port map (a(0), b(0), sel, q(0));
	   u1: Mux2Way port map (a(1), b(1), sel, q(1));
		 u2: Mux2Way port map (a(2), b(2), sel, q(2));
		 u3: Mux2Way port map (a(3), b(3), sel, q(3));
		 u4: Mux2Way port map (a(4), b(4), sel, q(4));
		 u5: Mux2Way port map (a(5), b(5), sel, q(5));
		 u6: Mux2Way port map (a(6), b(6), sel, q(6));
		 u7: Mux2Way port map (a(7), b(7), sel, q(7));
		 u8: Mux2Way port map (a(8), b(8), sel, q(8));
		 u9: Mux2Way port map (a(9), b(9), sel, q(9));
		 u10: Mux2Way port map (a(10), b(10), sel, q(10));
		 u11: Mux2Way port map (a(11), b(11), sel, q(11));
		 u12: Mux2Way port map (a(12), b(12), sel, q(12));
		 u13: Mux2Way port map (a(13), b(13), sel, q(13));
		 u14: Mux2Way port map (a(14), b(14), sel, q(14));
		 u15: Mux2Way port map (a(15), b(15), sel, q(15));
end arch_mux16;
