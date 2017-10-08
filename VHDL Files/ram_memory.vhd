--------------------------------------------------------
-- Simple Microprocessor Design
--
-- memory.vhd
--------------------------------------------------------

library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;   
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_TEXTIO.all;

entity data_mem is
port (
		CLK      : in  std_logic;
		WE		 : in  std_logic;
		address	 : in  std_logic_vector(5 downto 0);
		data_in	 : in  std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0)
      );
end data_mem;

architecture behv of data_mem is

  type ram_type is array (0 to 63) of 
        		std_logic_vector(7 downto 0);

     constant InitValue: ram_type := (others => x"00");

signal Content_d_mem: ram_type:= InitValue;

begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if ( WE ='1' ) then
				Content_d_mem(conv_integer('0' & address)) <= data_in;
			end if;
		end if;
	end process;

	data_out <= Content_d_mem(conv_integer('0' & address));

end behv;
