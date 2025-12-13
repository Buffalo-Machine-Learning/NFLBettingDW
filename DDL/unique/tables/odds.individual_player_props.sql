-- Table: odds.individual_player_props
CREATE TABLE IF NOT EXISTS odds.individual_player_props (
    individual_player_props_uid SERIAL PRIMARY KEY,
    created_date TIMESTAMP NOT NULL DEFAULT NOW(),
    modified_date TIMESTAMP NOT NULL DEFAULT NOW(),
    player_id bigint NOT NULL,
    game_id bigint NOT NULL,
    player_props JSONB NOT NULL,
    UNIQUE (player_id, game_id)
);