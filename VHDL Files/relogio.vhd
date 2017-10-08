----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:17:40 11/26/2014 
-- Design Name: 
-- Module Name:    timeout_ms - Behavioral 
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

entity relogio is
    Port ( clk : in  STD_LOGIC;
           hold : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           t64 : out  STD_LOGIC;
           t16 : out  STD_LOGIC;
           t8 : out  STD_LOGIC;
           t1 : out  STD_LOGIC);
end relogio;

architecture Behavioral of relogio is

-- sinais para o contador de módulo 859375
signal cnt,cnt_nxt,cnt_m1,borrow : std_logic_vector(19 downto 0);
signal cnt_zero: std_logic;

-- sinais para o contador de módulo 64
signal cnt64,cnt64_nxt,borrow64 : std_logic_vector(5 downto 0);
signal en64: std_logic;

begin

----------------------------------------------------------
-- relógio com módulo 859375, de forma a fazer timeout a 
-- cada 1/64 segundos a partir do clk_fast (55MHz)
----------------------------------------------------------
cnt <= x"d1cee" when reset = '1' else
		 cnt_nxt  when rising_edge(clk) and hold='0';

-- comparador binário (na pratica implementado como uma nor de 20 entradas)
cnt_zero <= '1' when cnt=x"00000" else '0';

-- mux 2:1 de 20 bits
cnt_nxt <= x"d1cee" when cnt_zero='1' else cnt_m1;

-- subtractor de 20 bits
cnt_m1(0) <= not cnt(0);
borrow(0) <= not cnt(0);
ug : for i in 1 to 19 generate
	cnt_m1(i) <= cnt(i) xor borrow(i-1);
	borrow(i) <= not (cnt(i) or (not borrow(i-1)));
end generate;

----------------------------------------------------------
-- relógio com módulo 64, de forma a fazer timeout a 
-- cada 1/16 e 1 segundos a partir do clk_fast (55MHz)
----------------------------------------------------------
en64  <= (not hold) and cnt_zero;
cnt64 <= "111111"  when reset = '1' else
		   cnt64_nxt when rising_edge(clk) and en64='1';

-- subtractor de 20 bits
cnt64_nxt(0) <= not cnt64(0);
borrow64(0)  <= not cnt64(0);
ug2 : for i in 1 to 5 generate
	cnt64_nxt(i) <= cnt64(i) xor borrow64(i-1);
	borrow64(i)  <= not (cnt64(i) or (not borrow64(i-1)));
end generate;

----------------------------------------------------------
-- sinais de timeout
----------------------------------------------------------
t64 <= cnt_zero and (not hold);
t16 <= cnt_zero and (not hold) and borrow64(1);
t8  <= cnt_zero and (not hold) and borrow64(2);
t1  <= cnt_zero and (not hold) and borrow64(5);

end Behavioral;
