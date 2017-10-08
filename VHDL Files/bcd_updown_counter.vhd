----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:23 12/01/2014 
-- Design Name: 
-- Module Name:    bcd_updown_counter - Behavioral 
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

entity bcd_updown_counter is
    Port ( 
	        A : in  STD_LOGIC_VECTOR (3 downto 0);
			  op : in STD_LOGIC;
			  en : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
			  en_next : out STD_LOGIC
			  );
end bcd_updown_counter;

architecture Behavioral of bcd_updown_counter is

signal auxS,Y,Ya,Yb,Cc : STD_LOGIC_VECTOR (3 downto 0);
signal C : STD_LOGIC_VECTOR (4 downto 0);
signal Amax, Amin : STD_LOGIC;
signal sel : STD_LOGIC_VECTOR(1 downto 0);

begin

-- mux 2:1
S <= A when en='0' else auxS;

-- sumador/subtractor bin�io de 4 bits comandados por op
-- (baseado em full-adders)
C(0) <= Op;
ugen: for i in 0 to 3 generate
	Ya(i)  <= A(i) xnor op;
	Yb(i)  <= A(i) and (not op);
	Y(i)   <= Ya(i) xor C(i);
	Cc(i)  <= Ya(i) and C(i);
	C(i+1) <= Yb(i) or Cc(i);
end generate;

-- comparador binario (na pratica implementado como uma and de 4 entradas, todas negadas)
Amin <= '1' when A=x"0" else '0';

-- comparador binario (na pratica implementado como uma and de 4 entradas, 2 negadas)
Amax <= '1' when A=x"9" else '0';

-- selector do multiplexer
--   00 => normal operation
--   01 => operation is decrement, but the current value is already 0
--   10 => operation is increment, but the current value is already 9
sel(0) <= Amin and (not op);
sel(1) <= Amax and op;

-- multiplexer 4:1 de 4 bits
auxS <= Y      when sel="00" else
        "1001" when sel="01" else
        "0000" when sel="10" else
		  Y; -- the last case should not occur

en_next <= sel(0) or sel(1);

end Behavioral;
