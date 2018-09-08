----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:22:24 09/08/2018 
-- Design Name: 
-- Module Name:    FIFO - Behavioral 
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

entity FIFO is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end FIFO;

architecture Behavioral of FIFO is
component D_FF is
    Port ( clk,rst : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(7 downto 0);
           Q : out  STD_LOGIC_VECTOR(7 downto 0));
end component;
signal S1,S2: STD_LOGIC_VECTOR(7 downto 0);
begin

u1: D_FF port map(clk,rst,D,S1);
u2: D_FF port map(clk,rst,S1,S2);
u3: D_FF port map(clk,rst,S2,Q);

end Behavioral;

