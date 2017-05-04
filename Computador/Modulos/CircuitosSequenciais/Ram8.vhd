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
architecture vm8 of Ram8 is
component Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
end component;

component Mux8Way16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			c:   in  STD_LOGIC_VECTOR(15 downto 0);
			d:   in  STD_LOGIC_VECTOR(15 downto 0);
			e:   in  STD_LOGIC_VECTOR(15 downto 0);
			f:   in  STD_LOGIC_VECTOR(15 downto 0);
			g:   in  STD_LOGIC_VECTOR(15 downto 0);
			h:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end component;

component DMux8Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
end component;

signal loadList: STD_LOGIC_VECTOR(7 downto 0);
signal vm0,vm1,vm2,vm3,vm4,vm5,vm6,vm7: STD_LOGIC_VECTOR(15 downto 0);

begin

dmux: DMux8Way port map (load,address,loadList(0),loadList(1),loadList(2),loadList(3),loadList(4),loadList(5),loadList(6),loadList(7));

p0: Register16 port map (clock,input,loadList(0),vm0);
p1: Register16 port map (clock,input,loadList(1),vm1);
p2: Register16 port map (clock,input,loadList(2),vm2);
p3: Register16 port map (clock,input,loadList(3),vm3);
p4: Register16 port map (clock,input,loadList(4),vm4);
p5: Register16 port map (clock,input,loadList(5),vm5);
p6: Register16 port map (clock,input,loadList(6),vm6);
p7: Register16 port map (clock,input,loadList(7),vm7);

mux16: Mux8Way16 port map (vm0,vm1,vm2,vm3,vm4,vm5,vm6,vm7,address,output);

end architecture;
