#pokozywanie tylko uczniow z klasy 4a
SELECT * FROM uczniowie WHERE klasa="4a" ORDER BY nazwisko DESC;

#pokazywanie czy wypozyczyl
SELECT uczniowie.id, imie,nazwisko, klasa, wypozyczenia.id,data_wypozyczenia,data_zwrotu AS id2
FROM uczniowie
INNER JOIN wypozyczenia ON wypozyczenia.uczniowie_id = uczniowie.id
ORDER BY nazwisko;

#dołozenie tytułu
SELECT uczniowie.id, imie,nazwisko, klasa ,tytul,data_wypozyczenia, data_zwrotu
FROM uczniowie
INNER JOIN wypozyczenia ON wypozyczenia.uczniowie_id = uczniowie.id
INNER JOIN ksiazki ON ksiazki.id = wypozyczenia.ksiazki_id
ORDER BY nazwisko;

#kto nie zwrocił
SELECT uczniowie.id, imie,nazwisko, klasa ,tytul,data_wypozyczenia,`data_zwrotu`
FROM uczniowie
INNER JOIN wypozyczenia ON wypozyczenia.uczniowie_id = uczniowie.id
INNER JOIN ksiazki ON ksiazki.id = wypozyczenia.ksiazki_id
WHERE data_zwrotu IS NULL
ORDER BY nazwisko;

#kto nie zwrocił w wymaganym 30 dniowym czasie
SELECT uczniowie.id, imie,nazwisko, klasa ,tytul,`data_zwrotu`,`data_wypozyczenia`
FROM uczniowie
INNER JOIN wypozyczenia ON wypozyczenia.uczniowie_id = uczniowie.id
INNER JOIN ksiazki ON ksiazki.id = wypozyczenia.ksiazki_id
WHERE data_zwrotu IS NULL AND data_wypozyczenia < NOW() - INTERVAL 1 MONTH
ORDER BY nazwisko;

SELECT NOW() - INTERVAL 1 MONTH;

#wstawianie rekordów
#INSERT INTO wypozyczenia (uczniowie_id,ksiazki_id,zwrocono) VALUES (5,1,0);

#zmienianie z 0 na 1
UPDATE wypozyczenia 
SET wypozyczenia.zwrocono =1 
WHERE id=8;

#usuwanie jesli zwrocli
DELETE FROM wypozyczenia WHERE zwrocono = 1;