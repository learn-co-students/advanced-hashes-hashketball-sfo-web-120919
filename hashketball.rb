def game_hash
  game_hash = {
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
            rebounds: 11,
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
             }
    
         }
    
  },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {"Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
        "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
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
              "Kemba Walker" => {
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12
              } 
          }
      }
    }
end

def num_points_scored(player_name)
  game_hash.each do |team, keys|
    game_hash[team][:players].each do |name, keys|
      if player_name === name
        return keys[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, keys|
    game_hash[team][:players].each do |name, keys|
      if player_name == name
        return keys[:shoe]
      end
    end
  end
end

def team_colors(the_team)
  game_hash.each do |team, keys|
    game_hash[team].each do |name, keys|
      if the_team == keys
        return game_hash[team][:colors]
      end
    end
  end
end

def team_names
  teams = []
  game_hash.each do |team, keys|
    teams << game_hash[team][:team_name]
  end
  teams
end

def player_numbers(the_team)
  numbers = []
  game_hash.each do |team, keys|
    if the_team == game_hash[team][:team_name]
      game_hash[team][:players].each do |name, keys|
        numbers << keys[:number]
      end
    end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each do |team, keys|
    game_hash[team][:players].each do |name, keys|
      if player_name == name
        return keys
      end
    end
  end
end

def big_shoe_rebounds
  names = []
  shoes = []
  
  game_hash.each do |team, keys|
    game_hash[team][:players].each do |name, keys|
      names << name
      shoes << keys[:shoe]
    end
  end
  
  largest = -1
  shoes.each do |i|
    if i > largest
      largest = i
    end
  end
  
  player_with_largest_shoe = names[shoes.index(largest)]
  
  game_hash.each do |team, keys|
    game_hash[team][:players].each do |name, keys|
      if player_with_largest_shoe == name
        return keys[:rebounds]
      end
    end
  end
end
  
def most_points_scored
  names = []
  most_points = []
  
  game_hash.each do |team, keys|
    game_hash[team][:players].each do |name, keys|
      names << name
      most_points << keys[:points]
    end
  end
  
  most = -1
  most_points.each do |i|
    if i > most 
      most = i 
    end
  end
  
  player_with_most_points = names[most_points.index(most)]
  
  game_hash.each do |team, keys|
    game_hash[team][:players].each do |name, keys|
      if player_with_most_points == name
        return name
      end
    end
  end
end


    
    
      
      
    










