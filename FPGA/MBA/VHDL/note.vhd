library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
-- bu kütüphane bize STD_LOGIC (1 bit) ve std_logic_vector (>1 bit) tiplerini tanımlar
-- i_p1 : in std_logic_vector (7 downto 0); 8 bitlik giriş portu tanımı
-- o_p2 : out STD_LOGIC; 1 bitlik çıkış portu tanımı

use IEEE.numeric_std.all;
-- bu kütüphane int vb. numerik işlemleri yapmamıza olanak tanıyor
-- s0 <= std_logic_vector(unsigned(s0_i) + unsigned(s1_i))
-- unsigned(s0) > 20

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



-- bu blokta note modülünün dış dünya ile olan arayüzlerinin tanımları yapılır
entity note is
-- generic bloğu frekans vb. gibi bağımlı değişkenlerin tanımı için kullanılır. 
-- parametrik tasarım için gerekli
--  generic(c_clkgreq : integer := 100_000_000);
-- port bloğu ile giriş çıkışlar tanımlanır
--  Port (i_p1 : in std_logic_vector (7 downto 0);
--        o_p2 : out STD_LOGIC
--        o_p3 : out std_logic);
end note;

architecture Behavioral of note is 
-- note modülünün davranışının tanımı bu blokta yapılır
-- INSTANTIATION fpga ilk uyandığında hangi değer ile başlayacağını belirtir. özellikle simülasyon için gerekli
begin
end Behavioral;

-- büyük küçük harf duyarsız (en azından 4 yıl önce öyleymiş)
-- ctrld + d --> satırı kopyalayıp alta yapıştırıyor
-- ctrl ye basıt satırları seçersen seçtiğin kısımlara yaptığın işlemi kopyalıyor, boşluk düzeltme vs için kullanılabilir