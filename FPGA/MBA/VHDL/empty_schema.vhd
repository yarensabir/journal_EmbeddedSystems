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
entity empyt_schema_vhdl is
generic(

);
Port (

);
end schema_vhdl;

----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
architecture Behavioral of empyt_schema_vhdl is -- behavioral yerine başka bir keyword kullanılabilir

----------------------------------------------------------------------------------
-- CONSTANTS
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
-- COMPONENT DECLERATIONS
----------------------------------------------------------------------------------
component x_component is
generic(

);
port (

);
end component x_component;

----------------------------------------------------------------------------------
-- TYPES
----------------------------------------------------------------------------------
-- subtype is a type with constraint

--record


----------------------------------------------------------------------------------
-- SIGNALS
----------------------------------------------------------------------------------
-- iç sinyaller


----------------------------------------------------------------------------------
-- BEGIN
----------------------------------------------------------------------------------
begin

----------------------------------------------------------------------------------
-- COMPONENT INSTANTIATION
----------------------------------------------------------------------------------
comp1 : x_component 
generic map(

)
port map(

);

----------------------------------------------------------------------------------
-- CONCURRENT ASSIGNMENTS
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
-- SEQUANTIAL ASSIGNMENTS
----------------------------------------------------------------------------------
-- process blok
-- process bloks work concurrently with each other
-- tool gives multiple driven net error if a signal is assigned in multiple process bloks
-------------------
-- combinational process
P_COMBINATIONAL : process () begin

end process P_COMBINATIONAL;

----------------------
-- sequential process
P_SEQUANTIAL : process (clk) begin
if (rising_edge(clk)) then
--
end if;
end process P_SEQUANTIAL;

end Behavioral;
