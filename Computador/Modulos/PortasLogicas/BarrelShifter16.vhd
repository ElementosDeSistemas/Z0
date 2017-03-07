library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;
architecture a_barrelshifter16 of BarrelShifter16 is
begin 
			q <= a when (size = "000") else
		  a(14 downto 0) & a(15) when (dir = '0' and size = "001") else
		  a(13 downto 0) & a(15 downto 14) when (dir = '0' and size = "010") else
	     a(12 downto 0) & a(15 downto 13) when (dir = '0' and size = "011") else
		  a(11 downto 0) & a(15 downto 12) when (dir = '0' and size = "100") else
		  a(0) & a(15 downto 1)  when (dir = '1' and size = "001") else
		  a(1) & a(0) & a(15 downto 2) when (dir = '1' and size = "010") else
	     a(2) & a(1) & a(0) & a(15 downto 3)  when (dir = '1' and size = "011") else
	     a(3) & a(2) & a(1) & a(0) & a(15 downto 4)  when (dir = '1' and size = "100");
	--ignorar a gambiarra nojenta nos shifts para a direita :)
	--#ajudaluciano 
end architecture;