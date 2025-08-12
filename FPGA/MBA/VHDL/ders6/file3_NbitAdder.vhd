library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity file3_NbitAdder is
    generic(
        N : integer := 4
    );
    Port (
        i_in1 : in std_logic_vector (N-1 downto 0);
        i_in2 : in std_logic_vector (N-1 downto 0);
        i_carry : in std_logic;
        o_sum : out std_logic_vector (N-1 downto 0);
        o_carry : out std_logic

    );
end file3_NbitAdder;

-- ARCHITECTURE
architecture Behavioral of file3_NbitAdder is

-- COMPONENT DECLERATIONS
component file3_fullAdder is
Port (
i_in1 : in std_logic;
i_in2 : in std_logic;
i_carry : in std_logic;
o_sum : out std_logic;
o_carry : out std_logic
);
end component;

-- SIGNALS
signal temp : STD_LOGIC_VECTOR (N downto 0) := (others => '0');

-- BEGIN
begin

    temp(0) <= i_carry;
    o_carry <= temp(N);

    FULL_ADDER_GEN: for k in 0 to N-1 generate
        full_adder_k : file3_fullAdder
        port map (
            i_in1 => i_in1(k),
            i_in2 => i_in2(k),
            i_carry => temp(k),
            o_sum => o_sum(k),
            o_carry => temp(k+1)
        );
        end generate;

end Behavioral;
