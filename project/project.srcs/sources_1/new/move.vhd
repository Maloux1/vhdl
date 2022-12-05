----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2022 16:15:00
-- Design Name: 
-- Module Name: move - Behavioral
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

entity move is
    Port ( clk, reset : in std_logic;
           Qa : in STD_LOGIC;
           Qb : in STD_LOGIC;
           Rot_left : out STD_LOGIC := '0';
           Rot_right : out STD_LOGIC := '0');
--           old_a,old_b : out STD_LOGIC);
end move;

architecture Behavioral of move is
signal etat: std_logic_vector(2 downto 0):="000";

begin
    process(clk,reset)
    begin
        if reset='0' then etat<=(others => '0');
        elsif rising_edge (clk) then
            case(etat) is
            when "000" =>
                if (Qa and not(Qb)) = '1' then
                    etat <= "001";
                elsif (Qa and Qb) = '1' then
                    etat <= "010";
                end if;
                Rot_left <= '0';
                Rot_right <= '0';
            when "001" =>
                Rot_left <= '1';
                Rot_right <= '0';
                etat <= "011";
            when "010" =>
                Rot_left <= '0';
                Rot_right <= '1';
                etat <= "011";
            when "011" =>
                if (not(Qa) and Qb) = '1' then
                    etat <= "100";
                elsif (not(Qa) and not(Qb)) = '1' then
                    etat <= "101";
                end if;
                Rot_left <= '0';
                Rot_right <= '0';
            when "100" =>
                Rot_left <= '1';
                Rot_right <= '0';
                etat <= "000";
            when "101" =>
                Rot_left <= '0';
                Rot_right <= '1';
                etat <= "000";
            when others => null;
            end case;
        end if;
    end process;

end Behavioral;
