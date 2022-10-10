-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ClkDiv is
	port(clk100,reset:in std_logic;
    	 clk25: out std_logic:='0');
end ClkDiv;

architecture behav of Clkdiv is

signal cpt:std_logic:='0';
begin

process(clk100,reset)

    begin
    
    if reset='0' then
       cpt<='0';
    elsif rising_edge(clk100) then
       cpt<=not cpt;
    
    if cpt = '1' then
       clk25<= not clk25;
    end if;  

    end if;
    
    end process;
    
end behav;
