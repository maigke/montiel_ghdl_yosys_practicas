-------------------------------------------------------------------------------
--
-- Company : Instituto Tecnológico Superior de Teziutlán
-- Engineer: Miguel Montiel Mtz
-- 
-- Create Date:    13/08/2015 13:53:13
-- Project Name:   Counter8AsincClear
-- Module Name:    Counter8AsincClear.vhd
-- Description: Se desarrolla un contador simple de 8 bits con
-- con clear asíncrono
-- Additional Comments: Usa solamente librerías estandar, no requiere de la libreria
-- synopsys para sacar los datos, en su lugar se usan las funciones
-- to_unsigned( count 'length);
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Counter8AsincClear is
   port( 
	clock: in std_logic;
	reset: in std_logic;
	q    : out std_logic_vector( 7 downto 0)
	--q : out integer range 0 to 255
);
end Counter8AsincClear;

architecture arq1 of Counter8AsincClear is
signal count : std_logic_vector(7 downto 0);
begin
process (clock, reset)
	--variable count : integer  range 0 to 255:=0;
	begin
		if(reset = '0') then
			count <= "00000000";
		else
			if( clock 'event and clock = '1') then
			  if count = X"F3" then
				 count <= X"00";
			  else
				 count <= std_logic_vector(unsigned(count) + 1);
			  end if;	
			end if;
		end if;
-- Asignacion de un numero entero a un std_logic_vector
	--q <= std_logic_vector(to_unsigned(count, q 'length));
	
end process;
	q <= count;
end arq1;
