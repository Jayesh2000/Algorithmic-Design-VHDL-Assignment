library ieee;
use ieee.std_logic_1164.all;

entity DUT is
	port(input_vector:in std_logic_vector(18 downto 0);
		  output_vector:out std_logic_vector(16 downto 0)
		  );
end entity;

architecture dut_wrap of DUT is
component multiplier is
   port (reset,Start,clk: in std_logic;
         a,b: in std_logic_vector(7 downto 0);
         Output: out std_logic_vector(15 downto 0);
			c: out std_logic_vector(0 downto 0));
end component;

	  
begin
add_instance: multiplier
port map(
          Start  => input_vector(17),
          reset  => input_vector(18),
	  	  clk  => input_vector(16),
          a(0)  => input_vector(8),
          a(1)  => input_vector(9),
          a(2)  => input_vector(10),
          a(3)  => input_vector(11),
          a(4)  => input_vector(12),
          a(5)  => input_vector(13),
          a(6)  => input_vector(14),
          a(7)  => input_vector(15),
          b(0)  => input_vector(0),
          b(1)  => input_vector(1),
          b(2)  => input_vector(2),
          b(3)  => input_vector(3),
          b(4)  => input_vector(4),
          b(5)  => input_vector(5),
          b(6)  => input_vector(6),
          b(7)  => input_vector(7),

				
          Output(0)  => output_vector(0),
          Output(1)  => output_vector(1),
          Output(2)  => output_vector(2),
          Output(3)  => output_vector(3),
          Output(4)  => output_vector(4),
          Output(5)  => output_vector(5),
          Output(6)  => output_vector(6),
          Output(7)  => output_vector(7),
          Output(8)  => output_vector(8),
          Output(9)  => output_vector(9),
          Output(10)  => output_vector(10),
          Output(11)  => output_vector(11),
          Output(12)  => output_vector(12),
          Output(13)  => output_vector(13),
          Output(14)  => output_vector(14),
          Output(15)  => output_vector(15),
			 c(0) => output_vector(16)
);
end dut_wrap;
