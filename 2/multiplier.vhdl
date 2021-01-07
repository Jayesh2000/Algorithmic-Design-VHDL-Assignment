library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity multiplier is
   port (reset,Start,clk: in std_logic;
         a,b: in std_logic_vector(7 downto 0);
         Output: out std_logic_vector(15 downto 0);
			c : out std_logic_vector(0 downto 0));
end entity;



architecture Behave of multiplier is
   -- Q
   type FsmState is (IDLE, WORKS, DONES);
   signal fsm_state: FsmState;

   -- R
   signal R: std_logic_vector(15 downto 0);
	signal T: std_logic_vector(6 downto 0);
	signal Count: std_logic_vector(2 downto 0);

   
begin

  process(reset,clk, fsm_state, a, b, Start,R,T,Count)
    
    variable next_fsm_state_var: FsmState;
    variable R_var: std_logic_vector(15 downto 0);
	 variable T_var: std_logic_vector(6 downto 0);
	 variable Count_var: std_logic_vector(2 downto 0);
	 variable done_var: std_logic_vector(0 downto 0);
  begin
    
    next_fsm_state_var := fsm_state;
    R_var := R;
	 T_var := T;
	 Count_var := Count;
	 done_var := "0";

  
    case fsm_state is
       when IDLE => 
            if (Start = '1') then
                  
		R_var(15) := '0';
		if (b(0) = '1') then
			R_var(14 downto 7) := a(7 downto 0);
		else
			R_var(14 downto 7) := "00000000";
		end if;
		R_var(6 downto 0) := "0000000";
		T_var(6 downto 0) := b(7 downto 1);
		Count_var(2 downto 0) := "000";
		next_fsm_state_var := WORKS;
	    else
		next_fsm_state_var := IDLE;
                  
            end if;
       when WORKS => 
            if (unsigned(Count) < 7) then
		if (T(0) = '1') then
			R_var(15 downto 7) := std_logic_vector(to_unsigned(to_integer(unsigned(R(15 downto 8))), 9) + to_unsigned(to_integer(unsigned(a)), 9));
		else
			R_var(15 downto 7) := std_logic_vector(to_unsigned(to_integer(unsigned(R(15 downto 8))), 9)) ;
		end if;
		R_var(6 downto 0) := R(7 downto 1);
		T_var(0) := T(1);
		T_var(1) := T(2);
		T_var(2) := T(3);
		T_var(3) := T(4);
		T_var(4) := T(5);
		T_var(5) := T(6);
		T_var(6) := '0';
		Count_var(2 downto 0) := std_logic_vector(unsigned(Count(2 downto 0)) + 1);
                next_fsm_state_var := WORKS;
	    else
		next_fsm_state_var := DONES;
		done_var := "1";
		
		
                
            end if;
       when DONES => 
            next_fsm_state_var := IDLE;
				Count_var := "000";
    end case;

    -- Done is an output of the FSM
    

    -- update state, registers.
    if(clk'event and clk='1') then
		c <= done_var;
        if(reset = '1') then
           fsm_state <= IDLE;
			  R <= "0000000000000000";
			  T <= "0000000";
			  Count <= "000";
			  Output <= "0000000000000000";
        elsif (not(Count ="111")) then
           fsm_state <= next_fsm_state_var;
			  R <= R_var;
			  T <= T_var;
			  Count <= Count_var;
			else 
			  fsm_state <= next_fsm_state_var;
			  Output <= R;
			  T <= T_var;
			  Count <= Count_var;
			  
	  
        end if;
    end if;
  end process;

end Behave;
