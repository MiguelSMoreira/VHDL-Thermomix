-- FICHEIRO full_adder.vhd
-- Declaração de bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- Definição do nome da entidade e
-- dos sinais (fios) de entrada/saída
entity full_adder is
port (
      a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      s : out std_logic;
      cout : out std_logic
     );
end full_adder;

architecture behavior of full_adder is

-- declaração dos sinais internos
signal a_plus_b, cx, cy : std_logic;

begin
-- XOR1
a_plus_b <= a xor b;

-- XOR2
s <= cin xor a_plus_b;

-- AND1
cx <= a and b;

-- AND2
cy <= a_plus_b and cin;

-- OR1
cout <= cx or cy;

end behavior;

