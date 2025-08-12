library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity file2_half_adder is
Port (
i_in1 : in std_logic;
i_in2 : in std_logic;
o_sum : out std_logic;
o_carry : out std_logic
);
end file2_half_adder;

architecture Behavioral of file2_half_adder is
begin
o_sum <= i_in1 xor i_in2;
o_carry <= i_in1 and i_in2;

end Behavioral;
