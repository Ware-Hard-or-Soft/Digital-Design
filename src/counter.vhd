library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
    Port ( clk_in0 : in  STD_LOGIC;
           clr_in : in  STD_LOGIC;
           en : in  STD_LOGIC;
           msec0, msec1, sec0, sec1, min0, min1 : out STD_LOGIC_VECTOR(3 downto 0) );
end counter;

architecture Behavioral of counter is
    signal msec, sec, min : std_logic_vector(3 downto 0);
begin
    process (clk_in0, clr_in, en)
    begin
        if clr_in = '1' then
            msec <= (others => '0');
            sec <= (others => '0');
            min <= (others => '0');
        elsif rising_edge(clk_in0) then
            if en = '1' then
                if msec = "1001" then
                    msec <= (others => '0');
                    sec <= sec + 1;
                else
                    msec <= msec + 1;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
