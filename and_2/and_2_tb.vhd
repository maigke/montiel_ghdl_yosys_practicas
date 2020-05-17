-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: mmartinez
-- 
-- Create Date:    02/10/2017 17:48:20
-- Project Name:   and_2
-- Module Name:    and_2_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity and_2_tb is
end    and_2_tb;

architecture Testbench of and_2_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component and_2
   port(
	a,b : in std_logic;
	c : out std_logic
	 );
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: and_2 use entity WORK.and_2(arq1);

   -- Inputs/Outputs
   -- signal ...
signal a,b,c : std_logic;
   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
--   signal   <clock> : std_logic := '0';
--   constant clock_period : time := 50 ns;
--   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: and_2 port map (a,b,c);
stim_proc: process
begin
   -- hold reset state for 100 ns
   wait for 100 ns;
a<= '0'; b<= '1'; wait for 100 ns;
a<= '1'; b <= '1'; wait for 100 ns;
a <= '1'; b <= '0'; wait for 100 ns;
a <= '0'; b <= '1'; wait for 100 ns;
a <= '1'; b <= '1'; wait for 100 ns;
a <= '0'; b <= '0'; wait for 100 ns;
   wait;

end process;

end Testbench;
