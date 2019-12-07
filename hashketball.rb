def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals =>3,
        :blocks => 1,
        :slam_dunks => 15
      },
      {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
      ]
    },
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
      ]
    }
  }
end

def num_points_scored(player)
  game_hash.each do |status, team_info|
    team_info.each do |attribute, stats|
      if attribute == :players
        stats.each do |player_info| 
          if player_info[:player_name] == player
            return player_info[:points]
          end
        end 
      end 
    end
  end
end

def shoe_size(player)
  game_hash.each do |status, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |player_info| 
          if player_info[:player_name] == player
            return player_info[:shoe]
          end
        end 
      end 
    end
  end
end

def team_colors(the_team)
  game_hash.each do |status, team|
    if team[:team_name] == the_team
        return team[:colors]
    end 
  end 
end

def team_names
  game_hash.map do |status, team|
    team[:team_name]
  end 
end

def player_numbers(the_team)
  numbers = []
  game_hash.each do |status, team|
    if team[:team_name] == the_team
      team.each do |attribute, stats|
        if attribute == :players
          stats.each do |player_info|
             numbers << player_info[:number]
          end
          return numbers
        end 
      end
    end
  end 
end 

def player_stats(player)
  player_stats = {}
  game_hash.each do |status, team|
   team.each do |attribute, stats|
     if attribute == :players 
       stats.each do |player_info|
         if player_info[:player_name] == player
           player_stats = player_info.reject! { |key| key == :player_name}
         end
       end
      end
   end 
 end
 return player_stats
end 

def big_shoe_rebounds
  biggest_shoe = 0
  player_with_biggest_shoe = ""
  game_hash.each do |status, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |player_info|
          if player_info[:shoe] > biggest_shoe
            biggest_shoe = player_info[:shoe]
            player_with_biggest_shoe = player_info[:player_name]
          end 
        end 
      end 
    end 
  end 
  player_with_biggest_shoe 
  
  game_hash.each do |status, team|
    team.each do |attribute, stats| 
      if attribute == :players 
        stats.each do |player_info|
          if player_info[:player_name] == player_with_biggest_shoe
            return player_info[:rebounds]
          end
        end
      end
    end 
  end 
end 

def most_points_scored
  highest_points = 0
  scored_most = ""
  game_hash.each do |status, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |player_info|
          if player_info[:points] > highest_points
            highest_points = player_info[:points]
            scored_most = player_info[:player_name]
          end 
        end 
      end 
    end 
  end
  scored_most
end

def winning_team
  total_home_points = 0 
  total_away_points = 0

  game_hash.each do |status, team|
    if status == :home
      team.each do |attribute, stats|
        if attribute == :players
          stats.each do |player_info|
            total_home_points += player_info[:points]
          end
        end
      end
    end 
  total_home_points

    if status == :away
      team.each do |attribute, stats|
        if attribute == :players
          stats.each do |player_info|
            total_away_points += player_info[:points]
          end 
        end 
      end 
    end 
  total_away_points

    if total_home_points > total_away_points
      return game_hash[:home][:team_name]
    else
      return game_hash[:away][:team_name]
    end
  end 
end

def player_with_longest_name
  longest_name_count = 0
  longest_name = ""
  
  game_hash.each do |status, team|
    team.each do |attribute, stats| 
      if attribute == :players 
        stats.each do |player_info|
          if player_info[:player_name].length > longest_name_count
            longest_name_count = player_info[:player_name].length
            longest_name = player_info[:player_name]
          end
        end 
      end 
    end 
  end
  longest_name
end 

def long_name_steals_a_ton?
  highest_steals = 0
  player_with_most_steals = ""
  game_hash.each do |status, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |player_info|
          if player_info[:steals] > highest_steals
            highest_steals = player_info[:steals]
            player_with_most_steals = player_info[:player_name]
          end 
        end 
      end 
    end 
  end
  player_with_most_steals

  (player_with_most_steals == player_with_longest_name) ? true : false 
end 