-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram4K is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(11 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;
architecture vm8 of Ram4K is
component Ram512 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 8 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
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
signal address0: STD_LOGIC_VECTOR(8 downto 0);
signal address1: STD_LOGIC_VECTOR(2 downto 0); 

begin

address0 <= address(8 downto 0);
address1 <= address(11 downto 9);

dmux: DMux8Way port map (load,address1,loadList(0),loadList(1),loadList(2),loadList(3),loadList(4),loadList(5),loadList(6),loadList(7));

p0: Ram512 port map (clock,input,loadList(0),address0,vm0);
p1: Ram512 port map (clock,input,loadList(1),address0,vm1);
p2: Ram512 port map (clock,input,loadList(2),address0,vm2);
p3: Ram512 port map (clock,input,loadList(3),address0,vm3);
p4: Ram512 port map (clock,input,loadList(4),address0,vm4);
p5: Ram512 port map (clock,input,loadList(5),address0,vm5);
p6: Ram512 port map (clock,input,loadList(6),address0,vm6);
p7: Ram512 port map (clock,input,loadList(7),address0,vm7);

mux16: Mux8Way16 port map (vm0,vm1,vm2,vm3,vm4,vm5,vm6,vm7,address1,output);

end architecture;

