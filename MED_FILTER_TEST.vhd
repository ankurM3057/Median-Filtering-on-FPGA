
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:49:39 09/08/2018
-- Design Name:   MED_FILTER
-- Module Name:   MED_FILTER_TEST.vhd
-- Project Name:  MEDIAN_FILTERING
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MED_FILTER
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY MED_FILTER_TEST_vhd IS
END MED_FILTER_TEST_vhd;

ARCHITECTURE behavior OF MED_FILTER_TEST_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT MED_FILTER
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		A : IN std_logic_vector(7 downto 0);
		B : IN std_logic_vector(7 downto 0);
		C : IN std_logic_vector(7 downto 0);          
		VALUE : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL rst :  std_logic := '0';
	SIGNAL A :  std_logic_vector(7 downto 0) := (others=>'0');
	SIGNAL B :  std_logic_vector(7 downto 0) := (others=>'0');
	SIGNAL C :  std_logic_vector(7 downto 0) := (others=>'0');

	--Outputs
	SIGNAL VALUE :  std_logic_vector(7 downto 0);
	constant time_period: time:= 10ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: MED_FILTER PORT MAP(
		clk => clk,
		rst => rst,
		A => A,
		B => B,
		C => C,
		VALUE => VALUE
	);

	clk_process : PROCESS
	BEGIN
	
	 clk<='0';
	 wait for time_period/2;
	 clk<='1';
	 wait for time_period/2;
	
	END PROCESS;
	
	tb : PROCESS
	BEGIN
		
		rst<= '1' after 0 ns, '0' after 10 ns;
		A<= "00000001" after 10ns,"00000010" after 20ns,"00000011" after 30ns;
		B<= "00000100" after 10ns,"00000101" after 20ns,"00000110" after 30ns;
		C<= "00000111" after 10ns,"00001000" after 20ns,"00001001" after 30ns;

		wait; -- will wait forever
	END PROCESS;

END;
