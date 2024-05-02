CREATE DATABASE e_ticaret;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_no INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(400),
    category TEXT,
    color TEXT
);

CREATE TABLE slideshow_photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL
);

INSERT INTO slideshow_photos (photo_url) VALUES
    ('https://images.hepsiburada.net/banners/s/1/672-378/bannerImage2152_20240417104919.jpeg/format:webp'),
    ('https://images.hepsiburada.net/banners/s/1/672-378/bannerImage2099_20240416110313.jpeg/format:webp'),
    ('https://images.hepsiburada.net/banners/s/1/672-378/bannerImage2110_20240420124834.jpeg/format:webp'),
    ('https://images.hepsiburada.net/banners/s/1/672-378/bannerImage2073_20240401093333.jpeg/format:webp'),
    ('https://images.hepsiburada.net/banners/s/1/672-378/bannerImage2113_20240416203942.png/format:webp'),
    ('https://images.hepsiburada.net/banners/s/1/672-378/bannerImage2089_20240417190457.png/format:webp'),
    ('https://images.hepsiburada.net/banners/s/1/672-378/bannerImage2120_20240416100832.png/format:webp');


TRUNCATE TABLE products;
ALTER TABLE products CHANGE COLUMN color available_colors TEXT;
ALTER TABLE products DROP COLUMN image_url;

CREATE TABLE product_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE product_yarin_kapimda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    city_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO products (product_no, name, description, price, category, available_colors) VALUES
    (1001, 'HP', 'HP Victus 7P6B3EA 16-R0007NT Intel Core i7-13700H 16GB DDR5 1TB SSD RTX4070 8GB 16.1 inç 144 Hz Full HD Freedos Gaming Laptop', 48999.00, 'Elektronik', NULL),
    (1002, 'Logitech', 'Logitech M220 Sessiz Kompakt Kablosuz Mouse - Siyah', 239.00, 'Elektronik', 'Beyaz, Kırmızı, Pembe, Siyah'),
    (1003, 'HONOR', 'Honor Pad X9 4GB 128GB WiFi 11.5'' Uzay Gri Tablet', 5899.00, 'Elektronik', 'Uzay Grisi'),
    (1004, 'Samsung', 'Samsung WW90T4020CE 1200 Devir 9 kg Çamaşır Makinesi', 13999.00, 'Elektronik', 'Beyaz'),
    (1005, 'Philips', 'Philips Azur 8000 Serisi Dst8050/20 Optimaltemp 3000 W Buharlı Ütü', 3999.00, 'Elektronik', NULL),
    (1006, 'Xiaomi', 'Xiaomi Mi Robot Vacuum Mop 2 Pro Akıllı Robot Süpürge - Siyah', 10499.00, 'Elektronik', 'Siyah');

INSERT INTO product_images (product_id, image_url) VALUES
    (1, 'https://productimages.hepsiburada.net/s/425/550/110000456621727.jpg/format:webp'),
    (1, 'https://productimages.hepsiburada.net/s/423/550/110000453582004.jpg/format:webp'),
    (1, 'https://productimages.hepsiburada.net/s/423/550/110000453582006.jpg/format:webp'),
    (2, 'https://productimages.hepsiburada.net/s/37/550/10566990757938.jpg/format:webp'),
    (2, 'https://productimages.hepsiburada.net/s/37/550/10566990790706.jpg/format:webp'),
    (2, 'https://productimages.hepsiburada.net/s/37/550/10566990823474.jpg/format:webp'),
    (3, 'https://productimages.hepsiburada.net/s/437/550/110000469372233.jpg/format:webp'),
    (3, 'https://productimages.hepsiburada.net/s/437/550/110000470227235.jpg/format:webp'),
    (3, 'https://productimages.hepsiburada.net/s/437/550/110000469386798.jpg/format:webp'),
    (4, 'https://productimages.hepsiburada.net/s/544/550/110000604107961.jpg/format:webp'),
    (4, 'https://productimages.hepsiburada.net/s/544/550/110000604107962.jpg/format:webp'),
    (4, 'https://productimages.hepsiburada.net/s/544/550/110000604107963.jpg/format:webp'),
    (5, 'https://productimages.hepsiburada.net/s/544/550/110000603940403.jpg/format:webp'),
    (5, 'https://productimages.hepsiburada.net/s/544/550/110000603940404.jpg/format:webp'),
    (5, 'https://productimages.hepsiburada.net/s/544/550/110000603940405.jpg/format:webp'),
    (6, 'https://productimages.hepsiburada.net/s/179/550/110000144163992.jpg/format:webp');

