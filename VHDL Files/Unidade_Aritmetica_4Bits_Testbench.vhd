--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:06:57 12/15/2014
-- Design Name:   
-- Module Name:   /home/user/Laboratorio_5/Unidade_Aritmetica_4Bits_Testbench.vhd
-- Project Name:  Laboratorio_5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unidade_Aritmetica_4bits
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY Unidade_Aritmetica_4Bits_Testbench IS
END Unidade_Aritmetica_4Bits_Testbench;
 
ARCHITECTURE behavior OF Unidade_Aritmetica_4Bits_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unidade_Aritmetica_4bits
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         EN : IN  std_logic;
         OP : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0);
   signal EN : std_logic;
   signal OP : std_logic;

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unidade_Aritmetica_4bits PORT MAP (
          A => A,
          EN => EN,
          OP => OP,
          S => S
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

	A_process :process
   begin
	   A <= "0001";
		wait;
   end process;
	
	EN_process :process
   begin
	   EN <= '0';
		wait for 10 ns;
		EN <= '0';
		wait for 10 ns;
   end process;
	
	OP_process :process
   begin
		OP <= '0';
		wait for 10 ns;
		OP <= '0';
		wait for 10 ns;
   end process;
  
END;
