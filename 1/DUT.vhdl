library ieee;
use ieee.std_logic_1164.all;

entity DUT is
	port(input_vector:in std_logic_vector(22 downto 0);
		  output_vector:out std_logic_vector(10 downto 0)
		  );
end entity;

architecture dut_wrap of DUT is
component division is
	port (	clk,reset,start: in std_logic_vector(0 downto 0);
		a,b: in std_logic_vector(9 downto 0);
		done : out std_logic_vector(0 downto 0);
		q: out std_logic_vector(9 downto 0)
	);
end component;

	  
begin
add_instance: division
port map(

	  	  b(0)  => input_vector(0),
          b(1)  => input_vector(1),
          b(2)  => input_vector(2),
          b(3)  => input_vector(3),
          b(4)  => input_vector(4),
          b(5)  => input_vector(5),
          b(6)  => input_vector(6),
          b(7)  => input_vector(7),
          b(8)  => input_vector(8),
          b(9)  => input_vector(9),
          a(0)  => input_vector(10),
          a(1)  => input_vector(11),
          a(2)  => input_vector(12),
          a(3)  => input_vector(13),
          a(4)  => input_vector(14),
          a(5)  => input_vector(15),
          a(6)  => input_vector(16),
          a(7)  => input_vector(17),
          a(8)  => input_vector(18),
          a(9)  => input_vector(19),
          start(0)  => input_vector(20),
          reset(0)  => input_vector(21),
          clk(0)  => input_vector(22),			
          q(0)  => output_vector(0),
          q(1)  => output_vector(1),
          q(2)  => output_vector(2),
          q(3)  => output_vector(3),
          q(4)  => output_vector(4),
          q(5)  => output_vector(5),
          q(6)  => output_vector(6),
          q(7)  => output_vector(7),
          q(8)  => output_vector(8),
          q(9)  => output_vector(9),
		  done(0) => output_vector(10)
);
end dut_wrap;
