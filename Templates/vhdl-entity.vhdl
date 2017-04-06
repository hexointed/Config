library ieee;
use ieee.std_logic_1164.all;
use work.ssa_types.all;

entity NAME is
	port ();
end NAME;

architecture impl_NAME of NAME is

begin

end impl_NAME;

  ----------------------
  -- Test bench below --
  ----------------------

library ieee;
use ieee.std_logic_1164.all;
use work.ssa_types.all;

entity NAME_tb is
end NAME_tb;

architecture behav_NAME of NAME_tb is
	component NAME
		port ();
	end component;
	
	signal i0 : ubit;
	signal i1 : ubit;
	signal i2 : ubit;
	
	signal r0 : ubit;
	signal r1 : ubit;
	
begin
	NAME_0 : NAME port map (i0, i1, i2, r0, r1);
	
	process
		type pattern_type is record
			i0, i1, i2 : ubit;
			
			r0, r1 : ubit;
		end record;
		
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array :=
			();
		
	begin
		for c in patterns'range loop
			i0 <= patterns(c).i0;
			i1 <= patterns(c).i1;
			i2 <= patterns(c).i2;
			
			wait for 2 ms;
			
			assert r0 = patterns(c).r0
				report "r0 not equal" severity error;
			
			assert r1 = patterns(c).r1
				report "r1 not equal" severity error;
			
		end loop;
		
		report "end of test" severity note;
		wait;
	end process;
end behav_NAME;
