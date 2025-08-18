----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.08.2025 19:40:00
-- Design Name: 
-- Module Name: schema - rtl 
-- Project Name: 
-- Target Devices: hangi fpga ailesi için yazıldı
-- Tool Versions: vivadonun hangi versiyonu
-- Description: bu modül ne işe yarar, fonksiyonları vb.
-- 
-- Dependencies: 
-- 
-- Revision: tasarım güncellendiğinde düzenleme yapılır
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

-- PACKAGES
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- ENTITY
-- her blok kendi başına bir devredir ve entity olarak anlandırılır
-- giriş çıkış portları tanımmlanır, ara yüzler oluşturulur
-- lojik fonksiyonun dış dünya ile bağlantısını tanımlarr
entity schema is
    -- generic(); 
        -- portların boyutlarını ifade etme
        -- alt bileşenlerin sayısını belirtme
        -- zamanlama özelliklerinin belirlenmesi
        -- tasarımın fiziksel özelliklerini belirtme
        -- architecture içerisindeki vektörlerin uzunluklarını belirtme
        -- döngü sayısını belirtme

        -- generic tanımlaması yapılarak tasarlanan devre parametrik özelliğe sahip olur, özellikle büyük tasarımlarda kolaylık sağlar
        -- upper case ile yazılır

    port(
        -- in, out, inout tanımları
        -- lower case ile yazılır
        a : in bit
    );

end schema;

-- ARCHITECTURE
-- modelin davranışı bu yapıda tanımlanır
-- lojik fonksiyonun işlevi architecture tarafından belirlenir
-- her entity için bir architecture

architecture rtl of schema is

begin

end architecture; -- end rtl de olur

-- sentezlemek istedğimiz tasarımlarda zaman olmaz, testbenchlerde olur

----------------------------------------------------------------------------------

-- constant: tasarım sürecinde değeri değişmez
    -- constant global scope'da tanımlı olması için paket içinde tanımlanabilir. generic entity için tanımlanır, komponenti parametrik yapar
-- sinyaller ara bağlantıları, kabloları temsil eder. atama işlemi "<=" ile yapılır
-- begin-end arası kodlar aynı anda çalışır
-- değişkenlerde atama işlemi ":=" ile yapılır. sinyallerin aksine içeriği hemen güncellenir, doğrudan atama olur.
    -- process ve begin arasında tanımlanır
    -- architecture - begin arasına sinyal ve constantlar tanımlanır
    -- sinyal hem process içinde hem de dışında tanımlanabilir, variable sadece process içinde tanımlanabilir
    -- variable sadece tanımlandığı process içinde kullanılabilir, sinyal başka bir process içinde kullanılabilir
    -- variable'a direkt atama yapılabilir, sinyaller process bittiğinde değer alır
