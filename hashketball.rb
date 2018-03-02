require "pry"

def game_hash

  teams = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        },
      },
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        },
      },
    }
  }

 teams

end

def num_points_scored(player_search)

  player_points = []

  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if data.class == Hash
        data.collect do |player, details|
          if player == player_search
            details.collect do |item, number|
              if item == :points
                player_points = number
              end
            end
          end
        end
      end
    end
  end

  player_points

end

def shoe_size(player_search)

  player_shoe = []

  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if data.class == Hash
        data.collect do |player, details|
          if player == player_search
            details.collect do |item, number|
              if item == :shoe
                player_shoe = number
              end
            end
          end
        end
      end
    end
  end

  player_shoe

end


def team_colors(team_name)

  searched_team_colors = []

  game_hash.collect do |location, team_data|
    if team_data.has_value?(team_name)
      team_data.collect do |attribute, data|
        if attribute == :colors
          data.collect do |those_colors|
            searched_team_colors << those_colors
          end
        end
      end
    end
  end

  searched_team_colors

end


def team_names

  all_names = []

  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :team_name
        all_names << data
      end
    end
  end

  all_names

end

def player_numbers(team_name)

  teams_numbers = []

  game_hash.collect do |location, team_data|
    if team_data.has_value?(team_name)
      team_data.collect do |attribute, data|
        if attribute == :players
          data.collect do |name, player_stats|
            player_stats.collect do |item, value|
              if item == :number
                teams_numbers << value
              end
            end
          end
        end
      end
    end
  end

  teams_numbers

end


def player_stats(player_name)

  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if data.class == Hash
        data.collect do |player, details|
          if player == player_name
            return details
          end
        end
      end
    end
  end

end

def big_shoe_rebounds

  biggest_shoe_player = ""
  biggest_shoe_rebounds = ""
  shoe_value = 0

  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if data.class == Hash
        data.collect do |player, details|
          details.collect do |item, value|
            if item == :shoe
              if value > shoe_value
                shoe_value = value
                biggest_shoe_player = player
              end
            end
          end
        end
      end
    end
  end

  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if data.class == Hash
        data.collect do |player, details|
          if player == biggest_shoe_player
            details.collect do |item, value|
              if item == :rebounds
                biggest_shoe_rebounds = value
              end
            end
          end
        end
      end
    end
  end

  return biggest_shoe_rebounds

end
