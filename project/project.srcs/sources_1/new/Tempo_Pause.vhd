----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2022 17:39:11
-- Design Name: 
-- Module Name: Tempo_Pause - Behavioral
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

entity Tempo_Pause is
    Port ( RAZ_Tempo_Pause : in STD_LOGIC;
           Update_Tempo_Pause : in STD_LOGIC;
           Fin_Tempo_Pause : out STD_LOGIC;
           Clk25 : in STD_LOGIC;
           Reset : in STD_LOGIC);
end Tempo_Pause;

architecture Behavioral of Tempo_Pause is
signal memo: std_logic_vector(9 downto 0):= "0000000000";
signal one: std_logic :='0';
begin
one <= memo(0) and memo(1) and memo(2) and memo(3) and memo(4) and memo(5) and memo(6) and memo(7) and memo(8) and memo(9);

 process(clk25,reset)
    begin
        if reset='0' or RAZ_Tempo_Pause='1' then memo<=(others => '0');
        elsif rising_edge (clk25) then
            if Update_Tempo_Pause ='1' and not(one) ='1'then 
            memo  <= memo+1;
            end if;
        
        end if;
    end process;
Fin_Tempo_Pause<= one ;
end Behavioral;
