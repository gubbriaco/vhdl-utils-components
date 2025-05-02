----------------------------------------------------------------------------------
-- Company: -
-- Engineer: Giorgio Ubbriaco
-- 
-- Create Date: 02.05.2025 17:32:40
-- Design Name: 
-- Module Name: FullAdder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdder_tb is
--  Port ( );
end FullAdder_tb;

architecture Behavioral of FullAdder_tb is

	component FullAdder is
		port(
			A  : in std_logic;
			B  : in std_logic; 
			Ci : in std_logic;
			S  : out std_logic; 
			Co : out std_logic
		);
	end component;
	
	signal A  : std_logic := '0';
	signal B  : std_logic := '0';
	signal Ci : std_logic := '0';
	signal S  : std_logic; 
	signal Co : std_logic;
	
	signal eA    : integer := 0;
	signal eB    : integer := 0;
	signal eCi   : integer := 0;
	signal eS    : integer := 0;
	signal eCo   : integer := 0;
	signal errS  : integer := 0;
	signal errCo : integer := 0;

	begin
		
		UUT: FullAdder 
		port map(
			A,
			B,
			Ci,
			S,
			Co
		);
		
			process
				begin
					
					-- Generate all 8 combinations for A, B, Ci
					-- A	 <= (i / 4) mod 2	-> (MSB)
					-- B	 <= (i / 2) mod 2	-> (middle bit)
					-- Ci <= i mod 2			-> (LSB)
					-- example: combination 101 -> A=1, B=0, Ci=1
					for i in 0 to 7 loop
						eA  <= (i/4) mod 2;
						eB  <= (i/2) mod 2;
						eCi <= i  mod 2;
						
						eS  <= (eA + eB + eCi) mod 2;
						eCo <= (eA + eB + eCi) / 2;
						
						if eA = 0 then
							A  <= '0';
						else
							A  <= '1';
						end if;
						
						if eB = 0 then
							B  <= '0';
						else
							B  <= '1';
						end if;
						
						if eCi = 0 then
							Ci  <= '0';
						else
							Ci  <= '1';
						end if;
						 
						wait for 10 ns;
						
						if (conv_integer(S) /= eS) then
							errS <= 1;
						else
							errS <= 0;
						end if;
						
						if (conv_integer(Co) /= eCo) then
							errCo <= 1;
						else
							errCo <= 0;
						end if;
							
					end loop;
					
					wait;
					
			end process;


end Behavioral;