INSERT INTO product_yarin_kapimda (product_id, city_name) VALUES 
	(1,'Ankara'),
    (1, 'İstanbul'),
    (2, 'Ankara'),
    (3, 'İstanbul'),
    (5, 'Ankara'),
    (5, 'İstanbul'),
    (6, 'Ankara'),
    (6, 'İstanbul');

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


INSERT INTO categories (name) VALUES
('Elektronik'),
('Moda'),
('Ev, Yaşam, Kırtasiye, Ofis'),
('Oto, Bahçe, Yapı Market'),
('Anne, Bebek, Oyuncak'),
('Spor, Outdoor'),
('Kozmetik, Kişisel Bakım'),
('Süpermarket, Pet Shop'),
('Kitap, Müzik, Film, Hobi');

ALTER TABLE products ADD COLUMN category_id INT;
INSERT INTO products (category_id) VALUES 
(LEFT(product_no, 1));
DROP TABLE IF EXISTS products;
ALTER TABLE products ADD COLUMN location varchar(100);
ALTER TABLE products DROP COLUMN location;

INSERT INTO products (product_no, name, description, price, category, available_colors) VALUES 
(6001, 'Fashion Season', 'Fashion Season Quencher H2.0 Flowstate Paslanmaz Çelik Termos (Yurt Dışından)', 1207.80, 'Spor, outdoor', 'Açık Pembe, Gri, Koyu Yeşil, Siyah, Turuncu, Krem'),
(6002, 'Htun', 'Htun Çocuk Boks Torbası Boks Eldiveni Seti Bağlantısız Taban Boks Topu Ayarlanabilir Stand (Yurt Dışından)', 1094.94, 'Spor, outdoor', 'Kırmızı'),
(6003, 'SITONG', 'Sıtong 4 Tekerlekli USB Şarjlı LED Işıklı Paten Ayakkabı (Yurt Dışından)', 1460.25, 'Spor, outdoor', 'Pembe'),
(6004, 'Bestway', 'Bestway Ananas Model Şişme Deniz Yatağı - 43310', 249, 'Spor, outdoor', 'Sarı'),
(6005, 'Upway', 'Upway Gyro Ball El Bilek Egzersiztopu Otomatik Jiroskop Kol Kuvvet Spor Ekipmanı', 389.00, 'Spor, outdoor', NULL),
(6006, 'Cosfer', 'Cosfer CSF-TR03 8 Parça Pilates Seti', 799, 'Spor, outdoor', NULL);

INSERT INTO product_images (product_id, image_url) VALUES 
(31, 'https://productimages.hepsiburada.net/s/777/550/110000665420450.jpg/format:webp'),
(32, 'https://productimages.hepsiburada.net/s/518/550/110000573889531.jpg/format:webp'),
(32, 'https://productimages.hepsiburada.net/s/518/550/110000573889533.jpg/format:webp'),
(32, 'https://productimages.hepsiburada.net/s/518/550/110000573889532.jpg/format:webp'),
(32, 'https://productimages.hepsiburada.net/s/518/550/110000573889534.jpg/format:webp'),
(33, 'https://productimages.hepsiburada.net/s/142/550/110000095493031.jpg/format:webp'),
(33, 'https://productimages.hepsiburada.net/s/139/550/110000092221105.jpg/format:webp'),
(33, 'https://productimages.hepsiburada.net/s/142/550/110000095493033.jpg/format:webp'),
(33, 'https://productimages.hepsiburada.net/s/142/550/110000095493035.jpg/format:webp'),
(34, 'https://productimages.hepsiburada.net/s/76/550/110000018210184.jpg/format:webp'),
(34, 'https://productimages.hepsiburada.net/s/76/550/110000018210183.jpg/format:webp'),
(34, 'https://productimages.hepsiburada.net/s/76/550/110000018210181.jpg/format:webp'),
(34, 'https://productimages.hepsiburada.net/s/76/550/110000018210182.jpg/format:webp'),
(35, 'https://productimages.hepsiburada.net/s/353/550/110000362593701.jpg/format:webp'),
(35, 'https://productimages.hepsiburada.net/s/353/550/110000362593702.jpg/format:webp'),
(35, 'https://productimages.hepsiburada.net/s/353/550/110000362593703.jpg/format:webp'),
(35, 'https://productimages.hepsiburada.net/s/353/550/110000362593705.jpg/format:webp'),
(36, 'https://productimages.hepsiburada.net/s/36/550/10505573040178.jpg/format:webp');


