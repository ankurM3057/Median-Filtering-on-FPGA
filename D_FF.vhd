----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:50:43 09/08/2018 
-- Design Name: 
-- Module Name:    D_FF - Behavioral 
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

entity D_FF is
    Port ( clk,rst : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(7 downto 0);
           Q : out  STD_LOGIC_VECTOR(7 downto 0));
end D_FF;

architecture Behavioral of D_FF is
begin
	process(clk,rst)
	variable temp:STD_LOGIC_VECTOR(7 downto 0);
	begin
	
	if(rst='1') then
		temp:="00000000";
	elsif(clk='1')then
		temp:=D;
	elsif(clk='0') then 
		Q<=temp;
	end if;	
	end process;
end Behavioral;

