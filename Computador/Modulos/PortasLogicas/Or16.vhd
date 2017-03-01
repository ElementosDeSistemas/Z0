library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Or16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;
architecture arch_Or16 of Or16 is 
begin
process (a,b)
	begin
		for I in 0 to 16 loop
			if (a(I) = b(I)) then
				q(I) <= a(I);
			else
				q(I) <= '1';
			end if;
		end loop;
end process;
end architecture;