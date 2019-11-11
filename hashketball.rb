require 'pp'

def create_player_hash(player_name, number, shoe, points, rebounds, assists, steals, blocks, slam_dunks)
  
  player = {
        
          player_name: player_name,
          number: number,
          shoe: shoe,
          points: points,
          rebounds: rebounds,
          assists: assists,
          steals: steals,
          blocks: blocks,
          slam_dunks: slam_dunks
        
      }
     
  return player 
  
end 

def game_hash
  
  hash = {
    
    home: {
      
      team_name: 'Brooklyn Nets',
      
      colors: ['Black', 'White'],
      
      players: []
      
      
    },

    away: {
      
      team_name: 'Charlotte Hornets',
      
      colors: ['Purple', 'Turquoise'],
      
      players: []
    }
  }
  # add home players players  create_player_hash(player_name, number, show, points, rebounds, assists, steals, blocks, slam_dunks)
  hash[:home][:players] << create_player_hash("Alan Anderson", 0, 16, 22, 12, 12, 3, 1, 1)
  hash[:home][:players] << create_player_hash("Reggie Evans", 30, 14, 12, 12, 12, 12, 12, 7)
  hash[:home][:players] << create_player_hash("Brook Lopez", 11, 17, 17, 19, 10, 3, 1, 15)
  hash[:home][:players] << create_player_hash("Mason Plumlee", 1, 19, 26, 11, 6, 3, 8, 5)
  hash[:home][:players] << create_player_hash("Jason Terry", 31, 15, 19, 2, 2, 4, 11, 1)
  
  #add away players 
  hash[:away][:players] << create_player_hash("Jeff Adrien", 4, 18, 10, 1, 1, 2, 7, 2)
  hash[:away][:players] << create_player_hash("Bismack Biyombo", 0, 16, 12, 4, 7, 22, 15, 10)
  hash[:away][:players] << create_player_hash("DeSagna Diop", 2, 14, 24, 12, 12, 4, 5, 5)
  hash[:away][:players] << create_player_hash("Ben Gordon", 8, 15, 33, 3, 2, 1, 1, 0)
  hash[:away][:players] << create_player_hash("Kemba Walker", 33, 15, 6, 12, 12, 7, 5, 12)
  
  return hash
  
end

def num_points_scored(player_name)

    game = game_hash
      
    
    
    player = game[:home][:players].find {|p| p[:player_name] == player_name} || game[:away][:players].find {|p| p[:player_name] == player_name }
    
   
    
    if player 
      return player[:points]
    else
      return nil 
    end 


end

def shoe_size(player_name)

    game = game_hash
  
    
    
    player = game[:home][:players].find {|p| p[:player_name] == player_name} || game[:away][:players].find {|p| p[:player_name] == player_name }
    
   
    
    if player 
      return player[:shoe]
    else
      return nil 
    end 


end 

def team_colors(team_name)

    game = game_hash
    
    if game[:home][:team_name] == team_name
      return game[:home][:colors]
    elsif game[:away][:team_name] == team_name 
      return game[:away][:colors]
    else 
      return nil
    end 
end 

def team_names
  
  game = game_hash 
  return [game[:home][:team_name], game[:away][:team_name]] 
  
end

def player_numbers(team_name)
  
    game = game_hash
    
    team = game[:home][:team_name] == team_name ? game[:home] :  (game[:away][:team_name] ? game[:away] : nil)
    
    if team
      return team[:players].collect { |p| p[:number] }
    else 
      return nil 
    end 
end 

def player_stats(player_name)

  game = game_hash

   player = game[:home][:players].find {|p| p[:player_name] == player_name} || game[:away][:players].find {|p| p[:player_name] == player_name }
    
    if player 
      player_clone = player.clone # avoid mutating original data
      player_clone.delete(:player_name)
      return player_clone
      
    else
      return nil 
    end
end

def top_player_stat_prop(stat, prop)
  
    game = game_hash
    
    max_player_home = game[:home][:players].max {|p1, p2| p1[stat].send(prop) <=> p2[stat].send(prop)}
    max_player_away = game[:away][:players].max {|p1, p2| p1[stat].send(prop) <=> p2[stat].send(prop)}
    #pp max_player_home
    return max_player_home[stat].send(prop) > max_player_away[stat].send(prop) ? max_player_home : max_player_away  
    
end 

def top_player(stat)
  
    game = game_hash
    
    max_player_home = game[:home][:players].max {|p1, p2| p1[stat] <=> p2[stat]}
    max_player_away = game[:away][:players].max {|p1, p2| p1[stat] <=> p2[stat]}
    #pp max_player_home
    return max_player_home[stat] > max_player_away[stat] ? max_player_home : max_player_away  
    
end 

def big_shoe_rebounds
  
 max_player = top_player(:shoe)

   
 return max_player[:rebounds]   
  
end

def most_points_scored
  
  max_player = top_player(:points)
  
  return max_player[:player_name] 
  
end 

def get_total_points(team)
  
   game = game_hash
  
   team_total = game[team][:players].reduce(0) do |total, player|
    
      total += player[:points]
      total 
   end
  
  return team_total 
  
end 

def winning_team
  
  game = game_hash
  
  home_total = get_total_points(:home)
  away_total = get_total_points(:away)
  return (home_total > away_total) ?  game[:home][:team_name] : game[:home][:team_name]
  
 
  
  
end 

def player_with_longest_name
  
  return top_player_stat_prop(:player_name, 'length')[:player_name]
  
end

def find_player_by_name(player_name)
  game = game_hash
  player = game[:away][:players].find {|p| p[:player_name] == player_name}
  if player 
    return player
  else
    player = game[:home][:players].find {|p| p[:player_name] == player_name} 
    return player   
  end 
end 

def long_name_steals_a_ton?
  
   
    steal_threshold = 3 # not sure what a ton of steals amounts to
    player = find_player_by_name(player_with_longest_name)
    return player[:steals] > steal_threshold 
  
  
  
end 