INSERT INTO products (product_no, name, description, price, category, available_colors) VALUES 
(7001, 'Sleepy', 'Sleepy Ekonomik İkili Paket (Natural Ultra Hassas Hijyenik Ped Gece 18''li + Günlük Ped Normal 32''li)', 99.90, 'Kozmetik, kişisel bakım', NULL),
(7002, 'Oral-B', 'Oral-B Pro 3500 Şarj Edilebilir Diş Fırçası Siyah + Başlık', 2479.90, 'Kozmetik, kişisel bakım', NULL),
(7003, 'Arko', 'Arko Men Cool Tıraş Köpüğü 4''lü Paket 200 ml', 199.95, 'Kozmetik, kişisel bakım', NULL),
(7004, 'OlaLab', 'Olalab Cilt Bakım ve Makyaj Çantası', 379.50, 'Kozmetik, kişisel bakım', NULL),
(7005, 'Garnier', 'Garnier Micellar Kusursuz Makyaj Temizleme Suyu 400ML', 99.95, 'Kozmetik, kişisel bakım', NULL),
(7006, 'Bepanthol', 'Bepanthol Derma Nemlendirici & Besleyici Spf 25 Günlük Yüz Kremi 50ML + Derma Yoğun Nemlendirici Gece Bakım Kremi 50ML', 899.50, 'Kozmetik, kişisel bakım', NULL),
(8001, 'Miyav', 'Tower Of Tracks Etkileşimli Kedi Top Döndürme Oyuncağı Stres Azaltan 3 Katlı Kedi Kulesi', 60.00, 'Süpermarket, petshop', NULL),
(8002, 'Pro Plan', 'Pro Plan Renal Plus Sterilised Somonlu Kısırlaştırılmış Yetişkin Kedi Maması 10 Kg', 1869.00, 'Süpermarket, petshop', NULL),
(8003, 'Solomon', 'Solomon Active Carbon Kedi Kumu Koku Giderici 500 gr', 249.90, 'Süpermarket, petshop', NULL),
(8004, 'Molfix', 'Molfix Bebek Bezi 6 Beden Extra Large Fırsat Paketi 52 Adet', 290.00, 'Süpermarket, petshop', NULL),
(8005, 'Nutella', 'Nutella Kakaolu Fındık Kreması 750 gr', 156.99, 'Süpermarket, petshop', NULL),
(8006, 'Çaykur', 'Çaykur Tiryaki Çay 1000gr', 157.99, 'Süpermarket, petshop', NULL),
(9001, 'Yapı Kredi Yayınları', 'Kitap-lık 211 / Eylül - Ekim 2020', 14.40, 'Kitap, müzik, film, hobi', NULL),
(9002, 'İndigo Kitap', 'Irade Terbiyesi - Jules Payot', 41.30, 'Kitap, müzik, film, hobi', NULL),
(9003, 'İthaki Yayınları', 'Üç Cisim Problemi 3 Kitap Takım - Cixin Liu', 789.00, 'Kitap, müzik, film, hobi', NULL),
(9004, 'Sincap Kitap', 'Nasıl Başladı? Her Şey Seninle Başladı Kutu Set (3 Kitap Takım) - Ayşe Aydemir', 128.70, 'Kitap, müzik, film, hobi', NULL),
(9005, 'Yapı Kredi Yayınları', 'Harry Potter Sihirli Almanak (Ciltli) – J.K.Rowling', 817.70, 'Kitap, müzik, film, hobi', NULL),
(9006, 'Altın Kitaplar', 'İlahi Komedya 3’lü Set - Özel Kutulu - Dante Alighieri', 255.60, 'Kitap, müzik, film, hobi', NULL);



INSERT INTO product_images (product_id, image_url) VALUES 
(37, 'https://productimages.hepsiburada.net/s/546/550/110000607033521.jpg/format:webp'),
(37, 'https://productimages.hepsiburada.net/s/546/550/110000607033523.jpg/format:webp'),
(37, 'https://productimages.hepsiburada.net/s/546/550/110000607033524.jpg/format:webp'),

(38, 'https://productimages.hepsiburada.net/s/114/550/110000061599510.jpg/format:webp'),
(38, 'https://productimages.hepsiburada.net/s/114/550/110000061599511.jpg/format:webp'),
(38, 'https://productimages.hepsiburada.net/s/114/550/110000061599512.jpg/format:webp'),
(38, 'https://productimages.hepsiburada.net/s/114/550/110000061599513.jpg/format:webp'),

