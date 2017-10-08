----------------------------------------------------------------------------------
-- Company: IST/INESC-ID
-- Engineer: Pedro Tomás
--
-- Module Name:    debouncer - Behavioral 
--
-- Description: 
--    Quando for pressionado um dos botões de entrada btn0, btn1, btn2 e btn3, 
--    gera um impulso nos sinais pressure0, pressure1, pressure2 e pressure3, 
--    respectivamente, com a duração de um impulso de relógio.
--    
--    De forma a eliminar o bouncing dos botões, o pulso só é activo após 2^20 
--    ciclos de relógio com o sinal estável a 1, o que se traduz num atraso de 
--    aproximadamente 20ms.
--
-- Revision 0.01
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity debouncer is
    Port ( standard_clk : in STD_LOGIC;
			  reset : std_logic;
	        btn0 : in  STD_LOGIC;
           btn1 : in  STD_LOGIC;
           btn2 : in  STD_LOGIC;
           btn3 : in  STD_LOGIC;
           pressure0 : out  STD_LOGIC;
           pressure1 : out  STD_LOGIC;
           pressure2 : out  STD_LOGIC;
           pressure3 : out  STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is

constant CNT_RANGE : natural := 18;

type cnt_type is array (integer range <>) of std_logic_vector(CNT_RANGE downto 0);

signal cnt : cnt_type(3 downto 0);
signal btns, sn, sn_1 : std_logic_vector(3 downto 0);

begin

-- internal assignment
btns(0) <= btn0;
btns(1) <= btn1;
btns(2) <= btn2;
btns(3) <= btn3;

cnti: for i in 0 to 3 generate
	process(standard_clk,reset,btns)
	begin
		if reset='1' then
			sn(i) <= '0';
		elsif rising_edge(standard_clk) then
			sn_1(i) <= sn(i);
			if btns(i)=sn(i) then
				cnt(i) <= (others=>'0');
			else
				if cnt(i) = (CNT_RANGE downto 0=>'1') then
					sn(i) <= not sn(i);
					cnt(i)   <= (others=>'0');
				else
					cnt(i)   <= cnt(i) + 1;
				end if;
			end if;
		end if;
	end process;
end generate;

-- output assignment
pressure0 <= sn(0) and not sn_1(0);
pressure1 <= sn(1) and not sn_1(1);
pressure2 <= sn(2) and not sn_1(2);
pressure3 <= sn(3) and not sn_1(3);

end Behavioral;
