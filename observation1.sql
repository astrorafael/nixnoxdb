PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TEMP TABLE IF NOT EXISTS Variables (Name TEXT PRIMARY KEY, Value TEXT);

-- # FECHA	24/03/2012
-- # HORA INICIO	01:00	# HORA FINAL 	02:41	
INSERT INTO observation_t(start_date_id,start_time_id,end_date_id,end_time_id,photometer_id,site_id,observer_id,other_observers,comment,flags_id)
VALUES(
	20120124, 010000,
	20120124, 024100,
	(SELECT p.photometer_id FROM photometer_owner_t as p JOIN observer_t as o USING (observer_id) WHERE o.name = "Fernando" AND o.surname = "Jáuregui"),
	(SELECT site_id         FROM site_t             WHERE site = "Observatorio de Guirguillano"),
	(SELECT observer_id     FROM observer_t        WHERE name = "Fernando" AND surname = "Jáuregui"),
	"Periko Martorell y David Cebrián",
	"Example comment",
	(SELECT flags_id        FROM flags_t            WHERE timestamp_method = "Start & end timestamp, equal interpolated timestamp readings")
);

-- Keep the last row id (observation id) to insert readings
INSERT OR REPLACE INTO Variables VALUES ('observation_id', (SELECT last_insert_rowid()) );

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 0, 20.09);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 15, 19.99);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 30, 20.24);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 45, 20.05);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 60,  19.81);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 75, 19.83);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 90, 19.96);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 105, 19.82);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 120, 20.00);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 135, 19.97);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 150, 20.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 165, 20.58);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 180, 20.84);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 195, 21.07);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 210, 21.26);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 225, 21.48);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 240, 21.54);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 255, 21.48);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 270, 21.41);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 285, 21.18);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 300, 21.11);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 315, 19.95);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 330, 19.76);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 345, 20.59);

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 0, 19.87);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 15, 19.70);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 0, 30, 19.72);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 45, 19.48);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 60, 19.30);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 75, 19.32);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 90, 19.54);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 105, 19.57);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 120, 19.73);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 135, 10.77);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 150, 19.86);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 165, 20.11);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 180, 20.24);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 195, 20.38);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 210, 20.48);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 225, 20.52);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 240, 20.50);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 255, 20.47);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 270, 20.46);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 285, 20.40);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 300, 20.38);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 315, 20.07);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 330, 20.81);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 345, 20.14);

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 0, 20.35);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 15, 20.24);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 30, 20.11);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 45, 19.89);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 60, 19.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 75, 19.79);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 90, 19.96);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 105, 20.11);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 120, 20.20);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 135, 20.26);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 150, 20.33);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 165, 20.39);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 180, 20.44);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 195, 20.48);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 210, 20.50);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 225, 20.48);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 240, 20.44);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 255, 20.42);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 270, 20.43);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 285, 20.42);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 300, 20.42);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 315, 20.41);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 330, 20.41);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 345, 20.42);

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 0, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 30, 20.59);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 60, 20.43);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 90, 20.49);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 120, 20.62);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 150, 20.70);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 180, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 210, 20.77);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 240, 20.74);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 270, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 300, 20.78);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 330, 20.79);

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 0, 21.00);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 30, 20.93);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 60, 20.86);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 90, 20.87);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 120, 20.91);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 150, 20.95);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 180, 20.98);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 210, 20.98);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 240, 20.98);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 270, 21.00);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 300, 21.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 330, 21.03);

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 0, 21.16);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 45, 21.10);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 90, 21.08);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 135, 21.08);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 180, 21.11);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 225, 21.14);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 270, 21.16);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 315, 21.18);

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 90, 0, 21.21);

COMMIT;

-- Possible values are:
-- 0 = Individual timepstamp readings
-- 1 = Start timestamp given, forward readings interpolation assuming 5 minutes each
-- 2 = End timestamp given, backwards readings interpolation assuming 5 minutes each
-- 3 = Both start & end timestamp, equal interpolated timestamp readings
