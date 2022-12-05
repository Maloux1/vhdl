----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2022 16:22:51
-- Design Name: 
-- Module Name: compteur_5b - Behavioral
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

entity compteur_5b is
  Port (reset : in std_logic;
        clk : in std_logic;
        cmd : in std_logic_vector (1 downto 0);
        init : in std_logic;
        color_out : out std_logic_vector (4 downto 0)
  );
end compteur_5b;

architecture Behavioral of compteur_5b is
signal cpt :std_logic_vector( 4 downto 0);
begin
color_out<= cpt;
process(clk,reset)
    begin
    if reset='0' then cpt<=(others => '0');
    elsif rising_edge (clk) then
        case(cmd)is
        when "01" => cpt<=cpt+1; -- Incrementation
        when "10" => cpt<=cpt-1; -- Decrementation
        when "11" => cpt<=(others => init) ; -- Chargement //
        when "00" => NULL;
        when others => NULL;
        end case;
    end if;
end process;        
    
end Behavioral;
