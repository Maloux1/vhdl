----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2022 16:47:54
-- Design Name: 
-- Module Name: MAE - Behavioral
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

entity MAE is
Port (reset,clk,MAX : in std_logic ;
        CMD_R,CMD_B,CMD_G: out std_logic_vector(1 downto 0) 
);
end MAE;

architecture Behavioral of MAE is
signal etat: std_logic_vector(1 downto 0):="00";

begin

    process(clk,reset)
    begin
    if reset='1' then etat<=(others => '0');
    elsif rising_edge (clk) then
    
        case(etat) is
        when "00" => 
            CMD_B<=(others =>'1'); 
            CMD_G<=(others =>'1'); 
            CMD_R<=(others =>'1');
            etat<="01";
        when "01" =>
            CMD_B<="00"; 
            CMD_G<="01"; 
            CMD_R<="10";
            if MAX='1' then etat<="10"; end if;
        when "10" =>
            CMD_B<="01"; 
            CMD_G<="10"; 
            CMD_R<="00";
            if MAX='1' then etat<="11"; end if;
        when "11" =>
            CMD_B<="01"; 
            CMD_G<="10"; 
            CMD_R<="00";
            if MAX='1' then etat<="01"; end if;
        when others => null;
        end case;
    end if;
    end process;

end Behavioral;
