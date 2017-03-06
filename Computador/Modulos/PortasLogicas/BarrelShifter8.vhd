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

		if (dir ='0') and (size = "000") then
				q <= a(7 downto 0); 
	   elsif (dir ='0') and (size = "001") then
				q <= a(6 downto 0) & a(7); 
		elsif (dir ='0') and (size = "010") then
				q <= a(5 downto 0) & a(7 downto 6); 
		elsif (dir ='0') and (size = "011") then
				q <= a(4 downto 0) & a(7 downto 5); 
		elsif (dir ='0') and (size = "100") then
				q <= a(3 downto 0) & a(7 downto 4); 
		elsif (dir ='0') and (size = "101") then
				q <= a(2 downto 0) & a(7 downto 3); 
		elsif (dir ='0') and (size = "110") then
				q <= a(1 downto 0) & a(7 downto 2); 
		elsif (dir ='0') and (size = "111") then
				q <= a(7 downto 2) & a(3 downto 2);	
		
		elsif (dir ='0') and (size = "000") then
				q <= a(0 to 7); 
	   elsif (dir ='0') and (size = "001") then
				q <= a(7) & a(0 to 6); 
		elsif (dir ='0') and (size = "010") then
				q <= a(7 downto 6) & a(0 to 5); 
		elsif (dir ='0') and (size = "011") then
				q <= a(7 downto 5) & a(0 to 4); 
		elsif (dir ='0') and (size = "100") then
				q <= a(7 downto 4) & a(0 to 3); 
		elsif (dir ='0') and (size = "101") then
				q <= a(7 downto 3) & a(0 to 2); 
		elsif (dir ='0') and (size = "110") then
				q <= a(7 downto 2) & a(0 to 1); 
		elsif (dir ='0') and (size = "111") then
				q <= a(7 downto 2) & a(3 downto 2);
		end if;
end process;
end arch_BarrelShifter8;
 						
