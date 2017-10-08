----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Bloco_4_TestBench.vhd

--Declaracao das Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
--Descricao da Entidade
ENTITY Bloco_4_TestBench IS
END Bloco_4_TestBench;

--Arquitetura do Componente
ARCHITECTURE behavior OF Bloco_4_TestBench IS 
 
--Declaracao do Componente para Teste
 
    COMPONENT Bloco_4
    PORT(
         ContTempoEtapa : IN  std_logic_vector(7 downto 0);
         ContTempoTotal : IN  std_logic_vector(11 downto 0);
         Velocidade : IN  std_logic_vector(7 downto 0);
         Receita : IN  std_logic_vector(44 downto 0);
         Sel : IN  std_logic_vector(1 downto 0);
         State : IN  std_logic_vector(2 downto 0);
         DISPLAY : OUT  std_logic_vector(11 downto 0);
         AQUECER : OUT  std_logic;
         TempoManual : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
--Declaracao dos Sinais para o Testbench
   --Inputs
   signal ContTempoEtapa : std_logic_vector(7 downto 0);
   signal ContTempoTotal : std_logic_vector(11 downto 0);
   signal Velocidade : std_logic_vector(7 downto 0);
   signal Receita : std_logic_vector(44 downto 0);
   signal Sel : std_logic_vector(1 downto 0);
   signal State : std_logic_vector(2 downto 0);
   signal TempoManual : std_logic_vector(7 downto 0);

 	--Outputs
   signal DISPLAY : std_logic_vector(11 downto 0);
   signal AQUECER : std_logic;
 
BEGIN
 
--Declaracao da Unidade para Teste
   uut: Bloco_4 PORT MAP (
          ContTempoEtapa => ContTempoEtapa,
          ContTempoTotal => ContTempoTotal,
          Velocidade => Velocidade,
          Receita => Receita,
          Sel => Sel,
          State => State,
          DISPLAY => DISPLAY,
          AQUECER => AQUECER,
          TempoManual => TempoManual
        );
 
--Geracao dos Sinais para Teste 
   
	ContTempoEtapa_process :process
   begin
		ContTempoEtapa <= "00000000";
		wait;
   end process;
	
	ContTempoTotal_process :process
   begin
		ContTempoTotal <= "000000000001";
		wait;
   end process;
	
	Velocidade_process :process
   begin
		Velocidade <= "00000010";
		wait;
   end process;
	
	Receita_process :process
   begin
		Receita <= "101010101010101010101010101010101010101010101";
		wait;
   end process;
	
	Sel_process :process
   begin
		Sel <= "00";
		wait for 35 ns;
		Sel <= "01";
		wait for 15 ns;
		Sel <= "10";
		wait for 15 ns;
		Sel <= "11";
		wait for 15 ns;
   end process;
	
	State_process :process
   begin
		State <= "000";
		wait for 20 ns;
		State <= "001";
		wait for 20 ns;
		State <= "010";
		wait for 20 ns;
		State <= "011";
		wait for 20 ns;
		State <= "100";
		wait for 20 ns;
		State <= "101";
		wait;
   end process;
	
	TempoManual_process :process
   begin
		TempoManual <= "00000011";
		wait;
   end process;
	
END;