-- Elementos de Sistemas
-- by Luciano Soares
-- ShiftRegisterPISO16.vhd

-- shift register tipo PISO de 16 bits:
-- If load == 1 then load in  <---------------------- ??????
-- out = in[0], out = in[1], out = in[2], ...
-- os outros bits podem ser preenchidos com 0

Library ieee; 
use ieee.std_logic_1164.all;

entity ShiftRegisterPISO16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		shift:   in STD_LOGIC;
		output: out STD_LOGIC
	);
end entity;

architecture piso16 of ShiftRegisterPISO16 is

signal tmp: std_logic_vector(15 downto 0);


begin

process (clock,input,shift)
 begin
     if (shift = '1') then
     tmp <= input;
	  
   elsif rising_edge(clock) and clock='1' then
		if (shift = '0') then
			tmp <= '0' & tmp(15 downto 1);
   end if;
	end if;
 end process;

output <= tmp(0);
 
end architecture;
