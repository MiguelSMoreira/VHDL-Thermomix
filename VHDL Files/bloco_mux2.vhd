----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro bloco_mux2.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da Entidade
entity bloco_mux2 is
    Port (
      	  D0 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
			  SEL : in  STD_LOGIC;
           Y   : out  STD_LOGIC
			  );
end bloco_mux2;

--Descricao da Arquitetura
architecture Behavioral of bloco_mux2 is

begin

Y <= D0 when sel="0" else
	  D1 when sel="1" else
	  
end Behavioral;