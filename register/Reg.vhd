----------------------------------------------------------------------------------
-- Company: -
-- Engineer: Giorgio Ubbriaco
-- 
-- Create Date: 02.05.2025 17:19:01
-- Design Name: 
-- Module Name: Reg - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg is
	generic(n: integer:= 8);
	port(
		D: in std_logic_vector(n-1 downto 0);
		CLK: in std_logic;
		Q: out std_logic_vector(n-1 downto 0)
	);
end Reg;

architecture Behavioral of Reg is

	begin
		
		process(CLK)
			begin
				if rising_edge(CLK) then
					Q <= D;
				end if;
		end process;


end Behavioral;
