----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:38:14 11/09/2014 
-- Design Name: 
-- Module Name:    fullseq - Behavioral 
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

entity fullseq is
    Port ( clk : in  STD_LOGIC;
           INI : in  STD_LOGIC;
           EN  : in  STD_LOGIC;
           B   : in  STD_LOGIC_VECTOR (7 downto 0);
           Q   : out  STD_LOGIC_VECTOR (7 downto 0));
end fullseq;

architecture Behavioral of fullseq is

component seq 
    Port ( clk : in  STD_LOGIC;
           GEN : in  STD_LOGIC;
           INI : in  STD_LOGIC;
           B   : in  STD_LOGIC_VECTOR(3 downto 0);
           Qo  : out  STD_LOGIC_VECTOR(3 downto 0));
end component;


signal G1,G0 : std_logic;
signal Qo : std_logic_vector (7 downto 0);

begin

G1 <= (Qo(4) xnor Qo(0)) and EN;
G0 <= (Qo(4) xor Qo(0)) and EN;

seq_h : seq port map(
               GEN => G1,
					clk => clk,
					INI => INI,
					B => B(7 downto 4),
					Qo => Qo(7 downto 4) 
			);
			
seq_l : seq port map(
               GEN => G0,
					clk => clk,
					INI => INI,
					B => B(3 downto 0),
					Qo => Qo(3 downto 0)
			);
			
Q <= Qo;			

end Behavioral;

