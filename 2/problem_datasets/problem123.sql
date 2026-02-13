-- The Art Gallery Database Tableset and Data.

DROP TABLE art_sales;
DROP TABLE art_dealer;
DROP TABLE artistic_work;
DROP TABLE art_type;
DROP TABLE artist;


CREATE TABLE artist 
(artist_id             NUMBER CONSTRAINT pk_artist PRIMARY KEY,
 firstname             VARCHAR2(50),
 lastname              VARCHAR2(50),
 phone#                NUMBER(10)
);

CREATE TABLE art_type 
(art_type_code         CHAR(4) CONSTRAINT pk_art_type PRIMARY KEY,
 description           VARCHAR2(100)
);

CREATE TABLE artistic_work 
(art_id                NUMBER CONSTRAINT pk_artistic_work PRIMARY KEY,
 artist_id             NUMBER CONSTRAINT fk_aw_to_artist REFERENCES artist(artist_id) NOT NULL,
 name                  VARCHAR2(50),
 description           VARCHAR2(100),
 min_sale_value        NUMBER,
 art_type_code         CHAR(4) CONSTRAINT fk_aw_to_art_type REFERENCES art_type(art_type_code) NOT NULL 
);

CREATE TABLE art_dealer
(dealer_id             NUMBER CONSTRAINT pk_art_dealer PRIMARY KEY,
 firstname             VARCHAR2(50),
 lastname              VARCHAR2(50),
 phone#                NUMBER(10)
);

CREATE TABLE art_sales
(sales#                NUMBER CONSTRAINT pk_art_sales PRIMARY KEY,
 art_id                NUMBER CONSTRAINT fk_as_to_aw REFERENCES artistic_work(art_id) NOT NULL,
 dealer_id             NUMBER CONSTRAINT fk_as_to_art_dealer REFERENCES art_dealer(dealer_id),
 date_sold             DATE,
 selling_price         NUMBER 
);

