----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Bloco_3.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da Entidade
entity Bloco_3 is
    Port ( 
	        TIMEOUT64 : in STD_LOGIC;
	        UP : in  STD_LOGIC;
           DOWN : in  STD_LOGIC;
           ManualMode : in  STD_LOGIC;
           State : in  STD_LOGIC_VECTOR(2 downto 0);
           Velocidade : out  STD_LOGIC_VECTOR(7 downto 0);
           TempoManual : out  STD_LOGIC_VECTOR(7 downto 0);
           LEDS : out  STD_LOGIC_VECTOR(7 downto 0);
			  CLK : in STD_LOGIC;
			  Receita : in STD_LOGIC_VECTOR(44 downto 0);
			  RESET : in STD_LOGIC
			  );
end Bloco_3;

--Descricao da Arquitetura do Componente
architecture Behavioral of Bloco_3 is

--Declaracao dos Componentes
component FullSEQ is
    Port ( 
	        clk : in  STD_LOGIC;
           INI : in  STD_LOGIC;
           EN  : in  STD_LOGIC;
           B   : in  STD_LOGIC_VECTOR (7 downto 0);
           Q   : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end component;

component Unidade_Aritmetica is
    Port ( 
	        A : in  STD_LOGIC_VECTOR(7 downto 0);
           EN : in  STD_LOGIC;
           OP : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(7 downto 0)
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

component bcd_updown_counter_8bit is
    Port ( 
	        A : in  STD_LOGIC_VECTOR (7 downto 0);
			  op : in STD_LOGIC;
			  en : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
			  en_next : out STD_LOGIC
			  );
end component;

--Declaracao dos Sinais Internos
signal signalTM , signalReg1 , signalVM , signalReg2 , signalReg3 , signalMux1 , signalMux , signalRegS , signalVel , signalLEDS: STD_LOGIC_VECTOR(7 downto 0);
signal signalUAEN1 , signalOp , signalEXP , signalEN , signalRESET , signalRESET1 , signalRESET5 , signalRESET4 , signalRESET2 , signalRESET3 , signalSetSpeed , signalFimCont , signalNotCook , signalCook , signalSetTime , signalUAEN2 , signalAut , signalManCook , signalUP , signalDOWN , signalOr , signalCEN: STD_LOGIC;
signal signalState : STD_LOGIC_VECTOR(2 downto 0);

begin

--Utilizacao de 2 Instancias da Unidade Aritmetica de 8bits
uut : Unidade_Aritmetica port map ( 
           A => signalTM,
           EN => signalUAEN1,
           OP => signalOp,
           S => signalReg1
      );
		
uut1 : Unidade_Aritmetica port map ( 
           A => signalVM,
           EN =>signalUAEN2,
           OP => signalOp,
           S => signalReg2
      );
		
--Utilizacao de 3 Instancias de Registos de 8bits
uut2 : Registo8 port map ( 
           D => signalReg1,
           CLK => CLK,
           EN => '1',
			  RESET => signalRESET,
           Q => signalTM
      );

uut3 : Registo8 port map ( 
           D => signalReg2,
           CLK => CLK,
           EN => '1',
			  RESET => signalRESET4,
           Q => signalVM
      );
		
uut4 : Registo8 port map ( 
           D => signalMux1,
           CLK => CLK,
           EN => '1',
			  RESET => signalRESET5,
           Q => signalRegS
      );
		
--Utilizacao de 2 MUX
signalMux <= Receita(8 downto 1) when signalManCook='0' else
	          signalVM when signalManCook='1';
				 
signalMux1 <= signalVel when signalExp='0' else
	           signalMux when signalExp='1';
				 
--Utilizacao de 1 Instancia do Contador em BCD
uut5 : bcd_updown_counter_8bit port map ( 
           A => signalRegS,
			  op => '1',
			  en => signalEN,
           S => signalVel
      );
		
--Utilizacao de 1 Instancia do FullSeq
uut6 : FullSEQ port map ( 
           CLK => signalFimCont,
           INI => signalNotCook,
           EN => '1',
           B => "00000000",
           Q => signalLEDS
      );
		
signalExp <= signalNotCook or signalRESET3;

--Logica Combinatoria Adicional e Atribuicao de Saidas
signalEN <= TIMEOUT64 and signalCook;
signalSetTime <= signalState(2) and (not signalState(1)) and (not signalState(0));
signalSetSpeed <= signalState(2) and (not signalState(1)) and signalState(0);
signalRESET <= signalRESET1 or RESET;
signalRESET1 <= signalTM(7) and (not signalTM(6)) and (not signalTM(5)) and signalTM(4) and signalTM(3) and (not signalTM(2)) and (not signalTM(1)) and signalTM(0);
signalRESET2 <= (not signalVM(7)) and (not signalVM(6)) and (not signalVM(5)) and signalVM(4) and (not signalVM(3)) and signalVM(2) and (not signalVM(1)) and signalVM(0);
signalRESET3 <= (not signalVel(7)) and (not signalVel(6)) and (not signalVel(5)) and signalVel(4) and (not signalVel(3)) and signalVel(2) and signalVel(1) and (not signalVel(0));
signalRESET4 <= signalRESET2 or RESET;
signalRESET5 <= signalRESET3 or RESET;
signalAut <= (not signalState(2)) and (not signalState(1)) and signalState(0);
signalManCook <= (not signalState(2)) and signalState(1) and (not signalState(0));
signalNotCook <= not (signalAut or signalManCook);
signalCook <= signalAut or signalManCook;
signalOp <= UP and (not DOWN);
signalOr <= signalUP xor signalDOWN;
signalUAEN1 <= signalOr and signalSetTime;
signalUAEN2 <= signalOr and signalSetSpeed;
signalCEN <= signalAut or signalManCook;
signalFimCont <= (not signalVel(7)) and (not signalVel(6)) and (not signalVel(5)) and signalVel(4) and (not signalVel(3)) and signalVel(2) and (not signalVel(1)) and signalVel(0);
signalState <= State;
signalUP <= UP;
signalDOWN <= DOWN;

TempoManual <= signalTM;
Velocidade <= signalVel;
LEDS <= signalLEDS;

end Behavioral;