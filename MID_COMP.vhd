----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:34 09/08/2018 
-- Design Name: 
-- Module Name:    MID_COMP - Behavioral 
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

entity MID_COMP is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           MID : out  STD_LOGIC_VECTOR (7 downto 0));
end MID_COMP;

architecture Behavioral of MID_COMP is
component D_FF is
    Port ( clk,rst : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(7 downto 0);
           Q : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

component P_E is
    Port ( clk,rst : in  STD_LOGIC;
           A,B : in  STD_LOGIC_VECTOR (7 downto 0);
           MAX,MIN : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
signal S1,S2,S3,S4,S5,S6,S7,S8: STD_LOGIC_VECTOR (7 downto 0);

begin

u1: P_E port map(clk,rst,A,B,S1,S2);
u2: D_FF port map(clk,rst,C,S3);
u3: D_FF port map(clk,rst,S1,S4);	
u4: P_E port map(clk,rst,S2,S3,S5,S6);
u5: P_E port map(clk,rst,S4,S5,S7,MID);
u6: D_FF port map(clk,rst,S6,S8);


end Behavioral;

