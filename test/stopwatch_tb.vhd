library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stopwatch_tb is
end stopwatch_tb;

architecture sim of stopwatch_tb is
    signal clk_i, clr_i, start_in : std_logic := '0';
    signal sm : std_logic_vector(6 downto 0);
    signal xuan : std_logic_vector(7 downto 0);

begin
    -- Instantiate the mbdc (top module)
    uut: entity work.mbdc
        port map (
            clk_i => clk_i,
            clr_i => clr_i,
            start_in => start_in,
            sm => sm,
            xuan => xuan
        );

    -- Clock process to generate clock signal
    clk_proc: process
    begin
        clk_i <= '0';
        wait for 5 ns;
        clk_i <= '1';
        wait for 5 ns;
    end process clk_proc;

    -- Test sequence
    stimulus: process
    begin
        start_in <= '1';   -- Start the stopwatch
        wait for 100 ns;
        start_in <= '0';   -- Stop the stopwatch
        wait for 50 ns;
        clr_i <= '1';      -- Reset the stopwatch
        wait for 50 ns;
        clr_i <= '0';
        wait;
    end process stimulus;
end sim;
