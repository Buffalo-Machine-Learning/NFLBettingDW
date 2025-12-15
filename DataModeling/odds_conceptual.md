## Odds Data Model

[← Back to README](../README.md)

```mermaid
erDiagram
    game_props {
        bigint game_props_uid PK
        datetime created_date
        datetime modified_date
        bigint game_id FK
        jsonb game_props
    }

    individual_player_props {
        bigint individual_player_props PK
        datetime created_date
        datetime modified_date
        bigint player_id FK
        bigint game_id FK
        jsonb player_props
    }