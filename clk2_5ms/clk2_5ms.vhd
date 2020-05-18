-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: mmartinez
-- 
-- Create Date:    13/11/2016 22:21:01
-- Project Name:   clk2_5ms
-- Module Name:    clk2_5ms.vhd
-- Description:
--
-- Additional Comments:
-- Circuito que genera pulsos con un periodo de aprox 2.5 ms
-- usando un valor de precarga calculado a partir de
-- LOAD = (tiempo deseado)* (2^Resolucion del contador)/Tiempo OV 
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity clk2_5ms is
   port(
	clr, mclk: in std_logic;
	q2_5m: out std_logic
 );
end clk2_5ms;

architecture arq1 of clk2_5ms is

component clkdiv is
   port(
	mclk: in std_logic;
	clr: in std_logic;
	clk_8: out std_logic
   );
end component;

component Counter8AsincClear is
   port( 
	clock: in std_logic;
	reset: in std_logic;
	q    : out std_logic_vector( 7 downto 0)
);
end component;

signal x : std_logic;
signal dat: std_logic_vector(7 downto 0);
begin

u0: clkdiv port map(mclk,clr,x);
u1: Counter8AsincClear port map(x,clr,dat);
q2_5m <= dat(7);
end arq1;
