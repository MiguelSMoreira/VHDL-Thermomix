-- FICHEIRO somador4.vhd

-- Declaração de bibliotecas
library IEEE;
use IEEE.std_logic_1164.all;

-- Definição da entidade/sinais de entrada/saída
entity somador4 is
port (
      A : in std_logic_vector(3 downto 0);
      B : in std_logic_vector(3 downto 0);
      ci : in std_logic;
      S : out std_logic_vector(3 downto 0);
      co : out std_logic;
      V : out std_logic
      );
end somador4;

architecture behavior of somador4 is

-- declaração do componente full_adder
component full_adder
port (
      a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      s : out std_logic;
      cout : out std_logic
      );
end component;

-- declaração dos sinais internos
-- C(i) corresponde ao carry-out do full-adder
-- i-1, e serve como carry-in do
-- full-adder i
signal C : std_logic_vector(4 downto 0);

begin

-- atribuição do valor de C(0)
C(0) <= ci;

-- simplificação (opcional) da utilização das
-- várias instancias
uGen1 : for i in 0 to 3 generate
UFA0: full_adder port map(
a=>A(i) , b=>B(i) , cin=>C(i) ,
s=>S(i) , cout=>C(i+1)
);
end generate;

end behavior;

