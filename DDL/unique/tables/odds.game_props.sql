-- Table: odds.game_props
CREATE TABLE IF NOT EXISTS odds.game_props (
    game_props_uid SERIAL PRIMARY KEY,
    created_date TIMESTAMP NOT NULL DEFAULT NOW(),
    modified_date TIMESTAMP NOT NULL DEFAULT NOW(),
    game_id bigint NOT NULL,
    game_props JSONB NOT NULL,
    UNIQUE (game_id)
);