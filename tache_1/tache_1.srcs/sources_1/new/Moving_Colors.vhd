----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2022 16:06:44
-- Design Name: 
-- Module Name: Moving_Colors - Behavioral
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

entity Moving_Colors is
  Port (clk100 : in std_logic;
        reset : in std_logic;
        RED_Out,GREEN_Out,BLUE_Out : out std_logic_vector (3 downto 0));
end Moving_Colors;

architecture Behavioral of Moving_Colors is
signal clock20 : std_logic;
signal red_max,blue_max,green_max : std_logic_vector(4 downto 0):= "00000";
signal red_cmd,blue_cmd,green_cmd : std_logic_vector(1 downto 0);
signal and_RED : std_logic := '0';
signal and_BLUE : std_logic := '0';
signal and_GREEN : std_logic := '0';


begin
RED_out<= red_MAX(4 downto 1);
GREEN_out<= green_MAX(4 downto 1);
BLUE_out<= blue_MAX(4 downto 1);

and_RED <= (not(red_max(0)) AND red_max(1) AND red_max(2) AND red_max(3) AND red_max(4));
and_BLUE <= (not(blue_max(0)) AND blue_max(1) AND blue_max(2) AND blue_max(3) AND blue_max(4));
and_GREEN <= (not(green_max(0)) AND green_max(1) AND green_max(2) AND green_max(3) AND green_max(4));

clock: entity work.ClkDiv_20
    Port map(clk100M => clk100,
    reset => reset,
    clk20 => clock20
);

RED_cpt: entity work.compteur_5b
    Port map(reset => reset,
    clk => clock20,
    cmd =>red_cmd,
    init => '1',
    color_out => red_max
);

GREEN_cpt: entity work.compteur_5b
    Port map(reset => reset,
    clk => clock20,
    cmd =>green_cmd,
    init => '0',
    color_out => green_max
);

BLUE_cpt: entity work.compteur_5b
    Port map(reset => reset,
    clk => clock20,
    cmd => blue_cmd,
    init => '0',
    color_out => blue_max
);

MAE: entity work.MAE
    Port Map(reset => reset,
    clk => clock20,
    MAX_RED => and_RED,
    MAX_BLUE => and_BLUE,
    MAX_GREEN => and_GREEN,
    CMD_R => red_cmd,
    CMD_B => blue_cmd,
    CMD_G => green_cmd
    );

end Behavioral;


