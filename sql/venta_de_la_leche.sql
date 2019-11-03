PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TEMP TABLE IF NOT EXISTS Variables (Name TEXT PRIMARY KEY, Value TEXT);	


INSERT INTO observation_t(date_1_id,time_1_id,date_2_id,time_2_id,photometer_id,site_id,observer_id,flags_id,temperature_1,humidity_1,humidity_2)
VALUES(
	20120518, 232700,     -- date 1 & time 1 ids are start date & time
	20120519, 014700,     -- date 2 & time 2 ids are end date & time
	(SELECT p.photometer_id FROM photometer_owner_t as p JOIN observer_t as o USING (observer_id) WHERE o.name = "Jesús" AND o.surname = "Navas Fernández"),
	(SELECT site_id         FROM site_t             WHERE site = "Venta de la Leche"),
	(SELECT observer_id     FROM observer_t         WHERE name = "Jesús" AND surname = "Navas Fernández"),
	(SELECT flags_id        FROM flags_t            WHERE timestamp_method = "Start & end timestamp" AND temperature_method = "Unique temperature measurement" AND humidity_method = "Max & Min humidities"),
	20,
	40, 25
);
	 

-- Keep the last row id (observation id) to insert readings
INSERT OR REPLACE INTO Variables VALUES ('observation_id', (SELECT last_insert_rowid()) );

-- m00 = [21.01, 21.03, 20.81, 20.48, 20.42, 20.52, 20.50, 20.38, 20.46, 20.64, 20.72, 20.80, 
--        20.94, 21.07, 20.93, 20.78, 20.63, 20.57, 20.65, 20.69, 20.67, 20.66, 20.74, 20.91]

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 0, 21.01);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 15, 21.03);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 30, 20.81);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 45, 20.48);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 60, 20.42);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 75, 20.52);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 90, 20.50);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 105, 20.38);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 120, 20.46);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 135, 20.64);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 150, 20.72);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 165, 20.80);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 180, 20.94);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 195,  21.07);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 210, 20.93);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 225, 20.78);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 240, 20.63);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 255, 20.57);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 270, 20.65);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 285, 20.69);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 300, 20.67);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 315, 20.66);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 330, 20.74);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 00, 345, 20.91);


-- m15 = [20.56, 20.56, 20.41, 20.22, 20.22, 20.33, 20.39, 20.41, 20.48, 20.55, 20.61, 20.66, 
--        20.70, 20.75, 20.65, 20.55, 20.47, 20.46, 20.52, 20.55, 20.54, 20.54, 20.53, 20.55]

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 0, 20.56);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 15, 20.56);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 30, 20.41);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 45, 20.22);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 60, 20.22);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 75, 20.33);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 90, 20.39);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 105, 20.41);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 120, 20.48);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 135, 20.55);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 150, 20.61);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 165, 20.66);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 180, 20.70);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 195, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 210, 20.65);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 225, 20.55);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 240, 20.47);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 255, 20.46);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 270, 20.52);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 285, 20.55);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 300, 20.54);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 315, 20.54);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 330, 20.53);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 15, 345, 20.55);

-- m30 = [20.74, 20.71, 20.67, 20.62, 20.59, 20.60, 20.63, 20.68, 20.74, 20.80, 20.83, 20.87, 
--        20.89, 20.88, 20.85, 20.79, 20.75, 20.75, 20.77, 20.80, 20.79, 20.80, 20.78, 20.77]

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 0, 20.74);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 15, 20.71);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 30, 20.67);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 45, 20.62);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 60, 20.59);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 75, 20.60);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 90, 20.63);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 105, 20.68);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 120, 20.74);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 135, 20.80);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 150, 20.83);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 165, 20.87);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 180, 20.89);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 195, 20.88);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 210, 20.85);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 225, 20.79);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 240, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 255, 20.75);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 270, 20.77);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 285, 20.80);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 300, 20.79);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 315, 20.80);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 330, 20.78);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 30, 345, 20.77);


-- m45 = [20.98, 20.96, 20.94, 20.93, 20.89, 20.85, 20.81, 20.81, 20.85, 20.92, 20.97, 21.01,
--       21.00, 20.99, 20.96, 20.93, 20.93, 20.96, 21.00, 21.02, 21.03, 21.04, 21.03, 21.00]

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 0, 20.98);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 15, 20.96);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 30, 20.94);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 45, 20.93);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 60, 20.89);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 75, 20.85);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 90, 20.81);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 105, 20.81);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 120, 20.85);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 135, 20.92);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 150, 20.97);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 165, 21.01);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 180, 21.00);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 195, 20.99);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 210, 20.96);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 225, 20.93);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 240, 20.93);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 255, 20.96);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 270, 21.00);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 285, 21.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 45, 300, 21.03);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 315, 21.04);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 330, 21.03);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 345, 21.00);


-- m60 = [21.16, 21.15, 21.13, 21.12, 21.10, 21.07, 21.02, 21.00, 20.97, 20.97, 21.02, 21.02, 
---       21.02, 21.03, 21.03, 21.04, 21.06, 21.09, 21.13, 21.16, 21.18, 21.18, 21.18, 21.17]

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 0, 21.16);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 15, 21.15);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 30, 21.13);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 45, 21.12);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 60, 21.10);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 75, 21.07);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 90, 21.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 105, 21.00);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 120, 20.97);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 135, 20.97);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 150, 21.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 165, 21.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 180, 21.02);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 195, 21.03);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 210, 21.03);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 225, 21.04);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 240, 21.06);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 255, 21.09);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 270, 21.13);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 285, 21.16);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 300, 21.18);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 315, 21.18);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 330, 21.18);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 60, 345, 21.17);


-- m75 = [21.20, 21.20, 21.20, 21.19, 21.18, 21.18, 21.16, 21.15, 21.14, 21.13, 21.13, 21.13, 
---       21.13, 21.13, 21.13, 21.16, 21.17, 21.18, 21.19, 21.21, 21.19, 21.21, 21.21, 21.21]

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 0, 21.20);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 15, 21.20);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 30, 21.20);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 45, 21.19);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 60, 21.18);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 75, 21.18);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 90, 21.16);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 105, 21.15);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 120, 21.14);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 135, 21.13);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 150, 21.13);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 165, 21.13);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 180, 21.13);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 195, 21.13);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 210, 21.13);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 225, 21.16);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 240, 21.17);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 255, 21.18);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 270, 21.19);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 285, 21.21);	
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 300, 21.19);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 315, 21.21);	
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 330, 21.21);
INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 75, 345, 21.21);

-- m90 = [21.21]

INSERT INTO readings_t(observation_id, altitude, azimuth, magnitude)
	VALUES( (SELECT Value FROM Variables WHERE Name = 'observation_id'), 90, 0, 21.21);

COMMIT;
