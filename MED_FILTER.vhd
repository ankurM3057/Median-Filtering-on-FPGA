----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:51 09/08/2018 
-- Design Name: 
-- Module Name:    MED_FILTER - Behavioral 
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

entity MED_FILTER is                   -- median filter (MAIN CODE)
    Port ( clk,rst : in STD_LOGIC;
	   A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           VALUE : out  STD_LOGIC_VECTOR (7 downto 0));
end MED_FILTER;

architecture Behavioral of MED_FILTER is

COMPONENT FIFO is                     -- FIFO(first in first out)
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT ORDERING_COMP is
    Port ( clk : in  STD_LOGIC;	      --ordering comparator
           rst : in  STD_LOGIC;
	   A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           MAX : out  STD_LOGIC_VECTOR (7 downto 0);
           MID : out  STD_LOGIC_VECTOR (7 downto 0);
           MIN : out  STD_LOGIC_VECTOR (7 downto 0)
           );
end COMPONENT;

COMPONENT D_FF is                       -- D flip-flop
    Port ( clk,rst : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(7 downto 0);
           Q : out  STD_LOGIC_VECTOR(7 downto 0));
end COMPONENT;

COMPONENT MIN_COMP is                   -- Minimum calculator
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           MIN : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT MID_COMP is                    --Middle calculator
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           MID : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT MAX_COMP is                     --Maximum Calculator
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           MAX : out  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

signal S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15: STD_LOGIC_VECTOR (7 downto 0);          

begin

U1: FIFO port map(clk,rst,A,S1);
U2: FIFO port map(clk,rst,B,S2);
U3: FIFO port map(clk,rst,C,S3);
U4: ORDERING_COMP port map(clk,rst,S1,S2,S3,S4,S5,S6);
U5: D_FF port map(clk,rst,S4,S7);
U6: D_FF port map(clk,rst,S5,S8);
U7: D_FF port map(clk,rst,S6,S9);
U8: D_FF port map(clk,rst,S7,S10);
U9: D_FF port map(clk,rst,S8,S11);
U10: D_FF port map(clk,rst,S9,S12);
U11: MIN_COMP port map(clk,rst,S4,S7,S10,S13);
U12: MID_COMP port map(clk,rst,S5,S8,S11,S14);
U13: MAX_COMP port map(clk,rst,S6,S9,S12,S15);
U14: MID_COMP port map(clk,rst,S13,S14,S15,VALUE);


end Behavioral;

