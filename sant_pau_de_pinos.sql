PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TEMP TABLE IF NOT EXISTS Variables (Name TEXT PRIMARY KEY, Value TEXT);

-- # FECHA	24/03/2012
-- # HORA INICIO	01:00	# HORA FINAL 	02:41	
INSERT INTO observation_t(start_date_id,start_time_id,end_date_id,end_time_id,photometer_id,site_id,observer_id,flags_id,temperature_max, temperature_min,humidity_max,humidity_min,comment)
VALUES(
	20110827, 000900,
	20110827, 015300,
	(SELECT p.photometer_id FROM photometer_owner_t as p JOIN observer_t as o USING (observer_id) WHERE o.name = "Jordi" AND o.surname = "Medina"),
	(SELECT site_id         FROM site_t             WHERE site = "Sant Pau de Pinós"),
	(SELECT observer_id     FROM observer_t         WHERE name = "Jordi" AND surname = "Medina"),
	(SELECT flags_id        FROM flags_t            WHERE timestamp_method = "Start & end timestamp, equal interpolated timestamp readings"),
	14, 12, 53, 46,
	"Cielo completamente despejado y sin nubes mientras se tomaban las medidas con el SQM-L. 
	El acceso al lugar de observacion es libre y gratuito, pero el propietario del terreno 
	prefiere que le avisemos de que vamos a estar alli"
);
	

-- Keep the last row id (observation id) to insert readings
INSERT OR REPLACE INTO Variables VALUES ('observation_id', (SELECT last_insert_rowid()) );


INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 0, 19.82);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 30, 19.88);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 60, 20.19);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 90, 20.48);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 120, 20.74);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 150, 20.98);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 180, 20.84);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 210, 20.74);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 240, 20.52);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 270, 20.42);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 300, 20.24);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 330, 20.17);


INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 0, 20.62);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 30, 20.62);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 60, 20.71);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 90, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 120, 20.86);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 150, 21.00);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 180, 21.04);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 210, 21.00);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 240, 20.85);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 270, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 300, 20.66);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 330, 20.66);


INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 0, 21.01);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 30, 21.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 60, 21.04);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 90, 21.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 120, 20.98);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 150, 21.04);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 180, 21.10);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 210, 21.10);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 240, 21.04);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 270, 21.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 300, 20.96);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 330, 20.98);

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 0, 21.21);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 30, 21.22);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 60, 21.24);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 90, 21.21);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 120, 21.18);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 150, 21.14);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 180, 21.13);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 210, 21.13);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 240, 21.14);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 270, 21.18);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 300, 21.17);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 330, 21.18);

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 90, 0, 21.15);

COMMIT;

-- Possible values are:
-- 0 = Individual timepstamp readings
-- 1 = Start timestamp given, forward readings interpolation assuming 5 minutes each
-- 2 = End timestamp given, backwards readings interpolation assuming 5 minutes each
-- 3 = Both start & end timestamp, equal interpolated timestamp readings
