----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:50:01 11/09/2014 
-- Design Name: 
-- Module Name:    seq - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seq is
    Port ( clk : in  STD_LOGIC;
           GEN : in  STD_LOGIC;
           INI : in  STD_LOGIC;
           B   : in  STD_LOGIC_VECTOR(3 downto 0);
           Qo  : out  STD_LOGIC_VECTOR(3 downto 0));
end seq;

architecture Behavioral of seq is

signal set,reset,Q,X : std_logic_vector(3 downto 0);
signal EQ,enable : std_logic;

begin

set <= B and (3 downto 0 => INI);
reset <= (not B) and (3 downto 0 => INI);

EQ <= Q(0) xnor Q(3);
X(3) <= not Q(3);
X(2 downto 0) <= Q(3 downto 1);

enable <= GEN and EQ;

ugen : for i in 0 to 2 generate
Q(i) <= '0' when reset(i)='1' else
        '1' when set(i)='1' else
		  X(i) when rising_edge(clk) and GEN='1';
end generate;

Q(3) <= '0' when reset(3)='1' else
        '1' when set(3)='1' else
		  X(3) when rising_edge(clk) and enable='1';
		
Qo <= Q;

end Behavioral;

