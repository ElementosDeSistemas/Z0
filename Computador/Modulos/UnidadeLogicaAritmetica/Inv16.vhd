library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Inv16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		sel   : in STD_LOGIC;
    q:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch_inv16 of Inv16 is
begin
process(a,sel)
begin

  if (sel = '1') then
    q <= not a;
  else
    q <= a;
  end if;
end process;
End arch_inv16;
