[← Back to README](../README.md)

# NFL Betting DW – Foreign Key Lineage (Attribute-Level)

This diagram shows **explicit foreign-key relationships at the column level**.
All arrows point from **FK columns → referenced PK columns**.

> Note: This complements the ER diagram. Mermaid ER cannot draw column-level arrows, so this flowchart exists for precision and auditability.

---

## Foreign Key Flowchart

```mermaid
flowchart LR

  %% ===============================
  %% Franchise / Team Relationships
  %% ===============================

  GAMES_HOME["GAMES.home_franchise_uid (BIGINT)"]
  GAMES_AWAY["GAMES.away_franchise_uid (BIGINT)"]
  PBP_POST["PLAY_BY_PLAY.posteam_franchise_uid (BIGINT)"]
  PBP_DEF["PLAY_BY_PLAY.defteam_franchise_uid (BIGINT)"]
  ROST_FR["ROSTER.franchise_uid (BIGINT)"]
  DRAFT_FR["DRAFT_PICKS.franchise_uid (BIGINT)"]
  TEAM_FR["DIM_TEAM.franchise_uid (BIGINT)"]

  FR_PK["DIM_FRANCHISE.franchise_uid (BIGINT PK)"]

  GAMES_HOME --> FR_PK
  GAMES_AWAY --> FR_PK
  PBP_POST --> FR_PK
  PBP_DEF --> FR_PK
  ROST_FR --> FR_PK
  DRAFT_FR --> FR_PK
  TEAM_FR --> FR_PK


  %% ===============================
  %% Current Team Pointer
  %% ===============================

  FR_CUR_TEAM["DIM_FRANCHISE.current_team_uid (BIGINT)"]
  TEAM_PK["DIM_TEAM.team_uid (BIGINT PK)"]

  FR_CUR_TEAM --> TEAM_PK


  %% ===============================
  %% Game / Play Relationships
  %% ===============================

  PBP_GAME["PLAY_BY_PLAY.game_id"]
  PART_GAME["PBP_PARTICIPATION.game_id"]
  GAME_PK["GAMES.game_id (Natural Key)"]

  PBP_GAME --> GAME_PK
  PART_GAME --> GAME_PK

  PART_PLAY["PBP_PARTICIPATION.play_id"]
  PBP_PLAY["PLAY_BY_PLAY.play_id"]

  PART_PLAY --> PBP_PLAY


  %% ===============================
  %% Player Relationships
  %% ===============================

  DRAFT_PLAYER["DRAFT_PICKS.players_uid (BIGINT)"]
  PLAYER_PK["DIM_PLAYERS.players_uid (BIGINT PK)"]

  DRAFT_PLAYER --> PLAYER_PK


  %% ===============================
  %% Player Lists / Arrays
  %% ===============================

  ROST_LIST["ROSTER.players_uid_list (BIGINT[])"]
  OFF_LIST["PBP_PARTICIPATION.offense_players_uid_list (BIGINT[])"]
  DEF_LIST["PBP_PARTICIPATION.defense_players_uid_list (BIGINT[])"]

  ROST_LIST --> PLAYER_PK
  OFF_LIST --> PLAYER_PK
  DEF_LIST --> PLAYER_PK
