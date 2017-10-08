--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:27:56 11/27/2014
-- Design Name:   
-- Module Name:   C:/Users/Pedro/Downloads/TempLinux/Lab4-2014/contagem_tb.vhd
-- Project Name:  Lab4-2014
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: contagem_tempo
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
 
ENTITY contagem_tb IS
END contagem_tb;
 
ARCHITECTURE behavior OF contagem_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contagem_tempo
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         up : IN  std_logic;
         down : IN  std_logic;
         start : IN  std_logic;
         t1 : IN  std_logic;
         state : IN  std_logic_vector(1 downto 0);
         tini : OUT  std_logic_vector(7 downto 0);
         tcount : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal up : std_logic := '0';
   signal down : std_logic := '0';
   signal start : std_logic := '0';
   signal t1 : std_logic := '0';
   signal state : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal tini : std_logic_vector(7 downto 0);
   signal tcount : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contagem_tempo PORT MAP (
          clk => clk,
          reset => reset,
          up => up,
          down => down,
          start => start,
          t1 => t1,
          state => state,
          tini => tini,
          tcount => tcount
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
		state <= "00";
      -- hold reset state for 100 ns.
      wait for clk_period*9/4;
		reset <= '0';
		wait for clk_period;
		up    <= '1';
		down  <= '0';
      wait for clk_period*300;
		up    <= '0';
		down  <= '1';
      wait for clk_period*300;
		up    <= '1';
		down  <= '1';
      wait for clk_period*10;
		down  <= '0';
      wait for clk_period*20;
		start <= '1';
      wait for clk_period*3;
		state <= "01";
		up    <= '0';
      wait for clk_period*10;
		state <= "10";
      wait for clk_period*10;
		state <= "11";
		wait for clk_period*10;
		up    <= '1';
		down  <= '0';
		wait for clk_period*10;
		up    <= '0';
		down  <= '1';
		wait for clk_period*10;
		up    <= '1';
		down  <= '1';
      wait for clk_period*10;
		state <= "01";
		start <= '0';
		down  <= '0';
      wait for clk_period*20;
		t1 <= '1';
      wait for clk_period;
		t1 <= '0';
      wait for clk_period*20;
		t1 <= '1';
      wait for clk_period;
		t1 <= '0';
      wait for clk_period*20;
		t1 <= '1';
      wait for clk_period;
		t1 <= '0';
      wait for clk_period*20;
		t1 <= '1';
      wait for clk_period;
		t1 <= '0';
      wait for clk_period*20;
		t1 <= '1';
      wait for clk_period;
		t1 <= '0';
      wait for clk_period*20;
		t1 <= '1';
      wait for clk_period;
		t1 <= '0';
      wait for clk_period*20;
   end process;

END;
