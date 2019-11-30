require 'awesome_print'

def game_hash
  game_hash = {
    home: {
      team_name:"Brooklyn Nets",
      colors:["Black", "White"],
      players:
      [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
          {
            player_name: "Reggie Evans",
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          },
          {
            player_name: "Brook Lopez",
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
          },
          {
            player_name: "Mason Plumlee",
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 11,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          },
          {
            player_name: "Jason Terry",
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1
          }
        ]
    },
    away: {
        team_name:"Charlotte Hornets",
        colors:["Turquoise", "Purple"],
        players:
        [
          {
            player_name: "Jeff Adrien",
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          },
          {
            player_name: "Bismack Biyombo",
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 22,
            blocks: 15,
            slam_dunks: 10
          },
          {
            player_name: "DeSagna Diop",
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          },
          {
            player_name: "Ben Gordon",
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          },
          {
            player_name: "Kemba Walker",
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 7,
            blocks: 5,
            slam_dunks: 12
          }
        ]
    }
  }

end

# return the number of points scored
def num_points_scored (name)
  points_scored = 0
  game_hash.each do | team, details_hash |
    players_array = details_hash[:players]

    players_array.each do | player_details_hash |

      if player_details_hash[:player_name] == name
        points_scored = player_details_hash[:points]
      end
   end
  end
  points_scored
end

def shoe_size(name)
  size = 0
  game_hash.each do | team, details_hash |
    players_array = details_hash[:players]

    players_array.each do | player_details_hash |
      if player_details_hash[:player_name] == name
        size = player_details_hash[:shoe]
      end
    end
  end
  size
end

def team_colors(name)
  colors = nil
  game_hash.each do | team, details_hash |
    if details_hash[:team_name] == name
      colors = details_hash[:colors]
    end
  end
  colors
end

def team_names
  name_array = []
  game_hash.each do | team, team_details |
    name = team_details[:team_name]
    name_array << name
  end
  name_array
end

def player_numbers(name_of_team)
  numbers_array = []
  game_hash.each do | team, details_hash|
    if details_hash[:team_name] == name_of_team
     players_details = details_hash[:players]
     players_details.each do | player |
      number = player[:number]
      numbers_array << number
     end
    end
  end
  numbers_array
end

def player_stats(name)
  stats_hash = {}
  game_hash.each do | team, details_hash |
    players_array = details_hash[:players]
    players_array.each do | player_details_hash |
      if player_details_hash[:player_name] == name
        stats_hash = player_details_hash
      end
    end

  end
  sanitized_stats_hash = stats_hash.reject { |key, value| value == name }
  sanitized_stats_hash
end

def big_shoe_rebounds
  largest_shoe = 0
  number_rebounds = 0

  game_hash.each do | team, details_hash |
    players_array = details_hash[:players]

    players_array.each do | player_details_hash |
      if player_details_hash[:shoe] > largest_shoe
        largest_shoe = player_details_hash[:shoe]
        number_rebounds = player_details_hash[:rebounds]
      end
    end
  end
  number_rebounds
end

#Bonus questions

def most_points_scored
  most_points = 0
  high_player = ""
  game_hash.each do | team, details_hash |
    players_array = details_hash[:players]
    players_array.each do | player_details_hash |
      if player_details_hash[:points] > most_points
        most_points = player_details_hash[:points]
        high_player = player_details_hash[:player_name]
      end
    end
  end
  high_player
end

def winning_team
  points = {}

  high_scoring_team = ""
  game_hash.keys.each do |team|

      game_hash[team][:players].each do | player, stats |
        #puts player[:points]
        if points[team]
          points[team] += player[:points]
        else
          points[team] = player[:points]
        end
      end
  end
  best_score = 0
  points.each do | team, total_points |
    if total_points > best_score
      best_score = total_points
      high_scoring_team = game_hash[team][:team_name]
    end
  end
  high_scoring_team
end

def player_with_longest_name

  longest_name_length = 0
  player = ""

  game_hash.each do | team, details_hash |
    players_array = details_hash[:players]

    players_array.each do | player_details_hash |
      if player_details_hash[:player_name].length > longest_name_length
        longest_name_length = player_details_hash[:player_name].length
        player = player_details_hash[:player_name]
      end
    end
  end
  player
end

#SUPER BONUS

# Write a method that returns true if the player with the longest name
# had the most steals.
# Call the method long_name_steals_a_ton?.


#write a method to find the player with the most steals

def player_with_most_steals
  name = ""
  most_steals = 0

  game_hash.each do | team, details_hash |
    players_array = details_hash[:players]
    players_array.each do | player_details_hash |
      if player_details_hash[:steals] > most_steals
        most_steals = player_details_hash[:steals]
        name = player_details_hash[:player_name]
      end
    end
  end
  name
end


# Write a method that returns true if the player with the longest name
# had the most steals.
# Call the method long_name_steals_a_ton?.

def long_name_steals_a_ton?
  longest_name  = player_with_longest_name()
  player_name_with_most_steals = player_with_most_steals()

  if longest_name == player_name_with_most_steals
    return true
  end
  false
end
