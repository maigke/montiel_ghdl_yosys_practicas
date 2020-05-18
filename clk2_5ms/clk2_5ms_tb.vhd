-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: mmartinez
-- 
-- Create Date:    13/11/2016 22:21:01
-- Project Name:   clk2_5ms
-- Module Name:    clk2_5ms_tb.vhd
-- Description:
--
-- Additional Comments:
-- Reloj de 2.5 ms
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity clk2_5ms_tb is
end    clk2_5ms_tb;

architecture Testbench of clk2_5ms_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component clk2_5ms
   port(
	clr, mclk: in std_logic;
	q2_5m: out std_logic
 );
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: clk2_5ms use entity WORK.clk2_5ms(arq1);

   -- Inputs/Outputs
   -- signal ...
signal clr,q2_5m : std_logic;
   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
   signal   mclk : std_logic := '0';
   constant clock_period : time := 20 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: clk2_5ms port map ( clr,mclk, q2_5m);

-- Clock process (uncomment if needed)
-- Descomentar en caso de requerir senial de reloj
-- Sustituir <clock> por el nombre de puerto apropiado
clock_process : process
begin
   while (clock_on) loop
      mclk <= '0';
      wait for clock_period/2;
      mclk <= '1';
      wait for clock_period/2;
   end loop;
   --assert (false) report ("Finished") severity error;
   -- Wait forever
   wait;
 end process;

-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 100 ns
   	clr <= '0';
	wait for 100 ns;

   ---------------------------------------------------------
   -- insert stimulus here
   ---------------------------------------------------------

   -- Test case 1
   -- ... Asignaciones a seniales de entrada ...
   clr <= '1';
   wait for 100 ns;
   -- assert (<condition>) report "Error case 1" severity error;

   -- Test case 2
   -- ... Asignaciones a seniales de entrada ...
   wait for 100 ns;
   -- assert (<condition>) report "Error case 2" severity error;

   -- Stop clock
--   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;