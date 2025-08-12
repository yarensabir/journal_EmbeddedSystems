-- LIBRARY AND PACKAGE DECLERATIONS
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ENTITY
entity file3_fullAdder is
Port (
i_in1 : in std_logic;
i_in2 : in std_logic;
i_carry : in std_logic;
o_sum : out std_logic;
o_carry : out std_logic
);
end file3_fullAdder;

-- ARCHITECTURE
architecture Behavioral of file3_fullAdder is

-- COMPONENT DECLERATIONS
component half_adder is
Port (
i_in1 : in std_logic;
i_in2 : in std_logic;
o_sum : out std_logic;
o_carry : out std_logic
);
end component;

-- SIGNALS
signal first_sum : STD_LOGIC := '0';
signal first_carry : STD_LOGIC := '0';
signal second_carry : STD_LOGIC := '0';

-- BEGIN
begin

-- COMPONENT INSTANTIATION
first_half_adder : half_adder
 port map(
    i_in1 => i_in1,
    i_in2 => i_in2,
    o_sum => first_sum,
    o_carry => first_carry
);

second_half_adder : half_adder
 port map(
    i_in1 => first_sum,
    i_in2 => i_carry,
    o_sum => o_sum,
    o_carry => second_carry
);

-- CONCURRENT SIGNAL ASSIGNMENTS
o_carry <= first_carry or second_carry;

end Behavioral;
