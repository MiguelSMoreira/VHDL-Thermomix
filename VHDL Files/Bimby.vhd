----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Bimby.vhd

--Descricao das bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Descricao da Entidade
entity Bimby is
    Port ( 
	        Display : out  STD_LOGIC_VECTOR(11 downto 0);
           Velocidade : out  STD_LOGIC_VECTOR(7 downto 0);
           Leds : out  STD_LOGIC_VECTOR(7 downto 0);
           Aquecer : out  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Up : in  STD_LOGIC;
           Down : in  STD_LOGIC;
           Cancel : in  STD_LOGIC;
           Start : in  STD_LOGIC;
           ManualMode : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR(1 downto 0);
			  CLK : in STD_LOGIC
			  );
end Bimby;

--Estrutura da Arquitetura do Componente
architecture Behavioral of Bimby is

--Declaracao dos Componentes
component Bloco_1 is
    Port ( 
	        CTempoTotal : in  STD_LOGIC_VECTOR(11 downto 0);
           CTempoEtapa : in  STD_LOGIC_VECTOR(7 downto 0);
           State : out  STD_LOGIC_VECTOR(2 downto 0);
           Up : in  STD_LOGIC;
			  Down : in  STD_LOGIC;
           Start : in  STD_LOGIC;
           Manual_Mode : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Cancel : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
			  Receita : out STD_LOGIC_VECTOR(44 downto 0)
			  );
end component;

component Bloco_2 is
    Port ( 
	        TIMEOUT1 : in  STD_LOGIC;
           State : in  STD_LOGIC_VECTOR(2 downto 0);
           Receita : in  STD_LOGIC_VECTOR(44 downto 0);
           TempoManual : in  STD_LOGIC_VECTOR(7 downto 0);
           CTempoEtapa : out  STD_LOGIC_VECTOR(7 downto 0);
           CTempoTotal : out  STD_LOGIC_VECTOR(11 downto 0);
			  Manual_Mode : in STD_LOGIC;
			  CLK : in STD_LOGIC;
			  RESET : in STD_LOGIC
			 );
end component;

component Bloco_3 is
    Port ( 
	        UP : in  STD_LOGIC;
           DOWN : in  STD_LOGIC;
           ManualMode : in  STD_LOGIC;
           State : in  STD_LOGIC_VECTOR(2 downto 0);
           TIMEOUT64 : in  STD_LOGIC;
           Velocidade : out  STD_LOGIC_VECTOR(7 downto 0);
           TempoManual : out  STD_LOGIC_VECTOR(7 downto 0);
           LEDS : out  STD_LOGIC_VECTOR(7 downto 0);
			  CLK : in STD_LOGIC;
			  Receita: in STD_LOGIC_VECTOR(44 downto 0);
			  RESET : in STD_LOGIC
			  );
end component;

component Bloco_4 is
    Port ( 
	        ContTempoEtapa : in  STD_LOGIC_VECTOR(7 downto 0);
           ContTempoTotal : in  STD_LOGIC_VECTOR(11 downto 0);
           Velocidade : in  STD_LOGIC_VECTOR(7 downto 0);
           Receita : in  STD_LOGIC_VECTOR(44 downto 0);
           Sel : in  STD_LOGIC_VECTOR(1 downto 0);
           State : in  STD_LOGIC_VECTOR(2 downto 0);
           DISPLAY : out  STD_LOGIC_VECTOR(11 downto 0);
           AQUECER : out  STD_LOGIC;
           TempoManual : in  STD_LOGIC_VECTOR(7 downto 0)
			  );
end component;

component relogio is
    Port ( 
	        clk : in  STD_LOGIC;
           hold : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           t64 : out  STD_LOGIC;
           t16 : out  STD_LOGIC;
           t8 : out  STD_LOGIC;
           t1 : out  STD_LOGIC
			  );
end component;

--Declaracao dos Sinais Internos ao Componente
signal signalReceita : STD_LOGIC_VECTOR(44 downto 0);
signal signalCTempoTotal , signalDisplay: STD_LOGIC_VECTOR(11 downto 0);
signal signalCTempoEtapa , signalTempoManual , signalVelocidade , signalLEDS : STD_LOGIC_VECTOR(7 downto 0);
signal signalState : STD_LOGIC_VECTOR(2 downto 0);
signal signalTIMEOUT1 , signalTIMEOUT64 , signalAquecer , signalNotCook , signalAut , signalManCook : STD_LOGIC;					

begin

--Utilizacao de 1 Instancia do Bloco 1
uut : Bloco_1 port map ( 
           CTempoTotal => signalCTempoTotal,
           CTempoEtapa => signalCTempoEtapa,
           State => signalState,
           Up => Up,
			  Down => Down,
           Start => Start,
           Manual_Mode => ManualMode,
           Reset => Reset,
           Cancel => Cancel,
			  CLK => CLK,
			  Receita => signalReceita
      );
		
--Utilizacao de 1 Instancia do Bloco 2	
uut1 : Bloco_2 port map ( 
           TIMEOUT1 => signalTIMEOUT1,
           State => signalState,
           Receita => signalReceita,
           TempoManual => signalTempoManual,
           CTempoEtapa => signalCTempoEtapa,
           CTempoTotal => signalCTempoTotal,
			  Manual_Mode => ManualMode,
			  CLK => CLK,
			  RESET => Reset
      );		
		
--Utilizacao de 1 Instancia do Bloco 3
uut2 : Bloco_3 port map ( 
           UP => Up,
           DOWN => Down,
           ManualMode => ManualMode,
           State => signalState,
           TIMEOUT64 => signalTIMEOUT64,
           Velocidade => signalVelocidade,
           TempoManual => signalTempoManual,
           LEDS => signalLEDS,
			  CLK => CLK,
			  Receita => signalReceita,
			  RESET => Reset
      );
		
--Utilizacao de 1 Instancia do Bloco 4
uut3 : Bloco_4 port map ( 
           ContTempoEtapa => signalCTempoEtapa,
           ContTempoTotal => signalCTempoTotal,
           Velocidade => signalVelocidade,
           Receita => signalReceita,
           Sel => Sel,
           State => signalState,
           DISPLAY => signalDisplay,
           AQUECER => signalAquecer,
           TempoManual => signalTempoManual
      );
		
--Utilizacao de 1 Instancia do Relogio
uut4 : relogio port map ( 
           clk => CLK,
           hold => signalNotCook, 
           reset => Reset,
           t64 => signalTIMEOUT64,
           t1 => signalTIMEOUT1
      );		

--Atribuicao da Saida
signalAut <= (not signalState(2)) and (not signalState(1)) and signalState(0);
signalManCook <= (not signalState(2)) and signalState(1) and (not signalState(0));
signalNotCook <= not (signalAut or signalManCook);

Display <= signalDisplay;
Aquecer <= signalAquecer;
Velocidade <= signalVelocidade;
Leds <= signalLEDS;

end Behavioral;

