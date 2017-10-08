----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro bloco_mux4_3bits.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da Entidade
entity bloco_mux4_3bits is
    Port ( 
	        D0 : in  STD_LOGIC_VECTOR(2 downto 0);
           D1 : in  STD_LOGIC_VECTOR(2 downto 0);
			  D2 : in STD_LOGIC_VECTOR(2 downto 0); 
			  D3 : in STD_LOGIC_VECTOR(2 downto 0);
			  SEL : in  STD_LOGIC_VECTOR(1 downto 0);
           Y   : out  STD_LOGIC_VECTOR(2 downto 0)
			  );
end bloco_mux4_3bits;

--Descricao da Arquitetura
architecture Behavioral of bloco_mux4_3bits is

begin

Y <= D0 when sel="00" else
	  D1 when sel="01" else
	  D2 when sel="10" else
	  D3 when sel="11";

end Behavioral;