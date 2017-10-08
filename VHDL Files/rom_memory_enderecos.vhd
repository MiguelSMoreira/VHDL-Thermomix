----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro rom_memory_enderecos.vhd

--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da Entidade
entity rom_memory_enderecos is
    Port ( 
            address : in  STD_LOGIC_VECTOR (3 downto 0);
            data : out  STD_LOGIC_VECTOR (7 downto 0)
         );
end rom_memory_enderecos;

--Declaracao da arquitectura do Componente
architecture Behavioral of rom_memory_enderecos is

  type ram_type is array (0 to 15) 
	 of std_logic_vector(7 downto 0);
	 
	 constant InitValue: ram_type := (
      0 => "00000000",
      1 => "00000000", --(do bit mais significativo (esquerda) para o bit menos significativo (direita))
		2 => "00000100",
		3 => "00000110",
		4 => "00001001",
		5 => "00001010",
		6 => "00010011",
		7 => "00010101",
		8 => "00010110",
		9 => "00011001",
	others => "00000000" -- (todas os outros enderecos nao indicados anteriormente)
	);       
 
signal Content_d_mem: ram_type:= InitValue;

begin

data <= Content_d_mem(CONV_INTEGER(address));

end Behavioral;