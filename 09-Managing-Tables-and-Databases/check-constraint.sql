-- CHECK CONSTRAINT
CREATE TABLE songs (
	song_id SERIAL PRIMARY KEY,
	song_name VARCHAR(30) NOT NULL,
	genre VARCHAR(30) DEFAULT 'Not defined',
	price NUMERIC(4, 2) CHECK (price >= 1.99),
	release_date DATE CHECK (release_date BETWEEN '01-01-1950' AND CURRENT_DATE)
)

-- Insert
INSERT INTO songs (song_id, song_name, price, release_date) 
VALUES (4, 'SQL Song', 0.99, '2022-01-07')

-- Modify check constraint
ALTER TABLE songs
DROP CONSTRAINT songs_price_check; 

ALTER TABLE songs
ADD CONSTRAINT songs_price_check CHECK (price >= 0.99);

-- Insert
INSERT INTO songs (song_name, price, release_date) 
VALUES ('SQL Song', 0.99, '2022-01-07')

SELECT * FROM songs;
	
-- DROP Table
DROP TABLE songs;