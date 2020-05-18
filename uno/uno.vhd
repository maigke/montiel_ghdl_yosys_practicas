library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uno is
  port (led0, led1, led2, led3, led4, led5, led6, led7 : out std_logic);
end uno;

architecture test of uno is
begin

  -- Turn on the Led0
  led0 <= '0';

  -- Turn off the other leds
  (led1, led2, led3, led4, led5, led6, led7) <= std_logic_vector'("0000000");

end test;