(39, 'https://productimages.hepsiburada.net/s/527/550/110000584677474.jpg/format:webp'),
(39, 'https://productimages.hepsiburada.net/s/527/550/110000584677477.jpg/format:webp'),
(39, 'https://productimages.hepsiburada.net/s/527/550/110000584677475.jpg/format:webp'),

(40, 'https://productimages.hepsiburada.net/s/480/550/110000524114322.jpg/format:webp'),
(40, 'https://productimages.hepsiburada.net/s/480/550/110000524114323.jpg/format:webp'),
(40, 'https://productimages.hepsiburada.net/s/480/550/110000524114324.jpg/format:webp'),

(41, 'https://productimages.hepsiburada.net/s/777/550/110000678353344.jpg/format:webp'),
(41, 'https://productimages.hepsiburada.net/s/777/550/110000678353347.jpg/format:webp'),
(41, 'https://productimages.hepsiburada.net/s/777/550/110000678353346.jpg/format:webp'),
(41, 'https://productimages.hepsiburada.net/s/777/550/110000678353345.jpg/format:webp'),

(42, 'https://productimages.hepsiburada.net/s/122/550/110000071919084.jpg/format:webp'),
(42, 'https://productimages.hepsiburada.net/s/122/550/110000071919085.jpg/format:webp'),
(42, 'https://productimages.hepsiburada.net/s/122/550/110000071919087.jpg/format:webp'),
(42, 'https://productimages.hepsiburada.net/s/122/550/110000071919088.jpg/format:webp'),

(43, 'https://productimages.hepsiburada.net/s/494/550/110000545348937.jpg/format:webp'),
(43, 'https://productimages.hepsiburada.net/s/494/550/110000545348938.jpg/format:webp'),
(43, 'https://productimages.hepsiburada.net/s/494/550/110000545348939.jpg/format:webp'),

(44, 'https://productimages.hepsiburada.net/s/777/550/110000678710402.jpg/format:webp'),

(45, 'https://productimages.hepsiburada.net/s/502/550/110000556551554.jpg/format:webp'),
(45, 'https://productimages.hepsiburada.net/s/502/550/110000556551557.jpg/format:webp'),
(45, 'https://productimages.hepsiburada.net/s/502/550/110000556551558.jpg/format:webp'),

(46, 'https://productimages.hepsiburada.net/s/439/550/110000473020829.jpg/format:webp'),
(46, 'https://productimages.hepsiburada.net/s/439/550/110000473020825.jpg/format:webp'),
(46, 'https://productimages.hepsiburada.net/s/439/550/110000473020827.jpg/format:webp'),
(46, 'https://productimages.hepsiburada.net/s/439/550/110000473020827.jpg/format:webp'),

(47, 'https://productimages.hepsiburada.net/s/777/550/110000675535700.jpg/format:webp'),
(47, 'https://productimages.hepsiburada.net/s/777/550/110000644885408.jpg/format:webp'),

(48, 'https://productimages.hepsiburada.net/s/25/550/10108396503090.jpg/format:webp'),

(49, 'https://productimages.hepsiburada.net/s/43/550/10761029189682.jpg/format:webp'),

(50, 'https://productimages.hepsiburada.net/s/111/550/110000057804679.jpg/format:webp'),

(51, 'https://productimages.hepsiburada.net/s/52/550/11092902674482.jpg/format:webp'),

(52, 'https://productimages.hepsiburada.net/s/558/550/110000620361013.jpg/format:webp'),
(52, 'https://productimages.hepsiburada.net/s/563/550/110000625779417.jpg/format:webp'),
(52, 'https://productimages.hepsiburada.net/s/563/550/110000625800827.jpg/format:webp'),
(52, 'https://productimages.hepsiburada.net/s/563/550/110000625779414.jpg/format:webp'),

(53, 'https://productimages.hepsiburada.net/s/478/550/110000521835103.jpg/format:webp'),
(53, 'https://productimages.hepsiburada.net/s/777/550/110000629649880.jpg/format:webp'),
(53, 'https://productimages.hepsiburada.net/s/777/550/110000629649882.jpg/format:webp'),
(53, 'https://productimages.hepsiburada.net/s/777/550/110000629649882.jpg/format:webp'),

(54, 'https://productimages.hepsiburada.net/s/432/550/110000464824364.jpg/format:webp'),
(54, 'https://productimages.hepsiburada.net/s/22/550/9946374897714.jpg/format:webp');

