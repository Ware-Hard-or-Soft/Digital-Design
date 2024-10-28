library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller is
    Port ( clk_in0 : in  STD_LOGIC;
           r : in  STD_LOGIC;
           sta : in  STD_LOGIC;
           kclr : out  STD_LOGIC;
           knorm : out  STD_LOGIC );
end controller;

architecture Behavioral of controller is
    signal c_com : std_logic := '1';
begin
    process (clk_in0)
    begin
        if rising_edge(clk_in0) then
            kclr <= r;
            knorm <= sta;
        end if;
    end process;
end Behavioral;
