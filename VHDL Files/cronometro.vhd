----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:20 11/27/2014 
-- Design Name: 
-- Module Name:    cronometro - Behavioral 
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

entity cronometro is
    Port ( clk : in  STD_LOGIC;
           clk_slow : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           up : in  STD_LOGIC;
           down : in  STD_LOGIC;
           start : in  STD_LOGIC;
           pause : in  STD_LOGIC;
           disp : out  STD_LOGIC_VECTOR (7 downto 0);
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
           state : out  STD_LOGIC_VECTOR (1 downto 0));
end cronometro;

architecture Behavioral of cronometro is

--------------------------------------------------------------
-- Declaracao de componentes
--------------------------------------------------------------
    COMPONENT contagem_tempo
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         up : IN  std_logic;
         down : IN  std_logic;
         start : IN  std_logic;
         t1 : IN  std_logic;
         state : IN  std_logic_vector(1 downto 0);
         tini : OUT  std_logic_vector(7 downto 0);
         tcount : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

    COMPONENT relogio
    PORT(
         clk : IN  std_logic;
         hold : IN  std_logic;
         reset : IN  std_logic;
         t64 : OUT  std_logic;
         t16 : OUT  std_logic;
         t8 : OUT  std_logic;
         t1 : OUT  std_logic
        );
    END COMPONENT;

    COMPONENT temporizador_state_machine
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         tini : IN  std_logic_vector(7 downto 0);
         pause : IN  std_logic;
         tcount : IN  std_logic_vector(7 downto 0);
         state : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;

    COMPONENT fullseq
    Port( clk: in STD_LOGIC;
         ini: in STD_LOGIC;
         en:  in STD_LOGIC;
         B:   in STD_LOGIC_vector (7 downto 0);
         Q:   out STD_LOGIC_vector(7 downto 0)
         );
    END COMPONENT;

--------------------------------------------------------------
-- Declaracao de sinais
--------------------------------------------------------------
   --Inputs
   signal hold,rst_relogio : std_logic;
   signal up_old,down_old, rising_edge_up,rising_edge_down : std_logic;
   signal up_t8,down_t8,updown_t1, event_up,event_down: std_logic;
   signal t64,t16,t8,t1 : std_logic;
   signal tini,tcnt : std_logic_vector(7 downto 0);
   signal B,QSeq,Qflicker : std_logic_vector(7 downto 0);
   signal st : std_logic_vector(1 downto 0);

begin

------------------------------------------------------------------------
-- instanciacao e atribuicoes de sinais referentes ao componente:
--       RELOGIO
------------------------------------------------------------------------
rst_relogio <= reset or rising_edge_up or rising_edge_down;
hold <= st(1) and (not st(0));

urelogio: relogio PORT MAP (
				clk => clk,
				hold => hold,
				reset => rst_relogio,
				t64 => t64,
				t16 => t16,
				t8 => t8,
				t1 => t1
			);

------------------------------------------------------------------------
-- instanciacao e atribuicoes de sinais referentes ao componente:
--       MAQUINA DE ESTADOS
------------------------------------------------------------------------
usm: temporizador_state_machine PORT MAP (
				clk => clk,
				reset => reset,
				start => start,
				tini => tini,
				pause => pause,
				tcount => tcnt,
				state => st
			);

------------------------------------------------------------------------
-- instanciacao e atribuicoes de sinais referentes ao componente:
--       CONTAGEM TEMPO
------------------------------------------------------------------------
ucount: contagem_tempo PORT MAP (
          clk => clk,
          reset => reset,
          up => event_up,
          down => event_down,
          start => start,
          t1 => t1,
          state => st,
          tini => tini,
          tcount => tcnt
        );

------------------------------------------------------------------------
-- os sinais up_event e down_event ficam ativos a 1, se houver uma 
-- transicao 0->1 no sinal up/down correspondente, ou se 
-- houver timeout t8, o que significa que o botao esta pressionado
-- ha 1/8s. Nesse caso dispara um evento para alterar a contagem
------------------------------------------------------------------------
up_old   <= '0' when reset = '1' else up   when rising_edge(clk);
down_old <= '0' when reset = '1' else down when rising_edge(clk);

rising_edge_up   <= up   and (not up_old)   and (not down); -- signal is 1 if there is a 0->1 transition on up signal
rising_edge_down <= down and (not down_old) and (not up);   -- signal is 1 if there is a 0->1 transition on down signal

up_t8   <= up   and not down and t8 and updown_t1;
down_t8 <= down and not up   and t8 and updown_t1;

updown_t1 <= '0' when rst_relogio='1' else '1' when rising_edge(clk) and t1='1';

event_up   <= rising_edge_up   or up_t8;
event_down <= rising_edge_down or down_t8;

------------------------------------------------------------------------
-- instanciacao e atribuicoes de sinais referentes ao componente:
--       FULLSEQ
------------------------------------------------------------------------
B <= (others=>'0');

useq: fullseq PORT MAP (
          clk => clk,
          ini => reset,
			 en => t16,
			 B => B,
			 Q => Qseq
		  );

------------------------------------------------------------------------
-- Atribuicoes referentes aos sinais de saida
------------------------------------------------------------------------
-- multiplexer 4:1 de 8 bits
disp <= tini when st="00" else
		  tcnt when st="01" else
		  tcnt when st="10" else
		  x"ff";

-- multiplexer 4:1 de 8 bits
leds <= x"81" when st="00" else
		  Qseq  when st="01" else
		  Qflicker when st="10" else
		  x"ff";

-- 8-bit and gate
Qflicker <= Qseq and (7 downto 0=>clk_slow);
state <= st;

end Behavioral;
