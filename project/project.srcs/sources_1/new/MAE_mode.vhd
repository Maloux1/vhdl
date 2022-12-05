----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2022 17:00:15
-- Design Name: 
-- Module Name: MAE_mode - Behavioral
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

entity MAE_mode is
    Port ( Pause_Rqt : in STD_LOGIC;
           Endframe : in STD_LOGIC;
           Lost : in STD_LOGIC;
           No_Brick : in STD_LOGIC;
           Clk25 : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Fin_Tempo_Pause : in STD_LOGIC;
           Timer_Lost : in STD_LOGIC_VECTOR (5 downto 0);
           Brick_Win : out STD_LOGIC;
           Pause : out STD_LOGIC;
           RAZ_Tempo_Pause : out STD_LOGIC;
           Update_Tempo_Pause : out STD_LOGIC;
           Load_Timer_Lost : out STD_LOGIC;
           Update_Timer_Lost : out STD_LOGIC);
end MAE_mode;

architecture Behavioral of MAE_mode is
signal etat: std_logic_vector(2 downto 0):="000";
signal timer_lost_or: std_logic := '0';

begin
timer_lost_or <= Timer_Lost(0) or Timer_Lost(1) or Timer_Lost(2) or Timer_Lost(3) or Timer_Lost(4) or Timer_Lost(5);
    process(clk25,reset)
    begin
        if reset='0' then etat<=(others => '0');
        elsif rising_edge (clk25) then
            case(etat) is
            when "000" => 
                 RAZ_Tempo_Pause<= '1';
                 Brick_Win<='0';
                 Pause <='1';
                 Update_Tempo_Pause <='0';
                 Load_Timer_Lost <='0';
                 Update_Timer_Lost <='0';
                 if endframe = '1' and timer_lost_or = '1' then
                    etat <= "100";
                 elsif timer_lost_or = '0' and Pause_rqt = '1' then
                    etat<="001";
                 else etat<= "000";
                 end if;
            when "001" =>
            
                 RAZ_Tempo_Pause<= '0';
                 Brick_Win<='0';
                 Pause <='0';
                 Update_Tempo_Pause <='1';
                 Load_Timer_Lost <='0';
                 Update_Timer_Lost <='0';
                 if Fin_Tempo_Pause = '1' then
                    etat<="010";
                 else etat<= "001";
                 end if;
                
            when "010" =>
            
                 RAZ_Tempo_Pause<= '1';
                 Brick_Win<='0';
                 Pause <='0';
                 Update_Tempo_Pause <='0';
                 Load_Timer_Lost <='0';
                 Update_Timer_Lost <='0';
                 if No_Brick = '1' then
                    etat<="110";
                 elsif Lost = '1' then
                    etat<="111";
                 elsif Pause_rqt = '1' then
                    etat<="011";
                 else etat<= "010";
                 end if;
            when "011" =>
                 RAZ_Tempo_Pause<= '0';
                 Brick_Win<='0';
                 Pause <='1';
                 Update_Tempo_Pause <='1';
                 Load_Timer_Lost <='0';
                 Update_Timer_Lost <='0';
                 if Fin_tempo_pause = '1' then
                    etat<="000";
                 else etat<= "011";
                 end if;
             when "100" =>
                 RAZ_Tempo_Pause<= '0';
                 Brick_Win<='0';
                 Pause <='1';
                 Update_Tempo_Pause <='0';
                 Load_Timer_Lost <='0';
                 Update_Timer_Lost <='1';
                 etat<="000";
--              when "101" =>
--                 RAZ_Tempo_Pause<= '0';
--                 Brick_Win<='0';
--                 Pause <='1';
--                 Update_Tempo_Pause <='0';
--                 Load_Timer_Lost <='0';
--                 Update_Timer_Lost <='1';
               
--                 etat<="100";
               when "110" =>
                 RAZ_Tempo_Pause<= '0';
                 Brick_Win<='1';
                 Pause <='0';
                 Update_Tempo_Pause <='0';
                 Load_Timer_Lost <='0';
                 Update_Timer_Lost <='0';
                 
                 etat<="110";
               when "111" =>
                 RAZ_Tempo_Pause<= '0';
                 Brick_Win<='0';
                 Pause <='1';
                 Update_Tempo_Pause <='0';
                 Load_Timer_Lost <='1';
                 Update_Timer_Lost <='0';
               
                 etat<="000";
              
            when others => null;
            end case;
        end if;
    end process;
end Behavioral;
