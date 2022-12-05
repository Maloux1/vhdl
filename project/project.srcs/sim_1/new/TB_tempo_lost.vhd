----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2022 16:45:54
-- Design Name: 
-- Module Name: TB_tempo_lost - Behavioral
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

entity TB_tempo_lost is
--  Port ( );
end TB_tempo_lost;

architecture Behavioral of TB_tempo_lost is
    signal Load_Timer_Lost :  STD_LOGIC := '1';
    signal Update_Timer_Lost :  std_logic := '1';
    signal Timer_Lost :  STD_LOGIC_vector(5 downto 0);
    signal Game_Lost : STD_LOGIC;
    signal clk25 :  STD_LOGIC := '0';
    signal reset :  STD_LOGIC := '1';
begin

lost: entity work.tempo_lost
   port map( Load_Timer_Lost => Load_Timer_Lost,
    Update_Timer_Lost => Update_Timer_Lost,
    Timer_Lost=> Timer_Lost,
    Game_Lost => Game_Lost,
    clk25=> clk25,
    reset=>reset);

clk25 <= not clk25 after 5 ns;
reset <='1';
Load_Timer_Lost <= '0' after 11 ns, '1' after 800 ns, '0' after 810 ns;
Update_Timer_Lost <= '1', '0' after 1000 ns, '1' after 1200 ns;

end Behavioral;

