----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:02:52 11/02/2013 
-- Design Name: 
-- Module Name:    ANDGATE2 - Behavioral 
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
--Declaracao das Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Declaracao da Entidade
entity bloco_mux2_8bits is
    Port ( D0 : in  STD_LOGIC_VECTOR(7 downto 0);
           D1 : in  STD_LOGIC_VECTOR(7 downto 0);
			  SEL : in  STD_LOGIC;
           Y   : out  STD_LOGIC_VECTOR(7 downto 0));
end bloco_mux2_8bits;

--Descricao da Arquitetura
architecture Behavioral of bloco_mux2_8bits is

begin

Y <= D0 when sel='0' else
	  D1 when sel='1';

end Behavioral;

