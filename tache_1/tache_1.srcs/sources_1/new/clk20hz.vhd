-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ClkDiv_20 is
	port(clk10M,reset:in std_logic;
    	 clk20: out std_logic:='0');
end ClkDiv_20;

architecture behav of ClkDiv_20 is

signal cpt:std_logic_vector(18 downto 0):="0000000000000000000";
signal buff:std_logic:='0';
begin


process(clk10M,reset)

    begin
    if reset='0' then
       cpt<=(others=>'0');
       buff <= '0';
    elsif rising_edge(clk10M) then
       cpt<= cpt+1;
    
        if cpt = 500000 then
            buff <= not buff;
        end if;  

    end if;
    
    end process;
    
    clk20 <= buff;
end behav;
