--Division program
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all; -- Imports the standard textio package.
-- Defines a design entity, without any ports.

entity division is
	port (	clk,reset,start: in std_logic_vector(0 downto 0);
		a,b: in std_logic_vector(9 downto 0);
		done : out std_logic_vector(0 downto 0);
		q: out std_logic_vector(9 downto 0)
	);
end entity division;


architecture behaviour of division is

type rtlState is (rst,decr);
signal rtl_state: rtlState;
--signal start: std_logic_vector(0 downto 0);
signal done1: std_logic_vector(0 downto 0);
signal a1,b1,q1 : std_logic_vector(9 downto 0);

begin

	process(clk,reset,rtl_state,start,a1,b1)

	variable next_rtl_state_var: rtlState;
	variable next_a_var: std_logic_vector(9 downto 0);
	variable next_q_var: std_logic_vector(9 downto 0);
	variable next_b_var: std_logic_vector(9 downto 0);
	variable done_var : std_logic_vector(0 downto 0);

	begin
		next_rtl_state_var := rtl_state;
		next_a_var := "0000000000";
		next_q_var := "0000000000";
		next_b_var := "0000000000";
		done_var := "0";

		case rtl_state is
			when rst =>
				if(start = "1") then
					next_rtl_state_var := decr;
					next_a_var := a;
					next_q_var := "0000000000";
					next_b_var := b;
				end if;

			when decr =>
				if(signed(a1) >= signed(b1)) then
					next_rtl_state_var := decr;
					next_a_var := std_logic_vector(to_signed(to_integer(signed(a1)), 10) - to_signed(to_integer(signed(b1)), 10));
					next_b_var := b1;
					next_q_var := std_logic_vector(to_signed(to_integer(signed(q1)), 10) + "0000000001");

				else
					next_rtl_state_var := rst;
					done_var := "1";
					next_q_var := q1;					
				end if;
			when others => null;
		end case;

		if(clk'event and clk = "1") then
			done1<=done_var;
			q1 <= next_q_var;
			a1 <= next_a_var;
			b1 <= next_b_var;
			q<=q1;
			done<=done1;
			if(reset = "1") then
				rtl_state <= rst;
			else
				rtl_state <= next_rtl_state_var;
			end if;

		end if;

	end process;
	
end behaviour;
