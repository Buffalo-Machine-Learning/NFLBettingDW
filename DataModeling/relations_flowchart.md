# NFL Betting DW – Foreign Key Flowchart (Attribute-Level)

```mermaid
flowchart LR

  %% ===============================
  %% Franchise / Team
  %% ===============================

  FR_PK["DIM_FRANCHISE.franchise_uid (BIGINT PK)"]
  TEAM_PK["DIM_TEAM.team_uid (BIGINT PK)"]

  TEAM_FR["DIM_TEAM.franchise_uid (BIGINT)"] --> FR_PK
  FR_CURTEAM["DIM_FRANCHISE.current_team_uid (BIGINT)"] --> TEAM_PK


  %% ===============================
  %% Games / Plays
  %% ===============================

  GAME_ID_PK["GAMES.game_id (Natural Key)"]
  PLAY_ID_NODE["PLAY_BY_PLAY.play_id"]

  G_HOME["GAMES.home_franchise_uid (BIGINT)"] --> FR_PK
  G_AWAY["GAMES.away_franchise_uid (BIGINT)"] --> FR_PK

  PBP_GAME["PLAY_BY_PLAY.game_id"] --> GAME_ID_PK
  PBP_POST["PLAY_BY_PLAY.posteam_franchise_uid (BIGINT)"] --> FR_PK
  PBP_DEF["PLAY_BY_PLAY.defteam_franchise_uid (BIGINT)"] --> FR_PK

  PART_GAME["PBP_PARTICIPATION.game_id"] --> GAME_ID_PK
  PART_PLAY["PBP_PARTICIPATION.play_id"] --> PLAY_ID_NODE


  %% ===============================
  %% Players
  %% ===============================

  PLAYER_PK["DIM_PLAYERS.players_uid (BIGINT PK)"]
  STATUS_PK["DIM_PLAYER_STATUS.player_status_uid (BIGINT PK)"]

  DRAFT_PLAYER["DRAFT_PICKS.players_uid (BIGINT)"] --> PLAYER_PK
  DRAFT_FR["DRAFT_PICKS.franchise_uid (BIGINT)"] --> FR_PK

  %% roster list is BIGINT[] in Postgres (shown here as list)
  ROST_FR["ROSTER.franchise_uid (BIGINT)"] --> FR_PK
  ROST_LIST["ROSTER.players_uid_list (BIGINT[])"] --> PLAYER_PK


  %% ===============================
  %% Game Player (most-used table)
  %% ===============================

  GP_GAME["GAME_PLAYER.game_id"] --> GAME_ID_PK
  GP_PLAYER["GAME_PLAYER.players_uid (BIGINT)"] --> PLAYER_PK
  GP_FR["GAME_PLAYER.franchise_uid (BIGINT)"] --> FR_PK
  GP_STATUS["GAME_PLAYER.player_status_uid (BIGINT)"] --> STATUS_PK

  %% ===============================
  %% odds Schema
  %% ===============================
  odds.game_props["odds.game_props.game_id"] --> GAME_ID_PK

  odds.player_props.game_id["odds.player_props.game_id"] --> GAME_ID_PK

  odds.player_props["odds.player_props.player_id"] --> PLAYER_PK

  %% ===============================
  %% Participation lists (BIGINT[])
  %% ===============================

  OFF_LIST["PBP_PARTICIPATION.offense_players_uid_list (BIGINT[])"] --> PLAYER_PK
  DEF_LIST["PBP_PARTICIPATION.defense_players_uid_list (BIGINT[])"] --> PLAYER_PK
  