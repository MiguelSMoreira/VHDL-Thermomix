----------------------------------------------------------------------------------
-- Company: Instituto Superior Tecnico
-- Engineer: 
-- Create Date:    17:13:35 11/22/2014 
-- Design Name: 
-- Module Name:    Unidade Aritmetica - Behavioral 
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
--Ficheiro Unidade_Aritmetica.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da Entidade
entity Unidade_Aritmetica_4bits is
    Port ( 
	        A : in  STD_LOGIC_VECTOR(3 downto 0);
           EN : in  STD_LOGIC;
           OP : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end Unidade_Aritmetica_4bits;

--Descricao da arquitectura do componente
architecture Behavioral of Unidade_Aritmetica_4bits is

--Declaracao do Componente
component somador4 is
port (
      A : in std_logic_vector(3 downto 0);
      B : in std_logic_vector(3 downto 0);
      ci : in std_logic;
      S : out std_logic_vector(3 downto 0);
      co : out std_logic;
      V : out std_logic
      );
end component;

--Declaracao dos Sinais Internos ao Componente
signal signalZ, signalM , signalB , signalC : STD_LOGIC;
signal signalB2 :std_logic_vector(3 downto 0);

begin

signalB2 <= signalB&signalB&signalB&signalB;

--Logica Combinatoria
signalZ <= A(0) or A(1) or A(2) or A(3);
signalM <= not (A(0) and A(1) and A(2) and A(3));
signalB <= signalZ and (not OP) and EN;
signalC <= signalM and OP and EN;

--Utilizacao de uma instancia do somador de 8 bits
UADD: somador4 port map(
                        A => A, B => signalB2, ci => signalC,
                        S => S
                       );
							  
end Behavioral;