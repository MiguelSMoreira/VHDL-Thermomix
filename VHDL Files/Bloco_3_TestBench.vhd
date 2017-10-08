----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Bloco_3_TestBench.vhd

--Descricao das bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

--Descricaod da Entidade
ENTITY Bloco_3_TestBench IS
END Bloco_3_TestBench;
 
--Architetura do Componente
ARCHITECTURE behavior OF Bloco_3_TestBench IS 
 
--Declaracao do Componente para Teste
 
    COMPONENT Bloco_3
    PORT(
         TIMEOUT64 : IN  std_logic;
         UP : IN  std_logic;
         DOWN : IN  std_logic;
         ManualMode : IN  std_logic;
         State : IN  std_logic_vector(2 downto 0);
         Velocidade : OUT  std_logic_vector(7 downto 0);
         TempoManual : OUT  std_logic_vector(7 downto 0);
         LEDS : OUT  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         Receita : IN  std_logic_vector(44 downto 0);
         RESET : IN  std_logic
        );
    END COMPONENT;
    
--Declaracao dos Sinais para o TesteBench
   --Inputs
   signal TIMEOUT64 : std_logic;
   signal UP : std_logic;
   signal DOWN : std_logic;
   signal ManualMode : std_logic;
   signal State : std_logic_vector(2 downto 0);
   signal CLK : std_logic;
   signal Receita : std_logic_vector(44 downto 0);
   signal RESET : std_logic;

 	--Outputs
   signal Velocidade : std_logic_vector(7 downto 0);
   signal TempoManual : std_logic_vector(7 downto 0);
   signal LEDS : std_logic_vector(7 downto 0);
 
BEGIN
 
--Declaracao da Unidade para Teste
   uut: Bloco_3 PORT MAP (
          TIMEOUT64 => TIMEOUT64,
          UP => UP,
          DOWN => DOWN,
          ManualMode => ManualMode,
          State => State,
          Velocidade => Velocidade,
          TempoManual => TempoManual,
          LEDS => LEDS,
          CLK => CLK,
          Receita => Receita,
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
	
	UP_process :process
   begin
		UP <= '0';
		wait for 60 ns;
		UP <= '1';
		wait for 20 ns;
		UP <= '0';
		wait for 15 ns;
		UP <= '1';
		wait for 20 ns;
		UP <= '0';
		wait for 15 ns;
		UP <= '1';
		wait for 20 ns;
		UP <= '0';
		wait for 100 ns;
		UP <= '1';
		wait for 20 ns;
		UP <= '0';
		wait for 330 ns;
		UP <= '1';
		wait for 20 ns;
		UP <= '0';
		wait;
   end process;
	
	DOWN_process :process
   begin
		DOWN <= '0';
		wait;
   end process;
	
	ManualMode_process :process
   begin
		ManualMode <= '1';
		wait for 400 ns;
		ManualMode <= '0';
		wait for 400 ns;
   end process;
	
	State_process :process
   begin
	   State <= "000";
		wait for 50 ns;
		State <= "100";
		wait for 150 ns;
		State <= "101";
		wait for 100 ns;
		State <= "010";
		wait for 100 ns;
		State <= "000";
		wait for 150 ns;
		State <= "001";
		wait for 200 ns;
   end process;
	
	Receita_process :process
   begin
		Receita <= "010101010101010101010101010101010101010101010";
		wait for 10 ns;
		Receita <= "010101010101010101010101010101010101010101010";
		wait for 10 ns;
   end process;
	
	RESET_process :process
   begin
		RESET <= '1';
		wait for 10 ns;
		RESET <= '0';
		wait;
   end process;
	
	TIMEOUT64_process :process
   begin
		TIMEOUT64 <= '0';
		wait for 1000 ns;
		TIMEOUT64 <= '1';
		wait for 10 ns;
   end process;

END;
