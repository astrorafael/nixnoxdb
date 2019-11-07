PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

INSERT OR REPLACE INTO site_t(site,latitude,longitude,latitude_sexa,longitude_sexa,longitude_rad,latitude_rad,altitude,location,province,region) 
	VALUES("Observatorio de Guirguillano",
		sexa2latitude("42 42 41.39 N"),
		sexa2longitude("01 51 52.46 W"), 
		"42 42 41.39 N",
		"01 51 52.46 W",
		radians(sexa2latitude("42 42 41.39 N")),
		radians(sexa2longitude("01 51 52.46 W")),
		500, 
		"Guirguillano", "Navarra", "Navarra");

INSERT OR REPLACE INTO site_t(site,latitude,longitude,latitude_sexa,longitude_sexa,longitude_rad,latitude_rad,altitude,location,province,region) 
	VALUES("Sant Pau de Pinós",
		sexa2latitude("41 58 12.63 N"),
		sexa2longitude("01 57 22.94 E"),
		"41 58 12.63 N",
		"01 57 22.94 E",
		radians(sexa2latitude("41 58 12.63 N")),
		radians(sexa2longitude("01 57 22.94 E")), 
		774, 
		"Santa Maria de Merlès", "Barcelona", "Cataluña");

INSERT OR REPLACE INTO site_t(site,latitude,longitude,latitude_sexa,longitude_sexa,longitude_rad,latitude_rad,altitude,location,province,region) 
	VALUES("Santuario Virgen de las veredas",
		sexa2latitude("38 31 26.76 N"),
		sexa2longitude("04 38 45.6 W"), 
		"38 31 26.76 N",
		"04 38 45.6 W", 
		radians(sexa2latitude("38 31 26.76 N")), 
		radians(sexa2longitude("04 38 45.6 W")), 
		481, 
		"Torrecampo", "Córdoba", "Andalucía");

INSERT OR REPLACE INTO site_t(site,latitude,longitude,latitude_sexa,longitude_sexa,longitude_rad,latitude_rad,altitude,location,province,region) 
	VALUES("Venta de la Leche",
		sexa2latitude("36 59 59.34 N"),
		sexa2longitude("04 12 29.10 W"), 
		"36 59 59.34 N",
		"04 12 29.10 W", 
		radians(sexa2latitude("36 59 59.34 N")),
		radians(sexa2longitude("04 12 29.10 W")), 
		1100, 
		"Zafarraya", "Granada", "Andalucía");

INSERT OR REPLACE INTO site_t(site,latitude,longitude,latitude_sexa,longitude_sexa,longitude_rad,latitude_rad,altitude,location,province,region) 
	VALUES("Monasterio de Tentudia",
		38.054005,
		-6.338339,
		latitude2sexa(38.054005),
		longitude2sexa(-6.338339),
		radians(38.054005),
		radians(-6.338339),
		1108, 
		"Calera de León", "Badajoz", "Andalucía");

COMMIT;
