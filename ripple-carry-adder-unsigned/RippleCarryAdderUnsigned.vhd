----------------------------------------------------------------------------------
-- Company: -
-- Engineer: Giorgio Ubbriaco
-- 
-- Create Date: 02.05.2025 20:01:33
-- Design Name: 
-- Module Name: RippleCarryAdderUnsigned - Behavioral
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

entity RippleCarryAdderUnsigned is
	generic(n: integer := 8);
	port(
		A   : in  std_logic_vector(n-1 downto 0);
		B   : in  std_logic_vector(n-1 downto 0);
		Ci  : in  std_logic;
		S   : out std_logic_vector(n downto 0)
	);
end RippleCarryAdderUnsigned;

architecture Behavioral of RippleCarryAdderUnsigned is

	component FullAdder is
		port(
			A  : in std_logic;
			B  : in std_logic; 
			Ci : in std_logic;
			S  : out std_logic; 
			Co : out std_logic
		);
	end component;
	
	signal C : std_logic_vector(n downto 0);

	begin
		
		C(0) <= Ci;
		
		for_gen: for i in 0 to n-1 generate
			FA: FullAdder port map(A(i), B(i), C(i), S(i), C(i+1));
		end generate for_gen;
		
		S(n) <= C(n);
		
end Behavioral;
