library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or16 is
	port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;


architecture arch_or16 of Or16 is
	begin
	q(0) <= or a(0);
	q(1) <= or a(1);
	q(2) <= or a(2);
	q(3) <= or a(3);
	q(4) <= or a(4);
	q(5) <= or a(5);
	q(6) <= or a(6);
	q(7) <= or a(7);
	q(8) <= or a(8);
	q(9) <= or a(9);
	q(10) <= or a(10);
	q(11) <= or a(11);
	q(12) <= or a(12);
	q(13) <= or a(13);
	q(14) <= or a(14);
	q(15) <= or a(15);
end arch_or16;
