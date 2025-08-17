-- 2 switch
-- 8 bit counter ledler için, switchler ile kontrol ediliyor, ledin hızı kontrol ediliyor


-- LIBRARY AND PACKAGE DECLERATIONS
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- std logic vectorlerde matematiksel ve lojik işlemleri yapmayı sağlayan kütüphaneler
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- ENTITY
entity top is
generic (
c_clkfreq	: integer := 100_000_000
);
port (
clk			: in std_logic;
sw			: in std_logic_vector (1 downto 0);
counter		: out std_logic_vector (7 downto 0)
);
end top;


-- ARCHITECTURE
architecture Behavioral of top is

-- CONSTANTS
constant c_timer2seclim		: integer := c_clkfreq*2;
constant c_timer1seclim		: integer := c_clkfreq;
constant c_timer500mslim	: integer := c_clkfreq/2;
constant c_timer250mslim	: integer := c_clkfreq/4;

-- SIGNALS
signal timer				: integer range 0 to c_timer2seclim := 0;
signal timerlim				: integer range 0 to c_timer2seclim	:= 0;
signal counter_int			: std_logic_vector (7 downto 0) := (others => '0'); 

-- BEGIN
begin

-- combination logics assignment
timerlim	<= 	c_timer2seclim 	when sw = "00" else
				c_timer1seclim	when sw = "01" else
				c_timer500mslim	when sw = "10" else
				c_timer250mslim;

-- PROCESS
process (clk) begin --clock yazıldığı sürece içerideki simyaller artık flip-flop
if (rising_edge(clk)) then

	if (timer >= timerlim-1) then
		counter_int	<= counter_int + 1; -- direkt counter olmaz, error verir (vivado), output sinyali input olarak kullanamazsın
		timer		<= 0;
	else
		timer 		<= timer + 1;
	end if;

end if;
end process;

counter <= counter_int;

end Behavioral;