--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:52:58 11/26/2014
-- Design Name:   
-- Module Name:   C:/Users/Pedro/Downloads/TempLinux/Lab4-2014/state_machine_tb.vhd
-- Project Name:  Lab4-2014
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: temporizador_state_machine
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY state_machine_tb IS
END state_machine_tb;
 
ARCHITECTURE behavior OF state_machine_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT temporizador_state_machine
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         tini : IN  std_logic_vector(7 downto 0);
         pause : IN  std_logic;
         tcount : IN  std_logic_vector(7 downto 0);
         state : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal tini : std_logic_vector(7 downto 0) := (others => '0');
   signal pause : std_logic := '0';
   signal tcount : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal state : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: temporizador_state_machine PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          tini => tini,
          pause => pause,
          tcount => tcount,
          state => state
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for clk_period*100/6;
		reset <= '0';
		wait for clk_period;
		start <= '1';
		wait for clk_period*3;
		tcount <= "01001111";
		wait for clk_period*3;
		tini <= "01001111";
		wait for clk_period*3;
		start <= '0';
		pause <= '1';
		wait for clk_period*3;
		pause <= '0';
		wait for clk_period*3;
		tcount <= x"00";
      wait;
   end process;

END;
