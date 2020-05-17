-------------------------------------------------------------------------------
--
-- Company : Instituto Tecnológico Superior de Teziutlán
--			 CBTis 44 Lic. Vicente Lombardo Toledano
-- Engineer: Miguel Montiel Martínez
-- 
-- Create Date:    02/10/2017 17:48:19
-- Project Name:   and_2
-- Module Name:    and_2.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity and_2 is
   port(
	a,b : in std_logic;
	c : out std_logic
	 );
end and_2;

architecture arq1 of and_2 is
begin
 c <= a and b;
end arq1;
