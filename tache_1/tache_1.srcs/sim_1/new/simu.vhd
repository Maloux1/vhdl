----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2022 17:39:44
-- Design Name: 
-- Module Name: simu - Behavioral
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

entity simu is
--  Port ( );
end simu;

architecture Behavioral of simu is
signal clk,reset : std_logic:= '0';
signal RED_Out,GREEN_Out,BLUE_Out : std_logic_vector (3 downto 0):="0000";
begin

    MOVING_COLORS: entity work.Moving_Colors
    port map(
    clk=>clk,
    reset=>reset,
    RED_out=>RED_out,
    GREEN_out=>GREEN_out,
    BLUE_out=> BLUE_out);
    
    reset<= '1','0' after 30 ns;
    clk<= not clk after 1 ns; 
end Behavioral;
