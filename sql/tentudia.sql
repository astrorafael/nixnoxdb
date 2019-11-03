PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TEMP TABLE IF NOT EXISTS Variables (Name TEXT PRIMARY KEY, Value TEXT);						

INSERT INTO observation_t(date_1_id,time_1_id,photometer_id,site_id,observer_id,flags_id,temperature_1,humidity_1)
VALUES(
	20140614, 003000, -- date 1 & time 1 ids are start date & time
	(SELECT p.photometer_id FROM photometer_owner_t as p JOIN observer_t as o USING (observer_id) WHERE o.name = "Felipe" AND o.surname = "Gallego"),
	(SELECT site_id         FROM site_t             WHERE site = "Monasterio de Tentudia"),
	(SELECT observer_id     FROM observer_t         WHERE name = "Felipe" AND surname = "Gallego"),
	(SELECT flags_id        FROM flags_t            WHERE timestamp_method = "Start timestamp only" AND temperature_method = "Unique temperature measurement" AND humidity_method = "Unique humidity measurement"),
	24,
	74
);
	
-- Keep the last row id (observation id) to insert readings
INSERT OR REPLACE INTO Variables VALUES ('observation_id', (SELECT last_insert_rowid()) );

-- m20 = [20.65, 20.59, 20.44, 20.69, 20.75, 20.71, 20.6, 20.75, 20.75, 20.78, 20.75, 20.75]	

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 0, 20.65);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 30, 20.59);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 60, 20.44);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 90, 20.69);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 120, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 150, 20.71);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 180, 20.6);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 210, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 240, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 270, 20.78);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 300, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 20, 330, 20.75);

-- m40 = [20.83, 20.89, 20.94, 20.99, 21.04, 21.01, 21.05, 21.02, 20.95, 20.95, 21, 20.9]	

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 0, 20.83);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 30, 20.89);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 60, 20.94);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 90, 20.99);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 120, 21.04);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 150, 21.01);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 180, 21.05);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 210, 21.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 240, 20.95);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 270, 20.95);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 300, 21);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 40, 330, 20.9);

-- m60 = [21.14, 21.16, 21.22, 21.24, 21.26, 21.23, 21.26, 21.3, 21.24, 21.25, 21.18, 21.09]	

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 0, 21.14);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 30, 21.16);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 60, 21.22);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 90, 21.24);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 120, 21.26);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 150, 21.23);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 180, 21.26);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 210, 21.3);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 240, 21.24);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 270, 21.25);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 300, 21.18);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 330, 21.09);

-- m80 = [21.34, 21.3, 21.34, 21.27, 21.32, 21.35, 21.48, 21.43, 21.4, 21.39, 21.3, 21.33]	

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 0, 21.34);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 30, 21.3);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 60, 21.34);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 90, 21.27);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 120, 21.32);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 150, 21.35);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 180, 21.48);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 210, 21.43);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 240, 21.4);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 270, 21.39);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 300, 21.3);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 80, 330, 21.33);

-- m90 = [21.43]	

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 90, 0, 21.43);

COMMIT;
