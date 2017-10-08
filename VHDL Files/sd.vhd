----------------------------------------------------------------------------------
-- Company: IST/INESC-ID
-- Author: Pedro Tomas
--
-- Revision: 
-- Revision 0.01
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- NAO ALTERAR ESTES SINAIS (do not change the entity declaration)
entity sd is
    Port ( clk1 : in  STD_LOGIC;
           btn0 : in  STD_LOGIC;
           btn1 : in  STD_LOGIC;
           btn2 : in  STD_LOGIC;
           btn3 : in  STD_LOGIC;
           sw0 : in  STD_LOGIC;
           sw1 : in  STD_LOGIC;
           sw2 : in  STD_LOGIC;
           sw3 : in  STD_LOGIC;
           sw4 : in  STD_LOGIC;
           sw5 : in  STD_LOGIC;
           sw6 : in  STD_LOGIC;
           sw7 : in  STD_LOGIC;
           an0 : out  STD_LOGIC;
           an1 : out  STD_LOGIC;
           an2 : out  STD_LOGIC;
           an3 : out  STD_LOGIC;
           seg0 : out  STD_LOGIC;
           seg1 : out  STD_LOGIC;
           seg2 : out  STD_LOGIC;
           seg3 : out  STD_LOGIC;
           seg4 : out  STD_LOGIC;
           seg5 : out  STD_LOGIC;
           seg6 : out  STD_LOGIC;
           dp : out  STD_LOGIC;
           led0 : out  STD_LOGIC;
           led1 : out  STD_LOGIC;
           led2 : out  STD_LOGIC;
           led3 : out  STD_LOGIC;
           led4 : out  STD_LOGIC;
           led5 : out  STD_LOGIC;
           led6 : out  STD_LOGIC;
           led7 : out  STD_LOGIC);
end sd;

architecture Behavioral of sd is

----------------------------------------------------------------------
-- NAO ALTERAR A PROXIMA ZONA
----------------------------------------------------------------------
-- declaracao da componente para geracao dos seguintes sinais de relogio
--   * CLK_FAST = 55 MHz (same as CLK)
--   * CLK_SLOW = 840 Hz (CLK/2^16)
--   * CLK_DISP = 0.8 Hz (CLK/2^26)
component clkdiv
  Port (
	clk : in std_logic;
	clk_fast, clk_slow, clk_disp : out std_logic
  );
end component;
-- declaracao da componente debouncing dos botoes de pressao
component debouncer
    Port ( standard_clk : in STD_LOGIC;
			  reset : std_logic;
	        btn   : in   STD_LOGIC_VECTOR(3 downto 0);
           pulse : out  STD_LOGIC_VECTOR(3 downto 0);
           press : out  STD_LOGIC_VECTOR(3 downto 0)
			);
end component;
-- declaracao da componente de interface com o display de 7 segmentos
component disp7
  Port (
   disp4_3, disp4_2, disp4_1, disp4_0, aceso4 : in std_logic;
   disp3_3, disp3_2, disp3_1, disp3_0, aceso3 : in std_logic;
   disp2_3, disp2_2, disp2_1, disp2_0, aceso2 : in std_logic;
   disp1_3, disp1_2, disp1_1, disp1_0, aceso1 : in std_logic;
   clk : in std_logic;
	en1, en2, en3, en4 : out std_logic;
	segm1, segm2, segm3, segm4, segm5, segm6, segm7, dp : out std_logic
  );
end component;

-- pre-declaracao dos sinais para interface com a placa Basys/Basys2
signal clk_fast, clk_slow, clk_disp : std_logic;
signal btn_vect, pulse, press : std_logic_vector(3 downto 0);
signal disp0,disp1,disp2,disp3, aceso : std_logic_vector(3 downto 0);

----------------------------------------------------------------------
-- DECLARAR NESTA ZONA OS COMPONENTES E SINAIS NECESSARIOS 
-- A DESCRICAO DO CIRCUITO
----------------------------------------------------------------------
component cronometro
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
end component;

