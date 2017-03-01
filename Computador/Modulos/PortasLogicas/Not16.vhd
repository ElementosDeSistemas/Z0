library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Not16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;
architecture arch_not16 of Not16 is
begin
process (a)
	begin
	q <= not a;
end process;
end architecture;
