----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:29 09/08/2018 
-- Design Name: 
-- Module Name:    MIN_COMP - Behavioral 
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

entity MIN_COMP is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           MIN : out  STD_LOGIC_VECTOR (7 downto 0));
end MIN_COMP;

architecture Behavioral of MIN_COMP is
COMPONENT D_FF is
    Port ( clk,rst : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(7 downto 0);
           Q : out  STD_LOGIC_VECTOR(7 downto 0));
end COMPONENT;

COMPONENT P_E is
    Port ( clk,rst : in  STD_LOGIC;
           A,B : in  STD_LOGIC_VECTOR (7 downto 0);
           MAX,MIN : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

signal S1,S2,S3,S4: STD_LOGIC_VECTOR (7 downto 0);
begin

U1: P_E port map(clk,rst,A,B,S1,S2);
U2: D_FF port map(clk,rst,C,S3);
U3: P_E port map(clk,rst,S2,S3,MIN,S4);

end Behavioral;

