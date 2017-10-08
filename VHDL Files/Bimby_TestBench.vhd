----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro Bimby_Testbench.vhd

--Descricao das bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
--Declaracao da Entidade
ENTITY Bimby_TestBench IS
END Bimby_TestBench;
 
ARCHITECTURE behavior OF Bimby_TestBench IS 
 
--Declaracao do Componente para teste Bimby
    COMPONENT Bimby
    PORT(
         Display : OUT  std_logic_vector(11 downto 0);
         Velocidade : OUT  std_logic_vector(7 downto 0);
         Leds : OUT  std_logic_vector(7 downto 0);
         Aquecer : OUT  std_logic;
         Reset : IN  std_logic;
         Up : IN  std_logic;
         Down : IN  std_logic;
         Cancel : IN  std_logic;
         Start : IN  std_logic;
         ManualMode : IN  std_logic;
         Sel : IN  std_logic_vector(1 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    
--Declaracao dos Sinais para o TestBench
   --Inputs
   signal Reset : std_logic;
   signal Up : std_logic;
   signal Down : std_logic;
   signal Cancel : std_logic;
   signal Start : std_logic;
   signal ManualMode : std_logic;
   signal Sel : std_logic_vector(1 downto 0);
   signal CLK : std_logic;

 	--Outputs
   signal Display : std_logic_vector(11 downto 0);
   signal Velocidade : std_logic_vector(7 downto 0);
   signal Leds : std_logic_vector(7 downto 0);
   signal Aquecer : std_logic;
 
BEGIN
 
--Declaracao da Unidade para Teste
   uut: Bimby PORT MAP (
          Display => Display,
          Velocidade => Velocidade,
          Leds => Leds,
          Aquecer => Aquecer,
          Reset => Reset,
          Up => Up,
          Down => Down,
          Cancel => Cancel,
          Start => Start,
          ManualMode => ManualMode,
          Sel => Sel,
          CLK => CLK
        );
 
--Geracao dos Sinais CLK , RESET , UP , DOWN , CANCEL , START , ManualMode , SEL

   CLK_process :process
   begin
		CLK <= '0';
		wait for 10 ns;
		CLK <= '1';
		wait for 10 ns;
   end process;
 
   SEL_process :process
   begin
		SEL <= "01";
		wait for 10 ns;
		SEL <= "01";
		wait for 10 ns;
   end process;
	
	ManualMode_process :process
   begin
		ManualMode <= '0';
		wait for 200 ns;
		ManualMode <= '1';
		wait;
   end process;
	
	START_process :process
   begin
		START <= '0';
		wait for 100 ns;
		START <= '1';
		wait for 10 ns;
		START <= '0';
		wait for 40 ns;
		START <= '1';
		wait for 10 ns;
		START <= '0';
		wait for 140 ns;
		START <= '1';
		wait for 10 ns;
		START <= '0';
		wait for 90 ns;
		START <= '1';
		wait for 10 ns;
		START <= '0';
		wait;
   end process;
	
	RESET_process :process
   begin
		RESET <= '1';
		wait for 15 ns;
		RESET <= '0';
		wait;
   end process;
	
	CANCEL_process :process
   begin
		CANCEL <= '0';
		wait for 10 ns;
		CANCEL <= '0';
		wait for 10 ns;
   end process;
	
	UP_process :process
   begin
		UP <= '0';
		wait for 20 ns;
		UP <= '1';
		wait for 15 ns;
		UP <= '0';
		wait for 10 ns;
		UP <= '1';
		wait for 15 ns;
		UP <= '0';
		wait for 10 ns;
		UP <= '1';
		wait for 20 ns;
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
	
END;