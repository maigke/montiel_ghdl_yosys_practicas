-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: mmartinez
-- 
-- Create Date:    13/11/2016 21:38:46
-- Project Name:   clkdiv
-- Module Name:    clkdiv.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity clkdiv is
   port(
	mclk: in std_logic;
	clr: in std_logic;
	clk_8: out std_logic
   );
end clkdiv;

architecture arq1 of clkdiv is
signal q: std_logic_vector(23 downto 0);
signal count: std_logic_vector(23 downto 0);
begin
	div: process (clr, mclk)
	--variable count: integer range 0 to 16777216;
	begin
		if(clr = '0') then
			count <= X"000000";
		elsif (mclk 'event and mclk = '1') then
			count <= std_logic_vector(unsigned(count) + 1);
		end if;
	q<=count;
	end process div;

	clk_8 <= q(8);
end arq1;
