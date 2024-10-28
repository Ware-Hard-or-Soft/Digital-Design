library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display is
    Port ( msec0, sec0, min0 : in STD_LOGIC_VECTOR(3 downto 0);
           clk_in0 : in STD_LOGIC;
           qdxs : out STD_LOGIC_VECTOR(6 downto 0);
           wx : out STD_LOGIC_VECTOR(7 downto 0) );
end display;

architecture Behavioral of display is
begin
    process (clk_in0)
    begin
        if rising_edge(clk_in0) then
            qdxs <= msec0 & sec0 & min0;
        end if;
    end process;
end Behavioral;
