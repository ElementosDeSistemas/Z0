library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux2Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC);
end entity;

architecture behave of DMux2Way is
begin
process (a, sel)
begin
if (sel = '0') then 
	q1 <= '0';
	q0 <= a;
else
	q0 <= '0';
	q1 <= a;
	
end if;
end process;
end behave;