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

-- 0|Start & end timestamp|No temperatures known|No humidity known
-- 1|Start timestamp only|No temperatures known|No humidity known
-- 2|End timestamp only|No temperatures known|No humidity known
-- 3|Individual readings timestamp|No temperatures known|No humidity known
-- 4|Start & end timestamp|No temperatures known|Initial & Final humidities
-- 5|Start timestamp only|No temperatures known|Initial & Final humidities
-- 6|End timestamp only|No temperatures known|Initial & Final humidities
-- 7|Individual readings timestamp|No temperatures known|Initial & Final humidities
-- 8|Start & end timestamp|No temperatures known|Max & Min humidities
-- 9|Start timestamp only|No temperatures known|Max & Min humidities
-- 10|End timestamp only|No temperatures known|Max & Min humidities
-- 11|Individual readings timestamp|No temperatures known|Max & Min humidities
-- 12|Start & end timestamp|No temperatures known|Unique humidity measurement
-- 13|Start timestamp only|No temperatures known|Unique humidity measurement
-- 14|End timestamp only|No temperatures known|Unique humidity measurement
-- 15|Individual readings timestamp|No temperatures known|Unique humidity measurement
-- 16|Start & end timestamp|Initial & Final temperatures|No humidity known
-- 17|Start timestamp only|Initial & Final temperatures|No humidity known
-- 18|End timestamp only|Initial & Final temperatures|No humidity known
-- 19|Individual readings timestamp|Initial & Final temperatures|No humidity known
-- 20|Start & end timestamp|Initial & Final temperatures|Initial & Final humidities
-- 21|Start timestamp only|Initial & Final temperatures|Initial & Final humidities
-- 22|End timestamp only|Initial & Final temperatures|Initial & Final humidities
-- 23|Individual readings timestamp|Initial & Final temperatures|Initial & Final humidities
-- 24|Start & end timestamp|Initial & Final temperatures|Max & Min humidities
-- 25|Start timestamp only|Initial & Final temperatures|Max & Min humidities
-- 26|End timestamp only|Initial & Final temperatures|Max & Min humidities
-- 27|Individual readings timestamp|Initial & Final temperatures|Max & Min humidities
-- 28|Start & end timestamp|Initial & Final temperatures|Unique humidity measurement
-- 29|Start timestamp only|Initial & Final temperatures|Unique humidity measurement
-- 30|End timestamp only|Initial & Final temperatures|Unique humidity measurement
-- 31|Individual readings timestamp|Initial & Final temperatures|Unique humidity measurement
-- 32|Start & end timestamp|Max & Min temperatures|No humidity known
-- 33|Start timestamp only|Max & Min temperatures|No humidity known
-- 34|End timestamp only|Max & Min temperatures|No humidity known
-- 35|Individual readings timestamp|Max & Min temperatures|No humidity known
-- 36|Start & end timestamp|Max & Min temperatures|Initial & Final humidities
-- 37|Start timestamp only|Max & Min temperatures|Initial & Final humidities
-- 38|End timestamp only|Max & Min temperatures|Initial & Final humidities
-- 39|Individual readings timestamp|Max & Min temperatures|Initial & Final humidities
-- 40|Start & end timestamp|Max & Min temperatures|Max & Min humidities
-- 41|Start timestamp only|Max & Min temperatures|Max & Min humidities
-- 42|End timestamp only|Max & Min temperatures|Max & Min humidities
-- 43|Individual readings timestamp|Max & Min temperatures|Max & Min humidities
-- 44|Start & end timestamp|Max & Min temperatures|Unique humidity measurement
-- 45|Start timestamp only|Max & Min temperatures|Unique humidity measurement
-- 46|End timestamp only|Max & Min temperatures|Unique humidity measurement
-- 47|Individual readings timestamp|Max & Min temperatures|Unique humidity measurement
-- 48|Start & end timestamp|Unique temperatures measurement|No humidity known
-- 49|Start timestamp only|Unique temperatures measurement|No humidity known
-- 50|End timestamp only|Unique temperatures measurement|No humidity known
-- 51|Individual readings timestamp|Unique temperatures measurement|No humidity known
-- 52|Start & end timestamp|Unique temperatures measurement|Initial & Final humidities
-- 53|Start timestamp only|Unique temperatures measurement|Initial & Final humidities
-- 54|End timestamp only|Unique temperatures measurement|Initial & Final humidities
-- 55|Individual readings timestamp|Unique temperatures measurement|Initial & Final humidities
-- 56|Start & end timestamp|Unique temperatures measurement|Max & Min humidities
-- 57|Start timestamp only|Unique temperatures measurement|Max & Min humidities
-- 58|End timestamp only|Unique temperatures measurement|Max & Min humidities
-- 59|Individual readings timestamp|Unique temperatures measurement|Max & Min humidities
-- 60|Start & end timestamp|Unique temperatures measurement|Unique humidity measurement
-- 61|Start timestamp only|Unique temperatures measurement|Unique humidity measurement
-- 62|End timestamp only|Unique temperatures measurement|Unique humidity measurement
-- 63|Individual readings timestamp|Unique temperatures measurement|Unique humidity measurement

