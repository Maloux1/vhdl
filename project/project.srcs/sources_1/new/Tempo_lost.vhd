----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.11.2022 16:30:08
-- Design Name: 
-- Module Name: Tempo_lost - Behavioral
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
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tempo_lost is
    Port ( Load_Timer_Lost : in STD_LOGIC;
           Update_Timer_Lost : in STD_LOGIC;
           Timer_Lost : out STD_LOGIC_VECTOR (5 downto 0);
           Game_Lost : out STD_LOGIC;
           Clk25 : in STD_LOGIC;
           reset : in STD_LOGIC);
end Tempo_lost;

architecture Behavioral of Tempo_lost is
signal memo: std_logic_vector(5 downto 0):= "000000";
signal zero: std_logic :='0';
begin
zero <= memo(0) or memo(1) or memo(2) or memo(3) or memo(4) or memo(5);
process(clk25,reset)
    begin
        if reset='0' then memo<=(others => '0');
        elsif rising_edge (clk25) then
            if Load_Timer_Lost='1' then memo <=(others => '1');
            elsif Update_Timer_Lost ='1' and zero ='1'then 
            memo  <= memo - 1;
            
            elsif zero = '0' then memo<="000000";
            
            end if;
        
        end if;
    end process;
GAME_LOST <= zero;
TIMER_LOST <= memo;
end Behavioral;
