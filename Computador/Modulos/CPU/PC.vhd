-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]


--feito por Leonardo e Sabrina

library ieee;
use ieee.std_logic_1164.all;

entity PC is
    port(
        clock     : in  STD_LOGIC;
		increment : in  STD_LOGIC;
		load      : in  STD_LOGIC;
		reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(14 downto 0)
    );
end entity;
architecture arch_PC of PC is

component Not16 is 
	
	port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));

end component;

component Or16 is
	port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end component;

component Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
end component;

component Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC; -- talvez seja somente std_logic
		q   : out STD_LOGIC_VECTOR(15 downto 0) 
	); 
end component;

component Mux16 is
	port (
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end component;


signal s1: STD_LOGIC_VECTOR(15 downto 0);
signal s2: STD_LOGIC_VECTOR(15 downto 0);
signal s3: STD_LOGIC_VECTOR(15 downto 0);
signal s4: STD_LOGIC_VECTOR(15 downto 0);
signal s5: STD_LOGIC;
signal s6: STD_LOGIC;

begin

s5 <= not load;
s6 <= load or increment;
w1: Mux16 port map(input,s4,s5,s1);
w2: Mux16 port map(s1,"0000000000000000",reset,s2);
w3: Register16 port map(clock,s2,s6,s3);
w4: Add16 port map(s3,increment,s4);
output <= s3(15 downto 1);

end architecture;
