----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Bloco_2_TestBench.vhd

--Declaracao das Bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
--Descricao da Entidade
ENTITY Bloco_2_TestBench IS
END Bloco_2_TestBench;

--Arquitetura do Componente
ARCHITECTURE behavior OF Bloco_2_TestBench IS 
 
--Declaracao do Componente para teste
 
    COMPONENT Bloco_2
    PORT(
         TIMEOUT1 : IN  std_logic;
         State : IN  std_logic_vector(2 downto 0);
         Receita : IN  std_logic_vector(44 downto 0);
         TempoManual : IN  std_logic_vector(7 downto 0);
         CTempoEtapa : OUT  std_logic_vector(7 downto 0);
         CTempoTotal : OUT  std_logic_vector(11 downto 0);
         Manual_Mode : IN  std_logic;
         CLK : IN  std_logic;
         RESET : IN  std_logic
        );
    END COMPONENT;
    
--Declaracao dos Sinais para o Testbench
   --Inputs
   signal TIMEOUT1 : std_logic;
   signal State : std_logic_vector(2 downto 0);
   signal Receita : std_logic_vector(44 downto 0);
   signal TempoManual : std_logic_vector(7 downto 0);
   signal Manual_Mode : std_logic;
   signal CLK : std_logic;
   signal RESET : std_logic;

 	--Outputs
   signal CTempoEtapa : std_logic_vector(7 downto 0);
   signal CTempoTotal : std_logic_vector(11 downto 0);
 
BEGIN
 
--Declaracao da Unidade para Teste
   uut: Bloco_2 PORT MAP (
          TIMEOUT1 => TIMEOUT1,
          State => State,
          Receita => Receita,
          TempoManual => TempoManual,
          CTempoEtapa => CTempoEtapa,
          CTempoTotal => CTempoTotal,
          Manual_Mode => Manual_Mode,
          CLK => CLK,
          RESET => RESET
        );
 
--Geracao dos Sinais para Teste 
	CLK_process :process
   begin
		CLK <= '0';
		wait for 10 ns;
		CLK <= '1';
		wait for 10 ns;
   end process;

   TIMEOUT1_process :process
   begin
	   TIMEOUT1 <= '0';
		wait for 25 ns;
		TIMEOUT1 <= '1';
		wait for 5 ns;
		TIMEOUT1 <= '0';
		wait for 15 ns;
		TIMEOUT1 <= '1';
		wait for 5 ns;
		TIMEOUT1 <= '0';
		wait for 15 ns;
		TIMEOUT1 <= '1';
		wait for 5 ns;
		TIMEOUT1 <= '0';
		wait;
   end process;
	
	State_process :process
   begin
		State <= "000";
		wait for 300 ns;
		State <= "001";
		wait for 300 ns;
		State <= "011";
		wait for  20 ns;
		State <= "001";
		wait for 300 ns;
	   State <= "001";
		wait for 300 ns;
   end process;
	
	Receita_process :process
   begin
		Receita <= "101010101010101010101010101010101010101010101";
		wait;
   end process;
	
	TempoManual_process :process
   begin
		TempoManual <= "10010001";
		wait;
   end process;
	
	Manual_Mode_process :process
   begin
		Manual_Mode <= '0';
		wait for 300 ns ;
		Manual_Mode <= '0';
		wait;
   end process;
	
	RESET_process :process
   begin
		RESET <= '1';
		wait for 10 ns;
		RESET <= '0';
		wait;
   end process;
	
END;