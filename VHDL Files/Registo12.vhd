----------------------------------------------------------------------------------
-- Company: Instituto Superior Tecnico
-- Engineer: 
-- Create Date:    17:13:35 11/22/2014 
-- Design Name: 
-- Module Name:    Registo12 - Behavioral 
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
--Ficheiro Registo12.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da entidade
entity Registo12 is
    Port ( 
	        D : in  STD_LOGIC_VECTOR(11 downto 0);
           CLK : in  STD_LOGIC;
           EN : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(11 downto 0)
			  );
end Registo12;

--Descricao da aquitectura do componente
architecture Behavioral of Registo12 is

--Declaracao do Componente
component mem_ffdre is
    Port ( 
	        CLK : in  STD_LOGIC;
           D   : in  STD_LOGIC;
			  R   : in  STD_LOGIC;
			  EN  : in  STD_LOGIC;
           Q   : out  STD_LOGIC
			  );
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
		
Q(3)  <= '0' when RESET='1' else 
      D(3)   when rising_edge(CLK) and EN='1';

Q(4)  <= '0' when RESET='1' else 
      D(4)   when rising_edge(CLK) and EN='1';
		
Q(5)  <= '0' when RESET='1' else 
      D(5)   when rising_edge(CLK) and EN='1';
		
Q(6)  <= '0' when RESET='1' else 
      D(6)   when rising_edge(CLK) and EN='1';

Q(7)  <= '0' when RESET='1' else 
      D(7)   when rising_edge(CLK) and EN='1';
		
Q(8)  <= '0' when RESET='1' else 
      D(8)   when rising_edge(CLK) and EN='1';
		
Q(9)  <= '0' when RESET='1' else 
      D(9)   when rising_edge(CLK) and EN='1';
		
Q(10)  <= '0' when RESET='1' else 
      D(10)   when rising_edge(CLK) and EN='1';
		
Q(11)  <= '0' when RESET='1' else 
      D(11)   when rising_edge(CLK) and EN='1';
	
end Behavioral;