library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.numeric_std.all;
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
		if (dir = '0') then
			if (size = "000") then
				q <= std_logic_vector(unsigned(a) sll 0);
			elsif (size = "001") then
				q <= std_logic_vector(unsigned(a) sll 1);
			elsif (size = "010") then
				q <= std_logic_vector(unsigned(a) sll 3);
			elsif (size = "011") then
				q <= std_logic_vector(unsigned(a) sll 4);
			elsif (size = "100") then
				q <= std_logic_vector(unsigned(a) sll 5);
			elsif (size = "101") then
				q <= std_logic_vector(unsigned(a) sll 6);
			elsif (size = "110") then
				q <= std_logic_vector(unsigned(a) sll 7);
			elsif (size = "111") then
				q <= std_logic_vector(unsigned(a) sll 8);
			end if;
		else 
			if (size = "000") then
				q <= std_logic_vector(unsigned(a) srl 0);
			elsif (size = "001") then
				q <= std_logic_vector(unsigned(a) srl 1);
			elsif (size = "010") then
				q <= std_logic_vector(unsigned(a) srl 3);
			elsif (size = "011") then
				q <= std_logic_vector(unsigned(a) srl 4);
			elsif (size = "100") then
				q <= std_logic_vector(unsigned(a) srl 5);
			elsif (size = "101") then
				q <= std_logic_vector(unsigned(a) srl 6);
			elsif (size = "110") then
				q <= std_logic_vector(unsigned(a) srl 7);
			elsif (size = "111") then
				q <= std_logic_vector(unsigned(a) srl 8);
			end if;
		end if;
	end process;
end architecture;
