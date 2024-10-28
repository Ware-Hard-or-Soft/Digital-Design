----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:36:31 10/24/2016 
-- Design Name: 
-- Module Name:    mbdc - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Top-level module integrating debounce, counter, storage, 
--              control logic, clock divider, and display components to create
--              a functional stopwatch design.
--
--=========================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity mbdc is
    Port ( clk_i : in  STD_LOGIC := '0';
           clr_i : in  STD_LOGIC := '0';
           start_in : in  STD_LOGIC;
           sm : out  STD_LOGIC_VECTOR (6 downto 0);
           xuan : out  STD_LOGIC_VECTOR (7 downto 0));
end mbdc;

architecture Behavioral of mbdc is
    signal msec0, msec1, sec0, sec1, min0, min1 : std_logic_vector(3 downto 0);
    signal stored_msec0, stored_msec1, stored_sec0, stored_sec1, stored_min0, stored_min1 : std_logic_vector(3 downto 0);
    signal clk_in0_1k : std_logic;
    signal clr_out, start_out : std_logic;
    signal enable_control, reset_control, normal_control : std_logic;

    COMPONENT frequency_divider
        PORT (
            clk : IN std_logic;
            clk_in0 : OUT std_logic
        );
    END COMPONENT;

    COMPONENT debounce
        PORT (
            clk : in STD_LOGIC;
            k_in1 : in STD_LOGIC;
            k_in0 : in STD_LOGIC;
            k_out0 : out STD_LOGIC;
            k_out1 : out STD_LOGIC
        );
    END COMPONENT;

    COMPONENT counter
        PORT (
            clk_in0 : in STD_LOGIC;
            clr_in : in STD_LOGIC;
            en : in STD_LOGIC;
            msec0 : out STD_LOGIC_VECTOR(3 downto 0);
            msec1 : out STD_LOGIC_VECTOR(3 downto 0);
            sec0 : out STD_LOGIC_VECTOR(3 downto 0);
            sec1 : out STD_LOGIC_VECTOR(3 downto 0);
            min0 : out STD_LOGIC_VECTOR(3 downto 0);
            min1 : out STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT;

    COMPONENT storage
        PORT (
            msec0 : in STD_LOGIC_VECTOR(3 downto 0);
            msec1 : in STD_LOGIC_VECTOR(3 downto 0);
            sec0 : in STD_LOGIC_VECTOR(3 downto 0);
            sec1 : in STD_LOGIC_VECTOR(3 downto 0);
            min0 : in STD_LOGIC_VECTOR(3 downto 0);
            min1 : in STD_LOGIC_VECTOR(3 downto 0);
            en1 : in STD_LOGIC;
            out_msec0 : out STD_LOGIC_VECTOR(3 downto 0);
            out_msec1 : out STD_LOGIC_VECTOR(3 downto 0);
            out_sec0 : out STD_LOGIC_VECTOR(3 downto 0);
            out_sec1 : out STD_LOGIC_VECTOR(3 downto 0);
            out_min0 : out STD_LOGIC_VECTOR(3 downto 0);
            out_min1 : out STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT;

    COMPONENT controller
        PORT (
            clk_in0 : in STD_LOGIC;
            r : in STD_LOGIC;
            sta : in STD_LOGIC;
            kclr : out STD_LOGIC;
            kgen : out STD_LOGIC;
            knorm : out STD_LOGIC
        );
    END COMPONENT;

    COMPONENT display
        PORT (
            msec0 : in STD_LOGIC_VECTOR(3 downto 0);
            msec1 : in STD_LOGIC_VECTOR(3 downto 0);
            sec0 : in STD_LOGIC_VECTOR(3 downto 0);
            sec1 : in STD_LOGIC_VECTOR(3 downto 0);
            min0 : in STD_LOGIC_VECTOR(3 downto 0);
            min1 : in STD_LOGIC_VECTOR(3 downto 0);
            clk_in0 : in STD_LOGIC;
            qdxs : out STD_LOGIC_VECTOR(6 downto 0);
            wx : out STD_LOGIC_VECTOR(7 downto 0)
        );
    END COMPONENT;

begin
    Inst_frequency_divider: frequency_divider
        PORT MAP (
            clk => clk_i,
            clk_in0 => clk_in0_1k
        );

    Inst_debounce: debounce
        PORT MAP (
            clk => clk_in0_1k,
            k_in0 => start_in,
            k_in1 => clr_i,
            k_out0 => start_out,
            k_out1 => clr_out
        );

    Inst_counter: counter
        PORT MAP (
            clk_in0 => clk_in0_1k,
            clr_in => reset_control,
            en => enable_control,
            msec0 => msec0,
            msec1 => msec1,
            sec0 => sec0,
            sec1 => sec1,
            min0 => min0,
            min1 => min1
        );

    Inst_storage: storage
        PORT MAP (
            msec0 => msec0,
            msec1 => msec1,
            sec0 => sec0,
            sec1 => sec1,
            min0 => min0,
            min1 => min1,
            en1 => normal_control,
            out_msec0 => stored_msec0,
            out_msec1 => stored_msec1,
            out_sec0 => stored_sec0,
            out_sec1 => stored_sec1,
            out_min0 => stored_min0,
            out_min1 => stored_min1
        );

    Inst_display: display
        PORT MAP (
            clk_in0 => clk_in0_1k,
            msec0 => stored_msec0,
            msec1 => stored_msec1,
            sec0 => stored_sec0,
            sec1 => stored_sec1,
            min0 => stored_min0,
            min1 => stored_min1,
            qdxs => sm,
            wx => xuan
        );

    Inst_controller: controller
        PORT MAP (
            clk_in0 => clk_in0_1k,
            r => clr_out,
            sta => start_out,
            kclr => reset_control,
            kgen => enable_control,
            knorm => normal_control
        );

end Behavioral;
