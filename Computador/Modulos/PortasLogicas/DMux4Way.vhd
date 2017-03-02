library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux4Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC);
end entity;

architecture bhv of Dmux4Way is
begin
if (sel = '00') then
	q0 <= a;
elsif (sel = '01') then
	q1 <= a;
elsif (sel = '10') then
	q2 <= in_1;
elsif (sel = '11') then
	q3 <= a;
end process;
end bhv;
