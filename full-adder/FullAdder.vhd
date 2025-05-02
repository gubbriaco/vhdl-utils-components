----------------------------------------------------------------------------------
-- Company: -
-- Engineer: Giorgio Ubbriaco
-- 
-- Create Date: 02.05.2025 17:23:29
-- Design Name: 
-- Module Name: FullAdder - Behavioral
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

entity FullAdder is
	port(
		A, B, Ci: in std_logic;
		S, Co: out std_logic
	);
end FullAdder;

architecture Behavioral of FullAdder is
	
	signal P, G: std_logic;
	
	begin
		
		P <= A xor B;
		G <= A and B;
		
		S <= P xor Ci;
		Co <= G or (P and Ci);


end Behavioral;
