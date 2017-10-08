----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Bloco_1_TestBench.vhd

--Descricao das bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
--Descricao da Entidadade
ENTITY Bloco_1_Testbench IS
END Bloco_1_Testbench;
 
--Arquitetura do Componente
ARCHITECTURE behavior OF Bloco_1_Testbench IS 
 
--Declaracao do Componente para teste
 
    COMPONENT Bloco_1
    PORT(
         CTempoTotal : IN  std_logic_vector(11 downto 0);
         CTempoEtapa : IN  std_logic_vector(7 downto 0);
         State : OUT  std_logic_vector(2 downto 0);
         Up : IN  std_logic;
         Down : IN  std_logic;
         Start : IN  std_logic;
         Manual_Mode : IN  std_logic;
         Reset : IN  std_logic;
         Cancel : IN  std_logic;
         CLK : IN  std_logic;
         Receita : OUT  std_logic_vector(44 downto 0)
        );
    END COMPONENT;
    
--Declaracao dos Sinais para o Testbench
   --Inputs
   signal CTempoTotal : std_logic_vector(11 downto 0);
   signal CTempoEtapa : std_logic_vector(7 downto 0);
   signal Up : std_logic;
   signal Down : std_logic;
   signal Start : std_logic;
   signal Manual_Mode : std_logic;
   signal Reset : std_logic;
   signal Cancel : std_logic;
   signal CLK : std_logic;

 	--Outputs
   signal State : std_logic_vector(2 downto 0);
   signal Receita : std_logic_vector(44 downto 0);
 
BEGIN
 
--Descricao da Unidade para Teste
   uut: Bloco_1 PORT MAP (
          CTempoTotal => CTempoTotal,
          CTempoEtapa => CTempoEtapa,
          State => State,
          Up => Up,
          Down => Down,
          Start => Start,
          Manual_Mode => Manual_Mode,
          Reset => Reset,
          Cancel => Cancel,
          CLK => CLK,
          Receita => Receita
        );
 
--Geracao dos Sinais para Teste 
	CLK_process :process
   begin
		CLK <= '0';
		wait for 10 ns;
		CLK <= '1';
		wait for 10 ns;
   end process;

   UP_process :process
   begin
		UP <= '0';
		wait for 25 ns;
		UP <= '1';
		wait for 5 ns;
		UP <= '0';
		wait;
   end process;
	
	DOWN_process :process
   begin
		DOWN <= '0';
		wait for 10 ns;
		DOWN <= '0';
		wait for 10 ns;
   end process;
	
	Manual_Mode_process :process
   begin
		Manual_Mode <= '0';
		wait for 10 ns;
		Manual_Mode <= '0';
		wait for 10 ns;
   end process;
	
	Start_process :process
   begin
		Start <= '0';
		wait for 220 ns;
		Start <= '1';
		wait for 10 ns;
		Start <= '0';
		wait;
   end process;
	
	Reset_process :process
   begin
	   Reset <= '1';
		wait for 15 ns;
		Reset <= '0';
		wait ;
   end process;
	
	Cancel_process :process
   begin
		Cancel <= '0';
		wait;
   end process;
	
	CTempoTotal_process :process
   begin
		CTempoTotal <= "000000000001";
		wait for 250 ns ;
		CTempoTotal <= "000000000000";
		wait;
   end process;
	
	CTempoEtapa_process :process
   begin
		CTempoEtapa <= "00110000";
		wait for 150 ns;
		CTempoEtapa <= "00000000";
		wait;
   end process;
	
END;
