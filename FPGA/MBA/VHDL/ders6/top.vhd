library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    generic(
        N : integer := 8
    );
    port(
        SW : in STD_LOGIC_VECTOR (15 downto 0);
        BTNL : in STD_LOGIC;
        LED : out STD_LOGIC_VECTOR (8 downto 0)
    );
end top;

architecture Behavioral of top is

    -- COMPONENT DECLERATIONS
    component file3_NbitAdder  is
        generic (
            N : integer := 8
        );
        port(
            i_in1 : in std_logic_vector (N-1 downto 0);
            i_in2 : in std_logic_vector (N-1 downto 0);
            i_carry : in std_logic;
            o_sum : out std_logic_vector (N-1 downto 0);
            o_carry : out std_logic
        );
    end component;
begin
    -- COMPONENT INSTANTIATION
    nbit_adder_i : file3_NbitAdder
    generic map(N => N)
    port map (
        i_in1 => SW(7 downto 0),
        i_in2 => SW(15 downto 8),
        i_carry => BTNL,
        o_sum => LED(7 downto 0),
        o_carry => LED(8)
    );

end Behavioral;
