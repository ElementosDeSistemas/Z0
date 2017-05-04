library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Zerador16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		sel   : in STD_LOGIC;
    q:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch_zerador16 of Zerador16 is

Begin
    q <= not sel and a;
End arch_zerador16;
