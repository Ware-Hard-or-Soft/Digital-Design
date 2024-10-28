library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce is
    Port ( clk : in  STD_LOGIC;
           k_in1 : in  STD_LOGIC;
           k_out0 : out  STD_LOGIC;
           k_out1 : out  STD_LOGIC );
end debounce;

architecture Behavioral of debounce is
    signal debounce_state : std_logic := '0';
begin
    process (clk)
    begin
        if rising_edge(clk) then
            debounce_state <= k_in1;
            k_out0 <= debounce_state;
            k_out1 <= debounce_state;
        end if;
    end process;
end Behavioral;
