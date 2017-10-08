----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:17:15 11/27/2014 
-- Design Name: 
-- Module Name:    adder8 - Behavioral 
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

entity addsub_sat is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
			  op : in STD_LOGIC;
			  en : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end addsub_sat;

architecture Behavioral of addsub_sat is

signal auxS,Y,Ya,Yb,Cc : STD_LOGIC_VECTOR (7 downto 0);
signal C : STD_LOGIC_VECTOR (8 downto 0);
signal Amax, Amin, selMin,selMax,saturate : STD_LOGIC;

begin

-- mux 2:1
S <= A when en='0' else auxS;

-- sumador/subtractor de 8 bits comandados por op
-- (baseado em full-adders)
C(0) <= Op;
ugen: for i in 0 to 7 generate
	Ya(i)  <= A(i) xnor op;
	Yb(i)  <= A(i) and (not op);
	Y(i)   <= Ya(i) xor C(i);
	Cc(i)  <= Ya(i) and C(i);
	C(i+1) <= Yb(i) or Cc(i);
end generate;

-- comparador binario (na pratica implementado como uma nor de 8 entradas)
Amin <= '1' when A=x"00" else '0';

-- comparador binario (na pratica implementado como uma nor de 8 entradas)
Amax <= '1' when A=x"7F" else '0';

-- selector do multiplexer
selMin <= Amin and (not op);
selMax <= Amax and op;
saturate <= SelMin or SelMax;

-- multiplexer 2:1 de 8 bits para a saturacao
auxS <= Y when saturate='0' else A;

end Behavioral;

