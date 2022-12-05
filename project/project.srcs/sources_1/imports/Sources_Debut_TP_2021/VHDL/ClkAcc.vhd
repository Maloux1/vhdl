----------------------------------------------------------------------------------
-- Company: UPMC
-- Engineer: Julien Denoulet
-- 
-- Diviseur d'Horloge : 100 MHz --> 25 MHz et 25 Hz
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ClkAcc is
    Port ( clk100,reset : in  STD_LOGIC;	-- Horloge 100 Mhz et Reset Asynchrone
			  clk_acc: out STD_LOGIC);			-- Horloge 25 Hz (pour Traiter les Commandes de l'Accéléromètre)
end ClkAcc;

architecture Behavioral of ClkAcc is
signal CPT: std_logic_vector(20 downto 0);
signal clk_tmp: std_logic;
begin
Clk_Acc <= clk_tmp;

process(clk100,reset)
	begin
		if reset = '0' then 
			clk_tmp <= '0';
			CPT <= (others => '0');
		elsif rising_edge(clk100) then
			CPT <= CPT + 1;
			if (CPT = 1999999) then
				CPT <= (others => '0');
				clk_tmp <= not clk_tmp;
			end if;
		end if;
    end process;
end Behavioral;
