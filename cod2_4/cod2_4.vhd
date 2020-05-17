-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: miguel
-- 
-- Create Date:    09/11/2015 10:50:42
-- Project Name:   cod2_4
-- Module Name:    cod2_4.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity cod2_4 is
   port(
	Y_L : out std_logic_vector(3 downto 0);
	I : in std_logic_vector(1 downto 0);
	en: in std_logic
 );
end cod2_4;

architecture arq1 of cod2_4 is
begin
	Y_L(0) <= not(en and not I(1) and not I(0));
	Y_L(1) <= not(en and not I(1) and  I(0));
	Y_L(2) <= not(en and  I(1) and not I(0));
	Y_L(3) <= not(en and  I(1) and  I(0));
end arq1;
