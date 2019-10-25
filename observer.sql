PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS observer_t
    (
        observer_id  INTEGER PRIMARY KEY AUTOINCREMENT,
        name         TEXT, -- Site Name i.e Cerro de Almodovar
        surname      TEXT, -- in floating point degrees, negative west
        nickname     TEXT, -- nickname in epicollect5
        organization TEXT, -- i.e. AstroHenares
        valid_since  TEXT  -- timestamp since organization value is valid
        valid_until  TEXT  DEFAULT '2999-12-31T23:59:59', -- timestamp until organization value is valid
        valid_state  TEXT  DEFAULT 'Current'              -- either "Current" or "Expired"
    );
COMMIT;
