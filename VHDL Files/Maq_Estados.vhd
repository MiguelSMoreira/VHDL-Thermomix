----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro maq_estados.vhd

--Descricao das bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Declaracao da Entidade
entity Maq_Estados is
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
end Maq_Estados;

-- Descricao da arquitectura do componente
architecture Behavioral of Maq_Estados is

--Declaracao dos Componentes
component rom_memory is
    Port (
	        address : in  STD_LOGIC_VECTOR (2 downto 0);
           data : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end component;

component registo3 is
    Port ( 
	        D : in  STD_LOGIC_VECTOR(2 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(2 downto 0)
			  );
end component;

component bloco_mux4 is
    Port ( 
	        D0 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
			  D2 : in STD_LOGIC; 
			  D3 : in STD_LOGIC;
			  SEL : in  STD_LOGIC_VECTOR(1 downto 0);
           Y   : out  STD_LOGIC
			  );
end component;

component bloco_mux4_3bits is
    Port ( 
	        D0 : in  STD_LOGIC_VECTOR(2 downto 0);
           D1 : in  STD_LOGIC_VECTOR(2 downto 0);
			  D2 : in STD_LOGIC_VECTOR(2 downto 0); 
			  D3 : in STD_LOGIC_VECTOR(2 downto 0);
			  SEL : in  STD_LOGIC_VECTOR(1 downto 0);
           Y   : out  STD_LOGIC_VECTOR(2 downto 0)
			  );
end component;

--Declaracao dos Sinais Internos ao Componente
signal signalD: STD_LOGIC_VECTOR(15 downto 0);
signal signalSTATE , signalNSTATE : STD_LOGIC_VECTOR(2 downto 0);
signal signalC : STD_LOGIC_VECTOR (1 downto 0);
signal signalEIng : STD_LOGIC;

begin

--Utilizacao de 1 Instancia de ROM
uut : rom_memory port map ( 
           address => signalSTATE,
           data => signalD
      );
		
--Utilizacao de 3 Instancias de Multiplexers(4:1)
uut1 : bloco_mux4 port map ( 
           D0 => St,
           D1 => signalEIng,
			  D2 => Fe,
			  D3 => '0',
			  SEL => signalD(15 downto 14),
           Y => signalC(1)
      );
	
uut2 : bloco_mux4 port map ( 
           D0 => MM,
           D1 => Fr,
			  D2 => Ca,
			  D3 => '1',
			  SEL => signalD(13 downto 12),
           Y => signalC(0)
      );

uut3 : bloco_mux4_3bits port map ( 
           D0 => signalD(11 downto 9),
           D1 => signalD(8 downto 6),
			  D2 => signalD(5 downto 3),
			  D3 => signalD(2 downto 0),
			  SEL => signalC(1 downto 0),
           Y => signalNSTATE
      );
		
--Utilizacao de 1 Instancia de Registo
uut4 : registo3 port map ( 
           D => signalNSTATE,
           CLK => CLK,
           EN => '1',
			  RESET => Reset,
           Q => signalSTATE
      );
		
--Logica Combinatoria Adicional
signalEIng <= Fe and EIng;

--Atribuicao da Saida
State <= signalSTATE;

end Behavioral;