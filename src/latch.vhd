library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch is
    Port ( msec0, sec0, min0 : in STD_LOGIC_VECTOR(3 downto 0);
           en1 : in  STD_LOGIC;
           out_msec0, out_sec0, out_min0 : out STD_LOGIC_VECTOR(3 downto 0) );
end latch;

architecture Behavioral of latch is
begin
    process (en1)
    begin
        if en1 = '1' then
            out_msec0 <= msec0;
            out_sec0 <= sec0;
            out_min0 <= min0;
        end if;
    end process;
end Behavioral;
