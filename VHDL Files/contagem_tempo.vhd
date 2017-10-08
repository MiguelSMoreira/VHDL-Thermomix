----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:51:10 11/27/2014 
-- Design Name: 
-- Module Name:    contagem_tempo - Behavioral 
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

entity contagem_tempo is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           up : in  STD_LOGIC;
           down : in  STD_LOGIC;
           start : in  STD_LOGIC;
           t1 : in  STD_LOGIC;
           state : in  STD_LOGIC_VECTOR (1 downto 0);
           tini : out  STD_LOGIC_VECTOR (7 downto 0);
           tcount : out  STD_LOGIC_VECTOR (7 downto 0));
end contagem_tempo;

architecture Behavioral of contagem_tempo is

--    COMPONENT addsub_sat
--    PORT(
--         A : IN  std_logic_vector(7 downto 0);
--         op : IN  std_logic;
--         en : IN  std_logic;
--         S : OUT  std_logic_vector(7 downto 0)
--        );
--    END COMPONENT;

    COMPONENT decimal_updown_counter
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         op : IN  std_logic;
         en : IN  std_logic;
         S : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

signal Dini, Dcnt, Qini, Qcnt,A,S : std_logic_vector(7 downto 0);
signal en_ini, en_cnt, en_aux : std_logic;
signal arith_op, arith_en, valid_op,en00,en01 : std_logic;

begin

-----------------------------------------------------------------------------
-- registos para Qini e Qcount ligacoes correspondentes
-----------------------------------------------------------------------------
Qini   <= (others=>'0') when reset='1' else Dini when rising_edge(clk) and en_ini='1';
Dini   <= S;
en_ini <= en00;

Qcnt   <= (others=>'0') when reset='1' else Dcnt when rising_edge(clk) and en_cnt='1';
Dcnt   <= S;
en_aux <= (not state(1)) and (not state(0)) and start;
en_cnt <= en_aux or en01;

-----------------------------------------------------------------------------
-- unidade aritmetica e ligacoes correspondentes
-----------------------------------------------------------------------------
--uarith : addsub_sat port map ( A=>A , op=>arith_op , en=>arith_en , S=>S );

-----------------------------------------------------------------------------
-- unidade aritmetica decimal e ligacoes correspondentes
-----------------------------------------------------------------------------
uarith : decimal_updown_counter port map ( A=>A , op=>arith_op , en=>arith_en , S=>S );

A        <= Qini when state(0)='0' else Qcnt;
valid_op <= up xor down;
en00     <= (not state(1)) and (not state(0)) and (not start) and valid_op;
en01     <= (not state(1)) and state(0) and t1;
arith_op <= (not state(0)) and up;
arith_en <= en00 or en01;

-----------------------------------------------------------------------------
-- ligacao das saidas do circuito
-----------------------------------------------------------------------------
Tini   <= Qini;
Tcount <= Qcnt;

end Behavioral;
