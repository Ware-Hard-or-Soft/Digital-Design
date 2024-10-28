library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity frequency_divider is
    Port ( clk : in  STD_LOGIC;
           clk_in0 : out  STD_LOGIC );
end frequency_divider;

architecture Behavioral of frequency_divider is
    signal count0 : std_logic_vector(15 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if (clk'event and clk = '1') then
            if count0 = 47999 then
                count0 <= (others => '0');
                clk_in0 <= not clk_in0;
            else
                count0 <= count0 + 1;
            end if;
        end if;
    end process;
end Behavioral;