----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.08.2025 20:45:52
-- Design Name: 
-- Module Name: and1 - Behavioral
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

entity and1 is 
    Port ( i_in1 : in STD_LOGIC;
           i_in2 : in STD_LOGIC;
           o_out : out STD_LOGIC);
end and1;

architecture Behavioral of and1 is

begin

o_out <= i_in1 and i_in2;

end Behavioral;