signal leds : std_logic_vector(7 downto 0);
signal state : std_logic_vector(1 downto 0);

begin

----------------------------------------------------------------------
-- NAO ALTERAR A INSTANCIACAO DOS SEGUINTES COMPONENTES
----------------------------------------------------------------------
-- instanciacao da componente para geracao dos seguintes sinais de relogio
uclk_gen: clkdiv port map (
				clk => clk1,
				-- saidas de relogio a utilizar no circuito
				clk_fast => clk_fast, -- 55 MHz
				clk_slow => clk_slow, -- 840 Hz
				clk_disp => clk_disp  -- 0.8Hz
			);

-- instanciacao da componente para fazer o debouncing dos botoes. O boucing corresponde a oscilacoes temporarias nos sinais
-- quando estes mudam de valor, e tem origem nas molas (mecanicas) existentes nos botoes de pressao. Se nao houver debouncing
-- o sistema tem a sensacao de o botao ser pressionado varias vezes seguidas
udebounce: debouncer port map (
				standard_clk => clk_fast,
				reset        => sw7,
				btn          => btn_vect, -- botoes(3:0) de entrada com bouncing (cada bit corresponde a um botao diferente)
				-- saidas a utilizar como botoes de pressao
				pulse        => pulse,    -- botoes(3:0) sem debouncing, correspondentes a um pulso(3:0),
				                          -- com duracao de um periodo de relogio clk_fast, quando os botes sao pressionados
				press        => press     -- botoes(3:0) sem debouncing, os quais ficam activos enquanto o botao respectivo
				                          -- se mantiver pressionado
			);
-- concatenacao dos botoes de entrada num vector
btn_vect <= btn3 & btn2 & btn1 & btn0;

-- instanciacao da componente para fazer o interface com o display de 7 segmentos
udisp: disp7 port map (
				clk => clk_disp,
				en1 => an0, en2 => an1, en3 => an2, en4=> an3,
				segm1 => seg0, segm2 => seg1, segm3 => seg2, segm4 => seg3, segm5 => seg4, segm6 => seg5, segm7 => seg6, dp => dp,
				-- os sinais que devem ser definidos sao: 
				--    * disp3, disp2, disp1, disp0 : std_logic_vector (3 downto 0);
				--    * aceso(3), aceso(2), aceso(1), aceso(0) => enable que permite acender o display de 7 segmentos respetivo
				disp4_3 => disp3(3), disp4_2 => disp3(2), disp4_1 => disp3(1), disp4_0 => disp3(0),
				disp3_3 => disp2(3), disp3_2 => disp2(2), disp3_1 => disp2(1), disp3_0 => disp2(0),
				disp2_3 => disp1(3), disp2_2 => disp1(2), disp2_1 => disp1(1), disp2_0 => disp1(0),
				disp1_3 => disp0(3), disp1_2 => disp0(2), disp1_1 => disp0(1), disp1_0 => disp0(0),
				aceso4 => aceso(3) , aceso3 => aceso(2) , aceso2 => aceso(1) , aceso1 => aceso(0)
			);
  
----------------------------------------------------------------------
-- DESCRICAO DO CIRCUITO
----------------------------------------------------------------------
ucron: cronometro port map (
				clk   => clk_fast,
				clk_slow => clk_slow,
				reset => sw7,
				up    => press(2),
				down  => press(3),
				start => pulse(0),
				pause => sw0,
				disp(3 downto 0) => disp0,
				disp(7 downto 4) => disp1,
				leds  => leds,
				state => state
			);

-- ligacoes aos leds
led7 <= leds(7);
led6 <= leds(6);
led5 <= leds(5);
led4 <= leds(4);
led3 <= leds(3);
led2 <= leds(2);
led1 <= leds(1);
led0 <= leds(0);

-- activar (acender) os segmentos necessários, i.e., o display 3, 1 e 0
aceso <= "1011";

-- colocar no display 3 (mais à esquerda) o valor do estado actual
disp3 <= "00" & state;

end Behavioral;

