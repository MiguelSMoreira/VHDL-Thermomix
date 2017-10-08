----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Bloco_2.vhd

--Utilizacao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Descricao da Entidade
entity Bloco_2 is
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
end Bloco_2;

--Descricao da Arquitetura do Componente
architecture Behavioral of Bloco_2 is

--Declaracao dos Componentes
component bcd_updown_counter_12bit is
    Port ( 
	        A : in  STD_LOGIC_VECTOR(11 downto 0);
           Op : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           EN_NEXT : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(11 downto 0)
			  );
end component;

component bcd_updown_counter_8bit is
    Port ( 
	        A : in  STD_LOGIC_VECTOR(7 downto 0);
           Op : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(7 downto 0);
           EN_NEXT : out  STD_LOGIC
			  );
end component;

component Registo12 is
    Port ( 
	        D : in  STD_LOGIC_VECTOR(11 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(11 downto 0)
			  );
end component;

component Registo8 is
    Port ( 
	        D : in  STD_LOGIC_VECTOR(7 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end component;

--Declaracao dos Sinais Internos
signal signalDec1 , signalCTTotal , signalMux : STD_LOGIC_VECTOR(11 downto 0);
signal signalDec2 , signalCTEtapa , signalMux1 , signalMux2 : STD_LOGIC_VECTOR(7 downto 0);
signal signalState : STD_LOGIC_VECTOR(2 downto 0);
signal signalEN1 , signalEN2 , signalSetTime , signalAut , signalManCook , signalCook , signalTIMEOUT1 : STD_LOGIC;

begin

--Utilizacao de 1 Instancia do Registo12
uut1 : registo12 port map ( 
          D => signalDec1,
          CLK => CLK,
          EN => signalAut,
			 RESET => RESET,
          Q => signalCTTotal
      );

--Utilizacao de 1 Instancia do Registo8
uut2 : registo8 port map ( 
          D => signalMux2,
          CLK => CLK,
          EN => '1',
			 RESET => RESET,
          Q => signalDec2
      );

--Utilizacao de 1 Instancia do Decrementador em BCD de 12bits
uut3 : bcd_updown_counter_12bit port map ( 
          A => signalMux,
          Op => '0',
          EN => signalEN1,
          S => signalDec1 
      );

--Utilizacao de 1 Instancia do Decrementador em BCD de 8bits
uut4 : bcd_updown_counter_8bit port map ( 
          A => signalDec2,
          Op => '0',
          EN => signalEN2,
          S => signalCTEtapa
      );

--Utilizacao de Mux
signalMux <= signalCTTotal when signalCook='1' else
	          Receita(28 downto 17) when signalCook='0';
				 
signalMux1 <= Receita(16 downto 9) when Manual_Mode='0' else
	           TempoManual when Manual_Mode='1';
				 
signalMux2 <= signalMux1 when signalCook='0' else
	           signalCTEtapa when signalCook='1';
				 
--Logica Combinatória Adicional e Atribuicao de Saidas
signalSetTime <= signalState(2) and (not signalState(1)) and (not signalState(0));
signalAut <= (not signalState(2)) and (not signalState(1)) and signalState(0);
signalManCook <= (not signalState(2)) and signalState(1) and (not signalState(0));
signalEN1 <= signalAut and signalTIMEOUT1;
signalEN2 <= signalTIMEOUT1 and signalCook;
signalCook <= signalAut or signalManCook;

signalTIMEOUT1 <= TIMEOUT1;
signalState <= State;
CTempoEtapa <= signalCTEtapa;
CTempoTotal <= signalCTTotal;

end Behavioral;

