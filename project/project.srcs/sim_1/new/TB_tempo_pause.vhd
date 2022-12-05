----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2022 16:17:08
-- Design Name: 
-- Module Name: TB_tempo_pause - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_tempo_pause is
--  Port ( );
end TB_tempo_pause;

architecture Behavioral of TB_tempo_pause is

signal clk25, reset, RAZ, UPDATE, FIN: std_logic:='0';

begin

test_tempo_pause: entity work.tempo_pause
	port map(
		RAZ_Tempo_Pause	=> RAZ,
		Update_Tempo_Pause => UPDATE,
		Fin_Tempo_Pause	=> FIN,
		clk25 => clk25,
		reset => reset);

clk25 <= not clk25 after 5 ns;
RAZ <='1' after 5 ns, '0' after 10 ns, '1' after 13000 ns, '0' after 13500 ns;
reset <= '1' after 1 ns;
UPDATE <= '1', '0' after 13000 ns, '1' after 20000 ns;

end Behavioral;
