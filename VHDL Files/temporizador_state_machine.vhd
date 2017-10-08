----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:40:50 11/26/2014 
-- Design Name: 
-- Module Name:    temporizador_state_machine - Behavioral 
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

entity temporizador_state_machine is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           start : in  STD_LOGIC;
           tini : in  STD_LOGIC_VECTOR (7 downto 0);
           pause : in  STD_LOGIC;
           tcount : in  STD_LOGIC_VECTOR (7 downto 0);
           state : out  STD_LOGIC_VECTOR (1 downto 0));
end temporizador_state_machine;

architecture Behavioral of temporizador_state_machine is

signal Q,Qnext : std_logic_vector(1 downto 0);
signal tini_zero, tcnt_zero : std_logic;

signal aux0,aux1,aux2,aux3 : std_logic;

begin

-- registo com reset assincrono
Q <= "00" when reset='1' else Qnext when rising_edge(clk);

-- verificar se tini = 0
tini_zero <= not (tini(0) or tini(1) or tini(2) or tini(3) or tini(4) or tini(5) or tini(6) or tini(7));

-- verificar se tcount = 0
tcnt_zero <= not (tcount(0) or tcount(1) or tcount(2) or tcount(3) or tcount(4) or tcount(5) or tcount(6) or tcount(7));

-- calculo do proximo estado
aux0 <= (not Q(0)) and (not Q(1)) and start and (not tini_zero);
aux1 <= Q(0) and (not Q(1)) and (not pause) and (not tcnt_zero);
aux2 <= (not Q(0)) and Q(1) and (not pause);
Qnext(0) <= aux0 or aux1 or aux2;

aux3 <= Q(0) or Q(1);
Qnext(1) <= aux3 and pause;

-- output da saida
state <= Q;

end Behavioral;
