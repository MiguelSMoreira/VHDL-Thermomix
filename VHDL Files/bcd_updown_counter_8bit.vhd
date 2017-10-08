----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro bcd_updown_counter_8bits.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da Entidade
entity bcd_updown_counter_8bit is
    Port ( 
	        A : in  STD_LOGIC_VECTOR(7 downto 0);
           Op : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(7 downto 0);
           EN_NEXT : out  STD_LOGIC
			  );
end bcd_updown_counter_8bit;

--Descricao da Arquitetura do Componente
architecture Behavioral of bcd_updown_counter_8bit is

--Declaracao dos Componentes
component bcd_updown_counter is
    Port ( 
	        A : in  STD_LOGIC_VECTOR (3 downto 0);
			  op : in STD_LOGIC;
			  en : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
			  en_next : out STD_LOGIC
			  );
end component;

--Declaracao dos Sinais Internos
signal signalA , signalS :STD_LOGIC_VECTOR(7 downto 0);
signal signalOp , signalEN , signalEN_NEXT , signalEN_NEXT2 : STD_LOGIC;

begin

--Utilizacao de 2 instancias do componente
uut1 : bcd_updown_counter port map ( 
           A => signalA(3 downto 0),
			  op => signalOp,
			  en => signalEN,
           S => signalS(3 downto 0),
			  en_next => signalEN_NEXT
      );	

uut2 : bcd_updown_counter port map ( 
           A => signalA(7 downto 4),
			  op => signalOp,
			  en => signalEN_NEXT,
           S => signalS(7 downto 4),
			  en_next => signalEN_NEXT2
      );		
		
--Atribuicao do Valor das Saidas
S <= signalS;
EN_NEXT <= signalEn_Next2;
signalOp <= Op;
signalEN <= EN;
signalA <= A;

end Behavioral;

