----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Bloco_4.vhd

--Definicao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Descricao da Entidade
entity Bloco_4 is
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
end Bloco_4;

--Descricao da Arquitetura do Componente
architecture Behavioral of Bloco_4 is

--Declaracao dos Sinais Internos
signal signalMux , signalMux1 , signalContTempoEtapa2 , signalReceita , signalVelocidade2 , signalReceita2 , signalTempoManual : STD_LOGIC_VECTOR(11 downto 0);
signal signalVelocidade : STD_LOGIC_VECTOR(7 downto 0);
signal signal0 : STD_LOGIC_VECTOR(3 downto 0);
signal signalState : STD_LOGIC_VECTOR(2 downto 0);
signal signalAut , signalManCook , signalCook : STD_LOGIC;

begin

--Utilizacao de Multiplexers
signalMux <= signalContTempoEtapa2 when Sel="00" else
	          signalVelocidade2 when Sel="01" else
				 ContTempoTotal when Sel="10" else
	          signalReceita when Sel="11";
				  
signalMux1 <= signalReceita2 when STATE="000" else
	           signalMux when STATE="001" else
              signalMux when STATE="010" else
	           signalMux when STATE="011" else
				  signalTempoManual when STATE="100" else
	           signalVelocidade2 when STATE="101" else
				  "000000000000" when STATE="110" else
	           "000000000000" when STATE="111";

--signalContTempoEtapa2 <= signal0 & ContTempoEtapa;
signalContTempoEtapa2(11 downto 8) <= signal0;
signalContTempoEtapa2(7 downto 0) <= ContTempoEtapa;
signalReceita(11 downto 8) <= signal0;
signalReceita(7 downto 0) <= Receita(36 downto 29);
signalVelocidade2(11 downto 8) <= signal0;
signalVelocidade2(7 downto 0) <= signalVelocidade;
signalReceita2(11 downto 8) <= signal0;
signalReceita2(7 downto 0) <= Receita(44 downto 37);
signalTempoManual(11 downto 8) <= signal0;
signalTempoManual(7 downto 0) <= TempoManual;

--Logica Combinatoria Adicional e Atribuicao de Saidas
signalVelocidade <= Velocidade;
signal0 <= "0000";
signalAut <= (not signalState(2)) and (not signalState(1)) and signalState(0);
signalManCook <= (not signalState(2)) and signalState(1) and (not signalState(0));
signalCook <= signalAut or signalManCook; 
signalState <= State;
				 
AQUECER <= signalCook;
DISPLAY <= signalMux1;

end Behavioral;