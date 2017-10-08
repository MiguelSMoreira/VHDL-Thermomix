----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Registo3.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da entidade
entity Registo3 is
    Port ( 
	        D : in  STD_LOGIC_VECTOR(2 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(2 downto 0)
			  );
end Registo3;

--Descricao da aquitectura do componente
architecture Behavioral of Registo3 is

--Declaracao do Componente
component mem_ffdre is
    Port ( CLK : in  STD_LOGIC;
           D   : in  STD_LOGIC;
			  R   : in  STD_LOGIC;
			  EN  : in  STD_LOGIC;
           Q   : out  STD_LOGIC);
end component;

--Declaracao dos Sinais Internos ao Componente

begin

--Utilizacao de oito FlipFlops D
Q(0)  <= '0' when RESET='1' else 
      D(0)   when rising_edge(CLK) and EN='1';

Q(1)  <= '0' when RESET='1' else 
      D(1)   when rising_edge(CLK) and EN='1';
		
Q(2)  <= '0' when RESET='1' else 
      D(2)   when rising_edge(CLK) and EN='1';
		
end Behavioral;