-- ARTIST Sample Data 
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (1, 'Alice', 'Monet', 1234567890);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (2, 'Bob', 'Picasso', 1234567891);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (3, 'Carol', 'DaVinci', 1234567892);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (4, 'David', 'VanGogh', 1234567893);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (5, 'Eve', 'Rembrandt', 1234567894);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (6, 'Frank', 'Dali', 1234567895);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (7, 'Grace', 'Kahlo', 1234567896);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (8, 'Hank', 'Matisse', 1234567897);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (9, 'Ivy', 'Warhol', 1234567898);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (10, 'Jack', 'Hopper', 1234567899);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (11, 'Karen', 'Okeefe', 1234567800);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (12, 'Leo', 'Pollock', 1234567801);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (13, 'Mia', 'Basquiat', 1234567802);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (14, 'Nina', 'Haring', 1234567803);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (15, 'Oscar', 'Lichtenstein', 1234567804);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (16, 'Paul', 'Rothko', 1234567805);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (17, 'Quinn', 'Kline', 1234567806);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (18, 'Rita', 'Serra', 1234567807);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (19, 'Sam', 'Twombly', 1234567808);
INSERT INTO artist (artist_id, firstname, lastname, phone#) VALUES (20, 'Tina', 'Stella', 1234567809);

-- ART_TYPE Sample Data 
INSERT INTO art_type (art_type_code, description) VALUES ('PTNG', 'Painting');
INSERT INTO art_type (art_type_code, description) VALUES ('SCPT', 'Sculpture');
INSERT INTO art_type (art_type_code, description) VALUES ('DRWG', 'Drawing');
INSERT INTO art_type (art_type_code, description) VALUES ('PHOT', 'Photography');
INSERT INTO art_type (art_type_code, description) VALUES ('MIXD', 'Mixed Media');
INSERT INTO art_type (art_type_code, description) VALUES ('DIGI', 'Digital Art');
INSERT INTO art_type (art_type_code, description) VALUES ('CLGR', 'Collage');
INSERT INTO art_type (art_type_code, description) VALUES ('PRNT', 'Print');
INSERT INTO art_type (art_type_code, description) VALUES ('TEXT', 'Textile');
INSERT INTO art_type (art_type_code, description) VALUES ('GLSS', 'Glass Art');
INSERT INTO art_type (art_type_code, description) VALUES ('WOOD', 'Woodwork');
INSERT INTO art_type (art_type_code, description) VALUES ('METL', 'Metalwork');
INSERT INTO art_type (art_type_code, description) VALUES ('STNE', 'Stonework');
INSERT INTO art_type (art_type_code, description) VALUES ('CERA', 'Ceramics');
INSERT INTO art_type (art_type_code, description) VALUES ('ENML', 'Enamel');
INSERT INTO art_type (art_type_code, description) VALUES ('FRES', 'Fresco');
INSERT INTO art_type (art_type_code, description) VALUES ('ICON', 'Iconography');
INSERT INTO art_type (art_type_code, description) VALUES ('MOSA', 'Mosaic');
INSERT INTO art_type (art_type_code, description) VALUES ('TILE', 'Tile Art');
INSERT INTO art_type (art_type_code, description) VALUES ('NEON', 'Neon Art');

-- ART_DEALER Sample Data 
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (1, 'Anna', 'Smith', 9876543210);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (2, 'Ben', 'Jones', 9876543211);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (3, 'Cathy', 'Brown', 9876543212);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (4, 'Dan', 'White', 9876543213);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (5, 'Ella', 'Green', 9876543214);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (6, 'Fred', 'Black', 9876543215);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (7, 'Gina', 'Gray', 9876543216);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (8, 'Harry', 'Gold', 9876543217);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (9, 'Irene', 'Silver', 9876543218);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (10, 'Jake', 'Copper', 9876543219);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (11, 'Kara', 'Bronze', 9876543200);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (12, 'Liam', 'Steel', 9876543201);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (13, 'Mona', 'Nickel', 9876543202);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (14, 'Nate', 'Zinc', 9876543203);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (15, 'Olga', 'Iron', 9876543204);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (16, 'Pete', 'Lead', 9876543205);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (17, 'Quincy', 'Tin', 9876543206);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (18, 'Rosa', 'Brass', 9876543207);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (19, 'Steve', 'Chrome', 9876543208);
INSERT INTO art_dealer (dealer_id, firstname, lastname, phone#) VALUES (20, 'Tara', 'Titanium', 9876543209);

-- ARTISTIC_WORK Sample Data 
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (1, 1, 'Sunset Dreams', 'A vivid sunset over hills', 5000, 'PTNG');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (2, 2, 'Stone Whisper', 'Abstract stone sculpture', 8000, 'SCPT');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (3, 3, 'Silent Lines', 'Minimalist pencil drawing', 2000, 'DRWG');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (4, 4, 'Urban Pulse', 'Cityscape photo', 3000, 'PHOT');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (5, 5, 'Fusion', 'Mixed media explosion', 6000, 'MIXD');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (6, 6, 'Digital Bloom', 'Floral digital art', 2500, 'DIGI');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (7, 7, 'Fragmented Soul', 'Collage of emotions', 4000, 'CLGR');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (8, 8, 'Print Echo', 'Limited edition print', 3500, 'PRNT');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (9, 9, 'Threaded Tales', 'Textile storytelling', 4500, 'TEXT');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (10, 10, 'Glass Symphony', 'Colorful glass piece', 7000, 'GLSS');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (11, 11, 'Woodland Spirit', 'Wood sculpture', 5500, 'WOOD');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (12, 12, 'Metal Mirage', 'Reflective metalwork', 6200, 'METL');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (13, 13, 'Stone Path', 'Stone mosaic', 4800, 'STNE');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (14, 14, 'Ceramic Bloom', 'Floral ceramic bowl', 3200, 'CERA');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (15, 15, 'Enamel Echo', 'Enamel wall piece', 2900, 'ENML');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (16, 16, 'Fresco Light', 'Wall fresco', 5100, 'FRES');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (17, 17, 'Icon Grace', 'Religious icon', 3700, 'ICON');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (18, 18, 'Mosaic Flow', 'Colorful mosaic', 4300, 'MOSA');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (19, 19, 'Tile Whisper', 'Decorative tile art', 2600, 'TILE');
INSERT INTO artistic_work (art_id, artist_id, name, description, min_sale_value, art_type_code) VALUES (20, 20, 'Neon Beat', 'Neon light installation', 9000, 'NEON');

-- ART_SALES Sample Data 
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (1, 1, 1, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 5200);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (2, 2, 2, TO_DATE('2025-02-10', 'YYYY-MM-DD'), 8500);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (3, 3, 3, TO_DATE('2025-03-05', 'YYYY-MM-DD'), 2100);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (4, 4, 4, TO_DATE('2025-04-12', 'YYYY-MM-DD'), 3100);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (5, 5, 5, TO_DATE('2025-05-20', 'YYYY-MM-DD'), 6200);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (6, 6, 6, TO_DATE('2025-06-18', 'YYYY-MM-DD'), 2700);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (7, 7, 7, TO_DATE('2025-07-22', 'YYYY-MM-DD'), 7000);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (8, 8, 8, TO_DATE('2025-08-30', 'YYYY-MM-DD'), 3600);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (9, 9, 9, TO_DATE('2025-09-10', 'YYYY-MM-DD'), 4700);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (10, 10, 10, TO_DATE('2025-10-01', 'YYYY-MM-DD'), 7100);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (11, 11, 11, TO_DATE('2025-10-05', 'YYYY-MM-DD'), 5600);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (12, 12, 12, TO_DATE('2025-10-10', 'YYYY-MM-DD'), 10000);
INSERT INTO art_sales (sales#, art_id, dealer_id, date_sold, selling_price) VALUES (13, 13, 13, TO_DATE('2025-10-15', 'YYYY-MM-DD'), 4900);


COMMIT;
