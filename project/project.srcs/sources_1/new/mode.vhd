----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2022 17:32:01
-- Design Name: 
-- Module Name: mode - Behavioral
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

entity mode is
    Port ( Pause_Rqt : in STD_LOGIC;
           EndFrame : in STD_LOGIC;
           lost : in STD_LOGIC;
           No_brick : in STD_LOGIC;
           clk25 : in STD_LOGIC;
           reset : in STD_LOGIC;
           Game_Lost : out STD_LOGIC;
           Brick_Win : out STD_LOGIC;
           Pause : out STD_LOGIC);
end mode;

architecture Behavioral of mode is

signal RAZ_tempo_pause : std_logic;
signal Update_Tempo_Pause : std_logic;
signal Fin_Tempo_Pause : std_logic;
signal Load_Timer_Lost : std_logic;
signal Update_Timer_Lost : std_logic;
signal Timer_Lost : std_logic_vector(5 downto 0);


begin
MAE: entity work.MAE_mode
    port map(Pause_Rqt => pause_rqt,
    endframe => endframe,
    lost => lost,
    no_brick => no_brick,
    clk25 => clk25,
    reset => reset,
    Fin_Tempo_Pause => Fin_Tempo_Pause,
    Timer_Lost => Timer_Lost,
    Brick_Win => Brick_Win,
    Pause => Pause,
    RAZ_tempo_pause => RAZ_tempo_pause,
    Update_Tempo_Pause => Update_Tempo_Pause,
    Load_Timer_Lost => Load_Timer_Lost,
    Update_Timer_Lost => Update_Timer_Lost);
    
TL: entity work.Tempo_lost
    port map(Load_Timer_Lost => Load_Timer_Lost,
    Update_Timer_Lost => Update_Timer_Lost,
    Timer_Lost => Timer_Lost,
    Game_Lost => Game_Lost,
    clk25 => clk25,
    reset => reset);
TP: entity work.Tempo_Pause
    port map(RAZ_Tempo_Pause => RAZ_Tempo_Pause,
    Update_Tempo_Pause => Update_Tempo_Pause,
    Fin_Tempo_Pause => Fin_Tempo_Pause,
    clk25 => clk25,
    reset => reset);

end Behavioral;
