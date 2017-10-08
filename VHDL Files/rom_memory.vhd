----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro rom_memory.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da Entidade
entity rom_memory is
    Port ( 
            address : in  STD_LOGIC_VECTOR (2 downto 0);
            data : out  STD_LOGIC_VECTOR (15 downto 0)
         );
end rom_memory;

--Declaracao da arquitectura do Componente
architecture Behavioral of rom_memory is

  type ram_type is array (0 to 7) 
	 of std_logic_vector(15 downto 0);

     constant InitValue: ram_type := (
		0 => "00" & "00" & "000" & "100" & "001" & "100", --(do bit mais significativo (esquerda) para o bit menos significativo (direita))
		1 => "01" & "01" & "001" & "000" & "011" & "000",
		2 => "10" & "00" & "010" & "010" & "000" & "000",
		3 => "00" & "00" & "011" & "011" & "001" & "001",
		4 => "00" & "00" & "100" & "100" & "101" & "101",
		5 => "00" & "10" & "101" & "100" & "010" & "100",
	others => "0000000000000000" -- (todas os outros enderecos nao indicados anteriormente)
	);       
 
signal Content_d_mem: ram_type:= InitValue;

begin

data <= Content_d_mem(CONV_INTEGER(address));

end Behavioral;