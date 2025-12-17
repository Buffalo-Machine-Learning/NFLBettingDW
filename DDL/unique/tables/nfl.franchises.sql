-- Table: nfl.franchises
CREATE TABLE IF NOT EXISTS nfl.franchises (
    franchise_uid SERIAL PRIMARY KEY,
    current_team_uid bigint NOT NULL,
    created_date TIMESTAMP NOT NULL DEFAULT NOW(),
    modified_date TIMESTAMP NOT NULL DEFAULT NOW(),
    franchise_name VARCHAR(100) NOT NULL,
    team_conference VARCHAR(50) NOT NULL,
    team_division VARCHAR(50) NOT NULL,
    UNIQUE (franchise_name)
);

