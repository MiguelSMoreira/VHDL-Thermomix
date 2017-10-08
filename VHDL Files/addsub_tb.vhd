--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:40:28 11/27/2014
-- Design Name:   
-- Module Name:   C:/Users/Pedro/Downloads/TempLinux/Lab4-2014/addsub_tb.vhd
-- Project Name:  Lab4-2014
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: addsub_sat
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
 
ENTITY addsub_tb IS
END addsub_tb;
 
ARCHITECTURE behavior OF addsub_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT addsub_sat
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         op : IN  std_logic;
         en : IN  std_logic;
         S : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal op : std_logic := '0';
   signal en : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	signal clk: std_logic;
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: addsub_sat PORT MAP (
          A => A,
          op => op,
          en => en,
          S => S
        );

   -- Clock process definitions
   process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	A <= S when rising_edge(clk);

   -- Stimulus process
   stim_proc: process
   begin	
		en <= '0';
		op <= '0';
      wait for clk_period*300;
		en <= '0';
		op <= '1';
      wait for clk_period*300;
		en <= '1';
		op <= '0';
      wait for clk_period*300;
		en <= '1';
		op <= '1';
      wait for clk_period*300;
   end process;

END;
