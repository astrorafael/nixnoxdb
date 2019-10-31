PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TEMP TABLE IF NOT EXISTS Variables (Name TEXT PRIMARY KEY, Value TEXT);
INSERT OR REPLACE INTO Variables VALUES ('temp_flags', (SELECT last_insert_rowid()) );


CREATE TEMP TABLE IF NOT EXISTS MapaTS (Clave TEXT PRIMARY KEY, Valor INTEGER);
CREATE TEMP TABLE IF NOT EXISTS MapaT (Clave TEXT PRIMARY KEY, Valor INTEGER);
CREATE TEMP TABLE IF NOT EXISTS MapaH (Clave TEXT PRIMARY KEY, Valor INTEGER);

INSERT INTO MapaT VALUES ("No temperatures known", 0);
INSERT INTO MapaT VALUES ("Initial & Final temperatures", 1);
INSERT INTO MapaT VALUES ("Max & Min temperatures", 2);
INSERT INTO MapaT VALUES ("Unique temperatures measurement", 3);

INSERT INTO MapaH VALUES ("No humidity known", 0);
INSERT INTO MapaH VALUES ("Initial & Final humidities", 1);
INSERT INTO MapaH VALUES ("Max & Min humidities", 2);
INSERT INTO MapaH VALUES ("Unique humidity measurement", 3);

INSERT INTO MapaTS VALUES ("Start & end timestamp", 0);
INSERT INTO MapaTS VALUES ("Start timestamp only", 1);
INSERT INTO MapaTS VALUES ("End timestamp only", 2);
INSERT INTO MapaTS VALUES ("Individual readings timestamp", 3);

CREATE TEMP TABLE IF NOT EXISTS Temporal1 (id INTEGER PRIMARY KEY, msg_T TEXT, msg_H TEXT);
INSERT INTO Temporal1(id, msg_T, msg_H)
SELECT (mt.Valor << 2) + mh.Valor,  mt.Clave, mh.Clave 
FROM MapaT as mt 
CROSS JOIN MapaH as mh;


INSERT OR REPLACE INTO flags_t(flags_id, timestamp_method, temperature_method, humidity_method)
SELECT (t1.id << 2) + ts.Valor,  ts.Clave, t1.msg_t, t1.msg_h 
FROM Temporal1 as t1 
CROSS JOIN MapaTS as ts;




COMMIT;
-