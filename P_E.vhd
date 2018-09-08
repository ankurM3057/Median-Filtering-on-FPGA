----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:29 09/08/2018 
-- Design Name: 
-- Module Name:    P_E - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P_E is
    Port ( clk,rst : in  STD_LOGIC;
           A,B : in  STD_LOGIC_VECTOR (7 downto 0);
           MAX,MIN : out  STD_LOGIC_VECTOR (7 downto 0));
end P_E;

architecture Behavioral of P_E is
begin
	process(clk,rst)
	begin
		if(rst='1') then
			MAX<="00000000";
			MIN<="00000000";
		elsif(clk'event and clk='1') then
			if(A>B)then
				MAX<=A;
				MIN<=B;
			else
				MAX<=B;
				MIN<=A;
			end if;
		end if;
	end process;	
end Behavioral;
