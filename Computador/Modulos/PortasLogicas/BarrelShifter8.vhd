library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifter8 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(7 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(7 downto 0));  -- output vector (shifted)
end entity;

architecture arch_BarrelShifter8 of BarrelShifter8 is
begin
process(a,dir,size)
begin
if (dir ="0") then
    q <= a(0) when size = "000"else
	 (a(0) & a(7 downto 1) when size = "001" else
	 (a(1 downto 0) & a(7 downto 2)) when size = "010" else								(a(2 downto 0) & a(7 downto 3)) when size = "011" else
	 (a(3 downto 0) & a(7 downto 4)) when size = "100" else
	 (a(4 downto 0) & a(7 downto 5)) when size = "101" else
	 (a(5 downto 0) & a(7 downto 6)) when size = "110" else
	 (a(6 downto 0) & a(7)) when size = "111";

else
 	q<= a(6 downto 0) & a(7) when size = "000" else
	a(5 downto 0) & a(7 downto 6) when size = "001" else
	a(4 downto 0) & a(7 downto 5) when size = "010" else
	a(3 downto 0) & a(7 downto 4) when size = "011" else
	a(2 downto 0) & a(7 downto 3) when size = "100" else
	a(1 downto 0) & a(7 downto 2) when size = "101" else
	a(0) & a(7 downto 1) when size = "110" else
	a(0) when size = "111";		

end if;
end process;
end arch_BarrelShifter8;
 						
