----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro bloco_mux8.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da Entidade
entity bloco_mux8 is
    Port (
      	  D0 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
			  D2 : in  STD_LOGIC; 
			  D3 : in  STD_LOGIC;
			  D4 : in  STD_LOGIC;
			  D5 : in  STD_LOGIC;
			  D6 : in  STD_LOGIC;
			  D7 : in  STD_LOGIC;
			  SEL : in  STD_LOGIC_VECTOR(2 downto 0);
           Y   : out  STD_LOGIC
			  );
end bloco_mux8;

--Descricao da Arquitetura
architecture Behavioral of bloco_mux8 is

begin

Y <= D0 when sel="000" else
	  D1 when sel="001" else
	  D2 when sel="010" else
	  D3 when sel="011" else
     D4 when sel="100" else
	  D5 when sel="101" else
	  D6 when sel="110" else
	  D7 when sel="111";
	  
end Behavioral;