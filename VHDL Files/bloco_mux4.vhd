----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro bloco_mux4.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da Entidade
entity bloco_mux4 is
    Port (
      	  D0 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
			  D2 : in STD_LOGIC; 
			  D3 : in STD_LOGIC;
			  SEL : in  STD_LOGIC_VECTOR(1 downto 0);
           Y   : out  STD_LOGIC
			  );
end bloco_mux4;

--Descricao da Arquitetura
architecture Behavioral of bloco_mux4 is

begin

Y <= D0 when sel="00" else
	  D1 when sel="01" else
	  D2 when sel="10" else
	  D3 when sel="11";

end Behavioral;