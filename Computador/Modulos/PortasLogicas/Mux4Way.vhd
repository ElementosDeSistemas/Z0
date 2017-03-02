library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4Way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q:   out STD_LOGIC);
end entity;
	
	architecture Run of Mux4Way is
		begin
	   q <= a when a = "00" else 
			b when a = "01" else 
			c when a = "10" else 
			d when a = "11";

	end architecture;