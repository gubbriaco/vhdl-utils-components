----------------------------------------------------------------------------------
-- Company: -
-- Engineer: Giorgio Ubbriaco
-- 
-- Create Date: 02.05.2025 18:48:21
-- Design Name: 
-- Module Name: HalfAdder_tb - Behavioral
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

entity HalfAdder_tb is
--  Port ( );
end HalfAdder_tb;

architecture Behavioral of HalfAdder_tb is

	component HalfAdder is
		port(
			A, B: in std_logic;
			S, Co: out std_logic
		);
	end component;
	
	signal A  : std_logic := '0';
	signal B  : std_logic := '0';
	signal S  : std_logic; 
	signal Co : std_logic;
	
	signal eA    : integer := 0;
	signal eB    : integer := 0;
	signal eS    : integer := 0;
	signal eCo   : integer := 0;
	signal errS  : integer := 0;
	signal errCo : integer := 0;

	begin
	
		UUT: HalfAdder 
		port map(
			A  => A,
			B  => B,
			S  => S,
			Co => Co
		);
		
		process
				begin
					
					-- Generate all 4 combinations for A, B
					-- A	 <= (i / 2) mod 2	-> (MSB)
					-- B	 <= i mod 2			-> (LSB)
					-- example: combination 10 -> A=1, B=0
					for i in 0 to 3 loop
						eA  <= (i/2) mod 2;
						eB  <= i mod 2;
						
						eS  <= (eA + eB) mod 2;
						eCo <= (eA + eB) / 2;
						
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
