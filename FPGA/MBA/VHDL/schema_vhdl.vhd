----------------------------------------------------------------------------------
-- LIBRARY AND PACKAGE DECLERATIONS
----------------------------------------------------------------------------------
-- standard pagkages
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- user defined packages
-- use work.PCK_MYPACKAGE.ALL;

----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
entity schema_vhdl is
generic(
c_clkfreq : integer := 100_000_000;
c_sclkfreq : integer := 1_000_000;
c_i2cfreq : integer := 400_000;
c_bitnum : integer := 8;
c_is_sim : boolean := false;
c_cfgr_reg : std_logic_vector (7 downto 0):= x"A3"
);
Port (
i_input1 : in std_logic_vector (c_bitnum-1 downto 0);
i_input2 : in std_logic;
o_output1 : out std_logic;
o_output2 : out std_logic_vector (1 downto 0);
inout1_io : inout std_logic_vector (15 downto 0);
inout2_io : inout std_logic
);
end schema_vhdl;

----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
architecture Behavioral of schema_vhdl is -- behavioral yerine başka bir keyword kullanılabilir

----------------------------------------------------------------------------------
-- CONSTANTS
----------------------------------------------------------------------------------
constant c_constant1 : integer := 30;
constant c_timer1mslim : integer := c_clkfreq/1000;
constant c_constant2 : std_logic_vector (c_bitnum-1 downto 0) := (others => '0');

----------------------------------------------------------------------------------
-- COMPONENT DECLERATIONS
----------------------------------------------------------------------------------
component my_component is
generic(
gen1 : integer :=10;
gen2 : std_logic := '0'
);
port (
in1 : std_logic_vector (c_bitnum-1 downto 0);
out1 : std_logic
);
end component my_component;

----------------------------------------------------------------------------------
-- TYPES
----------------------------------------------------------------------------------
type t_state is (S_START, S_OPERATION, S_TERMINATE, S_IDLE);
-- subtype is a type with constraint
subtype t_byte is bit_vector (7 downto 0);
subtype t_decimal_digit is integer range 0 to 9;
--record
type my_record_type is record
    param1 : std_logic;
    param2 : std_logic_vector (3 downto 0);
end record;

----------------------------------------------------------------------------------
-- SIGNALS
----------------------------------------------------------------------------------
-- iç sinyaller
signal s0 : std_logic_vector (7 downto 0);
signal s1 : std_logic_vector (7 downto 0) := x"00";
signal s2 : integer range 0 to 255 := 0;
signal s3 : integer := 0;
signal s4 : std_logic := '0';

signal state : t_state := S_START;
signal bcd : t_decimal_digit := 0;
signal opcode : t_byte := x"BA";
signal s_record : my_record_type;

----------------------------------------------------------------------------------
-- BEGIN
----------------------------------------------------------------------------------
begin

----------------------------------------------------------------------------------
-- COMPONENT INSTANTIATION
----------------------------------------------------------------------------------
mycomp1 : my_component --yukarıda tanımı yapılan komponentin instantiate edilmesi, sinyallerinin bağlanması
generic map(
gen1 => c_i2cfreq,
gen2 => '0'
)
port map(
in1 => i_input1,
out1 => o_output1
);

----------------------------------------------------------------------------------
-- CONCURRENT ASSIGNMENTS
----------------------------------------------------------------------------------
s1 <= x"01" when s0 < 30 else
      x"02" when s0 < 40 else
      x"03";
      
with state select
s0 <= x"01" when S_START,
      x"02" when S_OPERATION,
      x"03" when S_TERMINATE,
      x"04" when others;
      
s3 <= 5 + 2;
s4 <= i_input1(3) and i_input(2) xor i_input2;
-- s4 <= ... -- multiple driven net error, bir hatta iki tanım yapamazsın

s_record.param1 <= '0';
s_record.param2 <= "0101";

inout2_io <= '0' when sda_ena_n '0' else 'Z'; --Z is open collector or high impedance or high Z

----------------------------------------------------------------------------------
-- SEQUANTIAL ASSIGNMENTS
----------------------------------------------------------------------------------
-- process blok
-- process bloks work concurrently with each other
-- tool gives multiple driven net error if a signal is assigned in multiple process bloks
-- sıralı çalışır
-------------------
-- combinational process
P_COMBINATIONAL : process (s0, state, i_input1, i_input2) begin
    
    -- if-elsif-else block
    if (s0 < 30)then    
        s1 <= x"01";
    elsif (s0 < 40)then    
        s1 <= x"02";  
    else
        s1 <= x"03";
    end if;
    
    --case block
    case state is
        when S_START =>
            s0 <= x"01";
        when S_OPERATION =>
            s0 <= x"02";
        when S_TERMINATE =>
            s0 <= x"03";
        when others =>
            s0 <= x"04";
     end case;
     
     s4 <= i_input1(3) and i_input(2) xor i_input2;
     s4 <= i_input1(3) or i_input(2) xnor i_input2; -- not multiple driven net error, last one is chosen
end process P_COMBINATIONAL;

----------------------
-- sequential process
P_SEQUANTIAL : process (clk) begin
if (rising_edge(clk)) then
--
end if;
end process P_SEQUANTIAL;

end Behavioral;
