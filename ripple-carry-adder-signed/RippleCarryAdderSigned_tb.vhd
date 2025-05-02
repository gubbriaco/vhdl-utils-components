----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.05.2025 20:19:37
-- Design Name: 
-- Module Name: RippleCarryAdderSigned_tb - Behavioral
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
use IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RippleCarryAdderSigned_tb is
--  Port ( );
end RippleCarryAdderSigned_tb;

architecture Behavioral of RippleCarryAdderSigned_tb is

	component RippleCarryAdderSigned is
		generic(n: integer);
		port(
			A   : in  std_logic_vector(n-1 downto 0);
			B   : in  std_logic_vector(n-1 downto 0);
			Ci  : in  std_logic;
			S   : out std_logic_vector(n downto 0)
		);
	end component;
	
	constant n : integer := 8;
	
	signal CLK : std_logic := '0';
	constant T_CLK : Time := 20 ns;
	
	signal A   : std_logic_vector(n-1 downto 0) := (others=> '0');
	signal B   : std_logic_vector(n-1 downto 0) := (others=> '0');
	signal Ci  : std_logic                      := '0';
	signal S   : std_logic_vector(n downto 0);
	
	signal exp : integer := 0;
	signal err : integer := 0;
	
	begin

		
		UUT : RippleCarryAdderSigned 
		generic map(n => n)
		port map(
			A  => A,
			B  => B,
			Ci => Ci,
			S  => S
		);
		
		process_CLK: process
			begin
          wait for T_CLK/2;
				CLK <= not CLK;
		end process process_CLK;
		
		
		process_uut: process
			variable exp_var : integer;
			variable err_var : integer;
			
			begin
				
				for va in -(2**(n-1)) to (2**(n-1)-1) loop
					A <= conv_std_logic_vector(va, n);
					for vb in -(2**(n-1)) to (2**(n-1)-1) loop
						B <= conv_std_logic_vector(vb, n);
						
						Ci <= '0';
						wait for T_CLK;
						
						exp_var := va + vb + conv_integer(Ci);
						err_var := exp_var - conv_integer(signed(S));
						exp <= exp_var;
						err <= err_var;
						
						Ci <= '1';
						wait for T_CLK;
						
						exp_var := va + vb + conv_integer(Ci);
						err_var := exp_var - conv_integer(signed(S));
						exp <= exp_var;
						err <= err_var;
						
					end loop;
				end loop;
				
				wait;
				
		end process;

end Behavioral;
