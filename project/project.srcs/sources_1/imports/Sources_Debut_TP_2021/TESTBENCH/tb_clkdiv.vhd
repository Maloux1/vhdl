----------------------------------------------------------------------------------
-- Company: UPMC
-- Engineer: Julien Denoulet
-- 
-- Testbench Diviseur d'Horloge
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_ClkDiv is

end TB_ClkDiv;

architecture Behavioral of TB_ClkDiv is

signal H_100MHz, RAZ: std_logic:='0';
signal H_25MHz: std_logic;
signal H_25Hz: std_logic;

begin

-- Instanciation Diviseur d'horloge
test_clk_25MHz: entity work.ClkDiv
	port map(
		clk100	=> H_100MHz,
		reset	=> RAZ,
		clk25	=> H_25MHz);
		
		-- Instanciation Diviseur d'horloge
test_clk_25Hz: entity work.ClkAcc
	port map(
		clk100	=> H_100MHz,
		reset	=> RAZ,
		clk_acc	=> H_25Hz);

-- Génération des Signaux d'Entrée
H_100MHz<=not H_100MHz after 5 ns;
RAZ <='1' after 10 ns, '0' after 50 ns, '1' after 90 ns;

end Behavioral;