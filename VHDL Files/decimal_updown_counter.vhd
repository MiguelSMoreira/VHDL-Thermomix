----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:12 12/01/2014 
-- Design Name: 
-- Module Name:    decimal_updown_counter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decimal_updown_counter is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
			  op : in STD_LOGIC;
			  en : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end decimal_updown_counter;

architecture Behavioral of decimal_updown_counter is

component bcd_updown_counter
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
			  op : in STD_LOGIC;
			  en : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
			  en_next : out STD_LOGIC);
end component;

signal enable,en_out : std_logic_vector(1 downto 0);
signal saturate, saturate_down, saturate_up, is_max, is_min : std_logic;
signal Y : std_logic_vector(7 downto 0);

begin

-----------------------------------------------------------
-- generate 1 bcd_counter for each decimal digit
-----------------------------------------------------------
ugen: for i in 0 to 1 generate
	digit_i : bcd_updown_counter port map(
			A  => A(4*(i+1)-1 downto 4*i), -- for i=0 it becomes A(3:0); for i=1 it is A(7:4)
			op => op,
			en => enable(i),
			S  => Y(4*(i+1)-1 downto 4*i), -- for i=0 it becomes A(3:0); for i=1 it is A(7:4)
			en_next => en_out(i)
	);
end generate;

enable(0) <= en;
enable(1) <= en and en_out(0);
-- enable(2) <= en and en_out(1);
-- ...

-----------------------------------------------------------
-- generate saturation signals
-----------------------------------------------------------
is_max <= '1' when A=x"59" else '0'; -- and com 8 bits
is_min <= '1' when A=x"00" else '0'; -- and com 8 bits
saturate_up   <= is_max and op;
saturate_down <= is_min and (not op);

-----------------------------------------------------------
-- generate output
-----------------------------------------------------------
-- multiplexer selection signals
saturate <= saturate_up or saturate_down;

-- 8-bit 4:1 multiplexer
S <= A when saturate='1' else Y;

end Behavioral;
