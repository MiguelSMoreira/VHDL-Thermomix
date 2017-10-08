--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:04:49 11/27/2014
-- Design Name:   
-- Module Name:   C:/Users/Pedro/Downloads/TempLinux/Lab4-2014/relogio_tb.vhd
-- Project Name:  Lab4-2014
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: timeout_ms
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
 
ENTITY relogio_tb IS
END relogio_tb;
 
ARCHITECTURE behavior OF relogio_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT relogio
    PORT(
         clk : IN  std_logic;
         hold : IN  std_logic;
         reset : IN  std_logic;
         t64 : OUT  std_logic;
         t16 : OUT  std_logic;
         t1 : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal hold : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal t64 : std_logic;
   signal t16 : std_logic;
   signal t1 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: relogio PORT MAP (
          clk => clk,
          hold => hold,
          reset => reset,
          t64 => t64,
          t16 => t16,
          t1 => t1
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
      -- hold reset state for 100 ns.
		reset <= '1';
      wait for 100 ns;	
		reset <= '0';
      wait;
   end process;

END;
