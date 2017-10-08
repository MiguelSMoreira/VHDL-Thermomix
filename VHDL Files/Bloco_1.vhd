----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Bloco_1.vhd

--Descricao das bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Bloco_1 is
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
end Bloco_1;

--Descricao da Arquitetura do Componente
architecture Behavioral of Bloco_1 is

--Declaracao dos Componentes
component Maq_Estados is
    Port ( 
	        St : in  STD_LOGIC;
           MM : in  STD_LOGIC;
           Fe : in  STD_LOGIC;
           Fr : in  STD_LOGIC;
           Ca : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
           EIng : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
           State : out  STD_LOGIC_VECTOR (2 downto 0)
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

component Registo4 is
    Port ( 
	        D : in  STD_LOGIC_VECTOR(3 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end component;

component rom_memory_enderecos is
    Port ( 
            address : in  STD_LOGIC_VECTOR (3 downto 0);
            data : out  STD_LOGIC_VECTOR (7 downto 0)
         );
end component;

component rom_memory_tabela is
    Port ( 
            address : in  STD_LOGIC_VECTOR (7 downto 0);
            data : out  STD_LOGIC_VECTOR (44 downto 0)
         );
end component;

component Unidade_Aritmetica_4bits is
    Port ( 
	        A : in  STD_LOGIC_VECTOR(3 downto 0);
           EN : in  STD_LOGIC;
           OP : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(3 downto 0)
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

component bloco_mux2_8bits is
    Port ( 
	        D0 : in  STD_LOGIC_VECTOR(7 downto 0);
           D1 : in  STD_LOGIC_VECTOR(7 downto 0);
			  SEL : in  STD_LOGIC;
           Y   : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end component;

-- Declaracao dos Sinais Internos
signal signalContagem , signalReg , signalS : STD_LOGIC_VECTOR(3 downto 0);
signal signalState : STD_LOGIC_VECTOR(2 downto 0);
signal signalEndereco , signalTabela , signalMux , signalReg2 , signalCTempoEtapa, signalCounter : STD_LOGIC_VECTOR(7 downto 0);
signal signalReceita : STD_LOGIC_VECTOR(44 downto 0);
signal signalCTempoTotal : STD_LOGIC_VECTOR(11 downto 0);
signal signalUA , signalDU , signalUD , signalReset , signalEIng , signalIdle , signal9 , signalAut , signalFE , signalFR , signalEN: STD_LOGIC;

begin

--Utilizacao de 1 Instancia da Memoria ROM de Enderecos	
uut1 : rom_memory_enderecos port map ( 
           address => signalContagem,
           data => signalEndereco
      );	
		
--Utilizacao de 1 Instancia da Memoria ROM das Receitas
uut2 : rom_memory_tabela port map ( 
           address => signalTabela,
           data => signalReceita
      );	
		
--Utilizacao de 1 Instancia da Unidade Aritmetica
uut3 : Unidade_Aritmetica_4bits port map ( 
           A => signalContagem,
           EN => signalUD,
           OP => signalDU,
           S => signalReg
      );
		
--Utilizacao de 1 instancia do Registo4
uut4 : registo4 port map ( 
          D => signalReg,
          CLK => CLK,
          EN => '1',
			 RESET => signalReset,
          Q => signalContagem 
      );

--Utlizacao de 1 instancia do Registo8
uut5 : registo8 port map ( 
          D => signalMux,
          CLK => CLK,
          EN => '1',
			 RESET => Reset,
          Q => signalCounter 
      );
		
--Utilizacao de 1 instancia do Contador em Decimal
uut6 : Unidade_Aritmetica port map ( 
          A => signalCounter,
			 OP => '1',
			 EN => signalEN,
          S => signalTabela
      );
		
--Utilizacao de 1 instancia da Maquina de Estados
uut7 : Maq_Estados port map ( 
          St => Start,
          MM => Manual_Mode,
          Fe => signalFE,
          Fr => signalFR,
          Ca => Cancel,
    		 Reset => Reset,
          EIng => signalEIng,
			 CLK => CLK,
          State => signalState
      );
		
--Utilizacao de 1 Mux
uut8 : bloco_mux2_8bits port map ( 
          D0 => signalTabela,
			 D1 => signalEndereco,
			 SEL => signalIdle,
          Y => signalMux
      );
		
--Comparador c/OOh
signalFE <= (not signalCTempoEtapa(0)) and (not signalCTempoEtapa(1)) and (not signalCTempoEtapa(2)) and (not signalCTempoEtapa(3)) and (not signalCTempoEtapa(4)) and (not signalCTempoEtapa(5)) and (not signalCTempoEtapa(6)) and (not signalCTempoEtapa(7));
signalFR <= (not signalCTempoTotal(0)) and (not signalCTempoTotal(1)) and (not signalCTempoTotal(2)) and (not signalCTempoTotal(3)) and (not signalCTempoTotal(4)) and (not signalCTempoTotal(5)) and (not signalCTempoTotal(6)) and (not signalCTempoTotal(7)) and (not signalCTempoTotal(8)) and (not signalCTempoTotal(9)) and (not signalCTempoTotal(10)) and (not signalCTempoTotal(11));

--Logica Combinatória Adicional e Atribuicao de Saidas
signalUD <= Up or Down;
signalDU <= (not Down) and Up;
signalUA <= signalUD and signalIdle;
signalIdle <= (not signalState(2)) and (not signalState(1)) and (not signalState(0));
signalReset <= Reset or signal9;
signal9 <= signalReg(3) and (not signalReg(2)) and signalReg(1) and (not signalReg(0));
signalAut <= (not signalState(2)) and (not signalState(1)) and signalState(0);
signalEN <= signalAut and signalFE;
signalCTempoEtapa <= CtempoEtapa;
signalCTempoTotal <= CtempoTotal;
signalEIng <= signalFE and signalReceita(0);
Receita <= signalReceita;
State <= signalState;

end Behavioral;