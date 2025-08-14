library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2x1 is
Port (
      i_a : in STD_LOGIC;
      i_b : in STD_LOGIC;
      i_s1 : in STD_LOGIC;
      i_c : in STD_LOGIC;
      i_d : in STD_LOGIC;
      i_s2 : in STD_LOGIC;
      i_e : in STD_LOGIC;
      i_f : in STD_LOGIC;
      i_s3 : in STD_LOGIC;
      
      o_q1 : out std_logic;
      o_q2 : out std_logic;
      o_q3 : out std_logic
      );
end mux_2x1;

architecture Behavioral of mux_2x1 is

signal temp1 : std_logic := '0';
signal temp2 : std_logic := '0';

begin

    -- ALTTAKİ 3 TASARIM AYNI DEVREYİ ÜRETİYOR
    -- kombinasyonel devrede giriş değeri çıkış değerine anında yansır 
    -- (elektronlarının hareketinin falan getirdiği gecikme görmezden geliniyor)
--------------------------------------------------------------------------------------------
-- GATE LEVEL COMBINATIONAL DESIGN
-- devredeki kapılara bakarak yazılan tasarım
--------------------------------------------------------------------------------------------
-- sinyal tanımlaması yapılmamış devre
-- o_q1 <= not ((not(i_a and i_s1)) and (not((not i_s1) and i_b)));

-- sinyal tanımlanarak yapılmış devre
temp1 <= not (i_a and i_s1);
temp2 <= not ((not i_s1) and i_b);
o_q1 <= not (temp1 and temp2);

--------------------------------------------------------------------------------------------
-- CONCURRENT ASSIGNMENT COMBINATIONAL DESIGN
-- doğruluk tablosu baz alınarak yazılan tasarım
--------------------------------------------------------------------------------------------
o_q1 <= i_c when i_s2 = '1' else 
        i_d;

--------------------------------------------------------------------------------------------
-- PROCESS COMBINATIONAL DESIGN
--------------------------------------------------------------------------------------------
P_LABEL : process (i_s3, i_e, i_f) begin 
-- sensivity kısmına yazdığımız parametreler değer değişince çıkışı etkileyenler (sağdakiler denebilir)
    if (i_s3 = '1') then
        o_q3 <= i_e;
    else
        o_q3 <= i_f;
    end if;
end process P_LABEL;



end Behavioral;
