-- Elementos de Sistemas
-- by Luciano Soares
-- Ram8.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;
architecture ram8 of Ram8 is

Component Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
end component;
signal index : STD_LOGIC_VECTOR(7 downto 0);
begin

p1: Register16 port map (clock,input(15 downto 0),index(0),output(15 downto 0));
p2: Register16 port map (clock,input(15 downto 0),load,output(15 downto 0));

end architecture;