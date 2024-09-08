CREATE DATABASE soccer_stats;

USE soccer_stats;

CREATE TABLE stats (
    ID int(11) NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    goals int(11),
    assist int(11),
    points int(11),
    shots int(11),
    PRIMARY KEY (ID)
);

INSERT INTO stats (ID, name, goals, assist, points, shots)
VALUES (NULL, 'Ahmad', 26, 22, 48, 104),
       (NULL, 'Chong', 126, 82, 208, 312),
       (NULL, 'Rashid', 8, 25, 33, 31),
       (NULL, 'Sam', 52, 12, 64, 174),
       (NULL, 'Ronald', 26, 92, 118, 88);
       
SELECT * FROM stats;
SELECT name,goals FROM stats;

UPDATE stats SET goals=28 WHERE name="Ahmad";
SELECT * FROM stats;

SELECT * FROM stats LIMIT 3;

SELECT * FROM stats WHERE name LIKE 'R%';
