-- Table: nfl.teams
CREATE TABLE IF NOT EXISTS nfl.teams (
    team_uid SERIAL PRIMARY KEY,
    franchise_uid bigint NOT NULL,
    created_date TIMESTAMP NOT NULL DEFAULT NOW(),
    modified_date TIMESTAMP NOT NULL DEFAULT NOW(),
    team_abbr VARCHAR(10) NOT NULL,
    team_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    nickname VARCHAR(100) NOT NULL,
    UNIQUE (team_name)
);