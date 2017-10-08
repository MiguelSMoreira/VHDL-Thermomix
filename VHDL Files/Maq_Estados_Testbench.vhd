----------------------------------------------------------------------------------
-- Company: IST
-- Engineer: Miguel Moreira e Pedro Coimbra
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
--Ficheiro maq_estados_testbench.vhd

--Declaracao das bibliotecas
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
--Declaracao da Entidade
ENTITY Maq_Estados_Testbench IS
END Maq_Estados_Testbench;

ARCHITECTURE behavior OF Maq_Estados_Testbench IS 
 
--Declaracao do componente Maq_Estados
    COMPONENT Maq_Estados
    PORT(
         St : IN  std_logic;
         MM : IN  std_logic;
         Fe : IN  std_logic;
         Fr : IN  std_logic;
         Ca : IN  std_logic;
         Reset : IN  std_logic;
         EIng : IN  std_logic;
         CLK : IN  std_logic;
         State : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    
--Declaracao dos Sinais para o TestBench
   --Inputs
   signal St : std_logic;
   signal MM : std_logic;
   signal Fe : std_logic;
   signal Fr : std_logic;
   signal Ca : std_logic;
   signal Reset : std_logic := '0';
   signal EIng : std_logic;
   signal CLK : std_logic;

 	--Outputs
   signal State : std_logic_vector(2 downto 0);
 
BEGIN
 
--Declaracao da Unidade para Teste
   uut: Maq_Estados PORT MAP (
          St => St,
          MM => MM,
          Fe => Fe,
          Fr => Fr,
          Ca => Ca,
          Reset => Reset,
          EIng => EIng,
          CLK => CLK,
          State => State
        );
 
--Geracao dos Sinais CLK , St , MM , Fe , Fr , Ca , EIng
 
   CLK_process :process
   begin
		CLK <= '0';
		wait for 10 ns;
		CLK <= '1';
		wait for 10 ns;
   end process;

   St_process :process
   begin
		St <= '0';
		wait for 100 ns;
		St <= '1';
		wait for 20 ns;
		St <= '0';
		wait for 100 ns;
		St <= '1';
		wait for 20 ns;
		St <= '0';
		wait for 60 ns;
		St <= '1';
		wait for 20 ns;
		St <= '0';
		wait for 280 ns;
		St <= '1';
		wait;
   end process;
	
	MM_process :process
   begin
		MM <= '1';
		wait for 260 ns;
		MM <= '0';
		wait;
   end process;
	
	Fe_process :process
   begin
		Fe <= '0';
		wait for 220 ns;
		Fe <= '1';
		wait for 40 ns;
		Fe <= '0';
		wait;
   end process;
	
	Fr_process :process
   begin
		Fr <= '0';
		wait for 500 ns;
		Fr <= '1';
		wait for 500 ns;
   end process;
	
	Ca_process :process
   begin
		Ca <= '0';
		wait;
   end process;
	
	EIng_process :process
   begin
	   EIng <= '0';
		wait for 200 ns;
		EIng <= '1';
		wait for 20 ns;
   end process;
	
	Reset_process :process
   begin
	   Reset <= '1';
		wait for 15 ns;
		Reset <= '0';
		wait;
   end process;

 
END;
