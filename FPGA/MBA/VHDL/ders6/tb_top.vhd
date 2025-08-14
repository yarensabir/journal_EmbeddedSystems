library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_top is
generic(
N : integer := 8
);
end tb_top;

architecture Behavioral of tb_top is

component top is
generic(
N : integer := 8
);
port(
SW : in STD_LOGIC_VECTOR (15 downto 0);
BTNL : in STD_LOGIC;
LED : out STD_LOGIC_VECTOR (8 downto 0)
);
end component;

-- inputlara initial değer veriliyor yoksa simülasyon başladığında u görünür
signal SW : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal BTNL : STD_LOGIC := '0';
signal LED : STD_LOGIC_VECTOR (8 downto 0);
begin

DUT : top -- top modül instantiate ediliyor
generic map(
N => N
)
port map(
SW => SW,
BTNL => BTNL,
LED => LED
);

STIMULI : process begin
SW <= x"0000";
BTNL <= '0';

wait for 20 ns;

SW <= x"1234";
BTNL <= '1';

wait for 20 ns;

for i in 0 to 255 loop
-- std logic vector'e toplama çıkarma işlemleri yaptırmaya çalışıyoruz, hata verir
SW(7 downto 0) <= SW(7 downto 0) + 1;
SW(15 downto 8) <= SW(15 downto 8) + 2;
BTNL <= not BTNL;
wait for 20 ns;
end loop;

for i in 0 to 255 loop
SW(7 downto 0) <= SW(7 downto 0) - 1;
SW(15 downto 8) <= SW(15 downto 8) - 2;
BTNL <= not BTNL;
wait for 20 ns;
end loop;

assert false
report "SIM DONE"
severity failure;


end process;

end Behavioral;
