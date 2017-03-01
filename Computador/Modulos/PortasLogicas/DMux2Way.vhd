library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux2Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC);
end entity;
architecture arch_DMux2Way of DMux2Way is
	begin
		process (a,sel)
			begin
				if (sel = '0') then
					q0 <= a;
					q1 <= not a;
				elsif (sel = '1') then
					q1 <= a;
					q0 <= not a;
				end if;
		end process;
end architecture;