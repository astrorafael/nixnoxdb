PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS observer_t
(
	observer_id  INTEGER PRIMARY KEY,
	name         TEXT NOT NULL, -- Site Name i.e Cerro de Almodovar
	surname      TEXT NOT NULL, -- in floating point degrees, negative west
	nickname     TEXT, -- nickname in epicollect5
	organization TEXT, -- i.e. AstroHenares
	valid_since  TEXT  DEFAULT CURRENT_TIMESTAMP, -- timestamp since organization value is valid
	valid_until  TEXT  DEFAULT '2999-12-31 23:59:59', 
    valid_state  TEXT  DEFAULT 'Current'
    -- PRIMARY KEY (name, surname)
);

CREATE TABLE IF NOT EXISTS group_t
(
	group_id     INTEGER PRIMARY KEY,
	group_alias  TEXT,
	observer_id  INTEGER NOT NULL REFERENCES observer_t(observer_id)
	-- PRIMARY KEY (group_alias, observer_id)
);

-- Observador principal y adicionales
INSERT INTO observer_t(name, surname, organization) VALUES("Fernando", "Jauregui", "AstroNavarra");
INSERT INTO observer_t(name, surname, organization) VALUES("Periko", "Martorell", "AstroNavarra");
INSERT INTO observer_t(name, surname, organization) VALUES("David", "Cebrian","AstroNavarra");

-- mete los observadores secundarios en un
INSERT INTO group_t(group_alias, observer_id) 
	VALUES("Fernando et al.", (SELECT observer_id FROM observer_t WHERE name = "Periko" AND surname = "Martorell"));
INSERT INTO group_t(group_alias, observer_id) 
	VALUES("Fernando et al.", (SELECT observer_id FROM observer_t WHERE name = "David" AND surname = "Cebrian"));

COMMIT;