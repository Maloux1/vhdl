----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2022 16:28:26
-- Design Name: 
-- Module Name: TB_move - Behavioral
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

entity TB_move is

end TB_move;

architecture Behavioral of TB_move is
    signal Qa :  STD_LOGIC := '0';
    signal Qb :  std_logic := '0';
    signal clk :  STD_LOGIC := '0';
    signal reset : STD_LOGIC;
    signal rot_left :  STD_LOGIC;
    signal rot_right :  STD_LOGIC;
--    signal old_a,old_b : std_logic;
begin

move: entity work.move
   port map( clk, reset,Qa,Qb,rot_left,rot_right);

clk <= not clk after 5 ns;
reset <='1';
Qa <= '1' after 23 ns, '0' after 73 ns, '1' after 103 ns;
Qb <= '1' after 33 ns, '0' after 87 ns, '1' after 133 ns;


end Behavioral;
