# NFL Betting DW – ER Diagram

```mermaid
erDiagram

  DIM_FRANCHISE {
    bigint franchise_uid PK
    bigint current_team_uid FK
    datetime created_date
    datetime modified_date
    string franchise_name
    string team_conference
    string team_division
  }

  DIM_TEAM {
    bigint team_uid PK
    bigint franchise_uid FK
    datetime created_date
    datetime modified_date
    string team_abbr
    string team_name
    string city
    string nickname
  }

  DIM_PLAYERS {
    bigint players_uid PK
    datetime created_date
    datetime modified_date
    string gsis_id
    string player_id
    string first_name
    string last_name
    string full_name
    string position
    date birth_date
    string college
    int years_exp
  }

  DIM_PLAYER_STATUS {
    bigint player_status_uid PK
    datetime created_date
    datetime modified_date
    string status_code
    string status_name
    string description
  }

  GAMES {
    bigint games_uid PK
    datetime created_date
    datetime modified_date
    string game_id
    int season
    int week
    string season_type
    date gameday
    string gametime
    bigint home_franchise_uid FK
    bigint away_franchise_uid FK
    int home_score
    int away_score
  }

  PLAY_BY_PLAY {
    bigint play_by_play_uid PK
    datetime created_date
    datetime modified_date
    string game_id FK
    int play_id
    bigint posteam_franchise_uid FK
    bigint defteam_franchise_uid FK
    int qtr
    int down
    int ydstogo
    int yardline_100
    string play_type
    string desc
    float epa
  }

  PBP_PARTICIPATION {
    bigint pbp_participation_uid PK
    datetime created_date
    datetime modified_date
    string game_id FK
    int play_id FK
    string offense_players_uid_list
    string defense_players_uid_list
  }

  ROSTER {
    bigint roster_uid PK
    datetime created_date
    datetime modified_date
    int season
    bigint franchise_uid FK
    string players_uid_list
    string position
    int jersey_number
    string status
  }

  DRAFT_PICKS {
    bigint draft_picks_uid PK
    datetime created_date
    datetime modified_date
    int season
    int round
    int pick
    int overall
    bigint franchise_uid FK
    bigint players_uid FK
    string position
    string college
  }

  GAME_PLAYER {
    bigint game_player_uid PK
    datetime created_date
    datetime modified_date
    string game_id FK
    bigint players_uid FK
    bigint franchise_uid FK
    int jersey_number
    bigint player_status_uid FK
    string position
  }

  %% Relationships
  DIM_FRANCHISE ||--o{ DIM_TEAM : has_identities
  DIM_TEAM ||--o| DIM_FRANCHISE : current_team

  DIM_FRANCHISE ||--o{ GAMES : home_franchise
  DIM_FRANCHISE ||--o{ GAMES : away_franchise

  GAMES ||--o{ PLAY_BY_PLAY : game_id
  DIM_FRANCHISE ||--o{ PLAY_BY_PLAY : posteam_franchise
  DIM_FRANCHISE ||--o{ PLAY_BY_PLAY : defteam_franchise

  PLAY_BY_PLAY ||--o{ PBP_PARTICIPATION : play

  DIM_FRANCHISE ||--o{ ROSTER : franchise
  DIM_FRANCHISE ||--o{ DRAFT_PICKS : franchise
  DIM_PLAYERS ||--o{ DRAFT_PICKS : player

  GAMES ||--o{ GAME_PLAYER : game
  DIM_PLAYERS ||--o{ GAME_PLAYER : player
  DIM_FRANCHISE ||--o{ GAME_PLAYER : franchise
  DIM_PLAYER_STATUS ||--o{ GAME_PLAYER : status
