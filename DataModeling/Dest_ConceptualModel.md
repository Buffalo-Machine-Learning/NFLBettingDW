[← Back to README](../README.md)

# NFL Data Model (Mermaid)

```mermaid
erDiagram

  GAMES {
    string game_id PK
    int season
    int week
    string season_type
    date gameday
    string gametime
    string home_team FK
    string away_team FK
    int home_score
    int away_score
    string location
    string stadium
    string surface
    string roof
    string weather
    int temp
    int wind
    float vegas_line
    float over_under_line
    int home_moneyline
    int away_moneyline
    float spread_line
    string spread_favorite
    boolean div_game
    float total
    float elapsed_share
  }

  TEAMS {
    string team PK
    string team_name
    string abbreviation
    string location
    string city
    string state
    string conference
    string division
    int from_year
    int to_year
    string team_id
  }

  PLAYERS {
    string player_id PK
    string gsis_id
    string pfr_id
    string pfr_name
    string sportradar_id
    string espn_id
    string fantasy_data_id
    string yahoo_id
    string first_name
    string last_name
    string full_name
    string position
    string position_group
    string status
    int height
    int weight
    date birth_date
    string college
    int years_exp
  }

  ROSTER {
    int season PK
    string team PK, FK
    string gsis_id PK
    string player_name
    string position
    string depth_chart_position
    int jersey_number
    string status
    int height
    int weight
    string college
    date birth_date
    int years_exp
  }

  DRAFT_PICKS {
    int season PK
    int round PK
    int pick PK
    int overall
    string team FK
    string player_id FK
    string player_name
    string position
    string college
    int age
    int height
    int weight
    string pfr_player_id
  }

  PLAY_BY_PLAY {
    string game_id PK, FK
    int play_id PK

    string old_game_id
    string home_team
    string away_team
    string posteam FK
    string posteam_type
    string defteam FK
    string side_of_field
    int yardline_100
    date game_date
    int quarter_seconds_remaining
    int half_seconds_remaining
    int game_seconds_remaining
    string game_half
    int drive
    int sp
    int qtr
    int down
    boolean goal_to_go
    string time
    int ydstogo
    int ydsnet
    int series
    boolean series_success
    int drive_play_count
    string drive_time_of_possession
    int drive_first_downs
    boolean drive_inside20
    boolean drive_ended_with_score
    int drive_yards_penalized
    string drive_start_transition
    string drive_end_transition

    string desc
    string play_type
    int yards_gained
    boolean shotgun
    boolean no_huddle
    boolean qb_dropback
    boolean qb_kneel
    boolean qb_spike
    boolean qb_scramble
    string pass_length
    string pass_location
    int air_yards
    int yards_after_catch
    string run_location
    string run_gap
    string field_goal_result
    int kick_distance
    boolean fumble
    string fumble_recovery_1_team
    int fumble_recovery_1_yards
    string fumble_recovery_2_team
    int fumble_recovery_2_yards
    boolean interception
    boolean lateral_reception
    boolean lateral_rush
    boolean lateral_return
    boolean penalty
    int penalty_yards

    boolean touchback
    string extra_point_result
    string two_point_conv_result
    boolean safety
    string td_team
    boolean rush_attempt
    boolean pass_attempt
    boolean sack
    boolean touchdown
    boolean pass_touchdown
    boolean rush_touchdown
    boolean return_touchdown
    boolean extra_point_attempt
    boolean two_point_attempt
    boolean field_goal_attempt
    boolean kickoff_attempt
    boolean punt_attempt
    boolean fumble_forced
    boolean fumble_out_of_bounds
    boolean solo_tackle
    boolean assist_tackle
    boolean tackle_for_loss
    boolean qb_hit
    string forced_fumble_player_1
    string forced_fumble_player_2
    string solo_tackle_1_player_id
    string solo_tackle_2_player_id
    string assist_tackle_1_player_id
    string assist_tackle_2_player_id
    string forced_fumble_player_1_player_id
    string interception_player_id

    float epa
    float air_epa
    float yac_epa
    float comp_air_epa
    float comp_yac_epa
    float total_home_epa
    float total_away_epa
    float wp
    float wpa
    float vegas_wpa
    float vegas_home_wpa
    boolean down_end_conversion
    float home_wp
    float away_wp
    float vegas_wp
    float vegas_home_wp
    boolean success

    string passer_player_id
    string passer_player_name
    string receiver_player_id
    string receiver_player_name
    string rusher_player_id
    string rusher_player_name
    string lateral_receiver_id
    string lateral_receiver_name
    string lateral_rusher_id
    string lateral_rusher_name

    int home_score
    int away_score
    int score_differential
    int posteam_score
    int defteam_score
    int posteam_score_post
    int defteam_score_post
    int score_differential_post
    float no_score_prob
    boolean timeout
    string timeout_team
    int temp
    int wind
    string roof
    string surface
  }

  PBP_PARTICIPATION {
    string game_id PK, FK
    int play_id PK, FK
    string offense_players
    string defense_players
    string offense_line_players
    string qb_player_id
    string rb_player_id
    string wr_player_id
    string te_player_id
    string defense_line_players
    string linebacker_players
    string secondary_players
    string special_teams_players
  }

  %% Relationships
  TEAMS ||--o{ GAMES : home_team
  TEAMS ||--o{ GAMES : away_team

  GAMES ||--o{ PLAY_BY_PLAY : game_id
  TEAMS ||--o{ PLAY_BY_PLAY : posteam
  TEAMS ||--o{ PLAY_BY_PLAY : defteam

  TEAMS ||--o{ ROSTER : team

  PLAY_BY_PLAY ||--o{ PBP_PARTICIPATION : game_play
  TEAMS ||--o{ DRAFT_PICKS : team
  PLAYERS ||--o{ DRAFT_PICKS : player_id
