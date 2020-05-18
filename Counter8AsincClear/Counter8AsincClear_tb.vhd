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
-- synopsys para sacar los datos, en su lugar se usan las librerias 
-- to_unsigned( count 'length);
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para signed, unsigned

entity Counter8AsincClear_tb is
end    Counter8AsincClear_tb;

architecture Testbench of Counter8AsincClear_tb is

   -- Component Declaration for the Unit Under Test (UUT)
   component Counter8AsincClear
      port( 
	clock: in std_logic;
	reset: in std_logic;
	q    : out std_logic_vector( 7 downto 0)
	--q : out integer range 0 to 255
);
   end component;

   -- Select an architecture if needed (default is last one analyzed).
   --for uut: Counter8AsíncClear use entity WORK.Counter8AsíncClear(arq1);

   -- Inputs/Outputs
   -- signal ...
--signal clk: std_logic;
signal reset : std_logic;
signal q : std_logic_vector( 7 downto 0);
--signal q : integer range 0 to 255;
   -- Clock (uncomment if needed)
   -- Sustituir <clock> por el nombre de puerto apropiado
   signal   clock : std_logic := '0';
   constant clock_period : time := 10240 ns;
   signal   clock_on : boolean := true;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: Counter8AsincClear port map (clock, reset, q);

-- Clock process (uncomment if needed)
-- Descomentar en caso de requerir senial de reloj
-- Sustituir <clock> por el nombre de puerto apropiado
clock_process : process
begin
   while (clock_on) loop
      clock <= '0';
      wait for clock_period/2;
      clock <= '1';
      wait for clock_period/2;
   end loop;
--   --assert (false) report ("Finished") severity error;
--   -- Wait forever
   wait;
 end process;

-- Stimulus process
stim_proc: process
begin
   -- hold reset state for 10 ns
   reset <= '0';
   wait for 10 ns;

   ---------------------------------------------------------
   -- insert stimulus here
   ---------------------------------------------------------

   -- Test case 1
   -- ... Asignaciones a seniales de entrada ...
   reset <= '1';
   wait for 500 ns;
   -- assert (<condition>) report "Error case 1" severity error;

   -- Test case 2
   -- ... Asignaciones a seniales de entrada ...
  -- wait for 10 ns;
    --assert (<condition>) report "Error case 2" severity error;
   --reset <= '0';
   -- Stop clock
--   clock_on <= false;
   -- Wait forever
   wait;

end process;

end Testbench;
