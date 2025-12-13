## NFL Data Model (Keys-Only ERD)

[← Back to README](../README.md)

```mermaid
erDiagram

  GAMES {
    string game_id PK
  }

  TEAMS {
    string team PK
  }

  PLAYERS {
    string player_id PK
  }

  PLAY_BY_PLAY {
    string game_id PK, FK
    int play_id PK
    string posteam FK
    string defteam FK
  }

  ROSTER {
    int season PK
    string team PK, FK
    string gsis_id PK
  }

  PBP_PARTICIPATION {
    string game_id PK, FK
    int play_id PK, FK
    string gsis_id FK
  }

  DRAFT_PICKS {
    int season PK
    int round PK
    int pick PK
    string team FK
    string player_id FK
  }

  GAMES ||--o{ PLAY_BY_PLAY : "game_id"
  TEAMS ||--o{ PLAY_BY_PLAY : "posteam"
  TEAMS ||--o{ PLAY_BY_PLAY : "defteam"

  TEAMS ||--o{ ROSTER : "team"

  PLAY_BY_PLAY ||--o{ PBP_PARTICIPATION : "game_id+play_id"
  ROSTER ||--o{ PBP_PARTICIPATION : "gsis_id"

  TEAMS ||--o{ DRAFT_PICKS : "team"
  PLAYERS ||--o{ DRAFT_PICKS : "player_id"