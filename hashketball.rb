def game_hash

new_arr = []
new_arr << create_players("Jeff Adrien",4,18,10,1,1,2,7,2)
new_arr << create_players("Bismack Biyombo",0,16,12,4,7,22,15,10)
new_arr << create_players("DeSagna Diop",2,14,24,12,12,4,5,5)
new_arr << create_players("Ben Gordon",8,15,33,3,2,1,1,0)
new_arr << create_players("Kemba Walker",33,15,6,12,12,7,5,12)
new_arr_home = []
new_arr_home << create_players("Alan Anderson",0,16,22,12,12,3,1,1)
new_arr_home << create_players("Reggie Evans",30,14,12,12,12,12,12,7)
new_arr_home << create_players("Brook Lopez",11,17,17,19,10,3,1,15)
new_arr_home << create_players("Mason Plumlee",1,19,26,11,6,3,8,5)
new_arr_home << create_players("Jason Terry",31,15,19,2,2,4,11,1)

my_hash ={:home => {:team_name =>  "Brooklyn Nets",:colors => ["Black", "White"], :players => new_arr_home },
          :away => {:team_name =>  "Charlotte Hornets",:colors => ["Turquoise", "Purple"], :players =>new_arr }
          }
 my_hash
end

def create_players (name,no,shoe,pts,reb,ass,st,bl,sl)

  my_hash = { :player_name => name,
            :number => no,
            :shoe => shoe,
            :points => pts,
            :rebounds => reb,
            :assists => ass,
            :steals => st,
            :blocks => bl,
            :slam_dunks => sl
          }
  my_hash
end

def num_points_scored (name)
  my_hash = game_hash
  my_hash.each do |hash,val|
    val[:players].each do |key,value|
      if key[:player_name] == name
        pts = key[:points]
        return pts
    end
  end
  end
  return nil
end

def shoe_size (name)
  my_hash = game_hash
  my_hash.each do |hash,val|
    val[:players].each do |key,value|
      if key[:player_name] == name
        pts = key[:shoe]
        return pts
    end
  end
  end
  return nil
end

def team_colors(name)
  my_hash = game_hash
  my_hash.each do |key,value|
    if value[:team_name] == name
      return value[:colors]
    end
  end
  return nil
end

def team_names ()
  my_hash = game_hash
  new_arr = []
  my_hash.each do |key,value|
    new_arr << value[:team_name]
  end
  new_arr
end

def player_numbers(name)
  my_hash = game_hash
  new_arr = []
    my_hash.each do |hash,val|
      if val[:team_name] == name
          val[:players].each do |key,value|
            new_arr << key[:number]
        end
    end
    end
    return new_arr
end

def player_stats (name)
  my_hash = game_hash
  my_hash.each do |hash,val|
    val[:players].each do |player|
      if player[:player_name] == name
        newhash = {}
        player.each do |key, value|
         unless key == :player_name
           newhash[key] = value
         end
        end
        return newhash
    end
  end
  end
  return nil
end

def big_shoe_rebounds()
  my_hash = game_hash
  new_arr = []
  arr_val = []
  my_hash.each do |hash,val|
    val[:players].each do |key,value|
      new_arr << key
      arr_val << key[:shoe]
                      end
  end
  large_size = arr_val.uniq.sort[-1]
  new_arr.each do |ele|
    if ele[:shoe] == large_size
      return ele[:rebounds]
    end
  end
end

def most_points_scored
  my_hash = game_hash
  new_arr = []
  arr_val = []
  my_hash.each do |hash,val|
    val[:players].each do |key,value|
      new_arr << key
      arr_val << key[:points]
    end
  end
  large_size = arr_val.uniq.sort[-1]
  new_arr.each do |ele|
    if ele[:points] == large_size
      return ele[:player_name]
    end
  end
end

def winning_team
  my_hash = game_hash
  new_arr = []
  arr_val = []
  my_hash.each do |hash,val|
    count = 0
    
    val[:players].each do |key,value|
      count += key[:points]
    end
    arr_val << count
    new_arr << {val[:team_name]=>count}
  end
  
  large_size = arr_val.uniq.sort[-1]
  #pp large_size
  new_arr.each do |key|
    key.each do |k,v|
      if v == large_size
        return k
      end
    end
  end
end

def player_with_longest_name

  my_hash = game_hash
  new_arr = []
  arr_val = []
  my_hash.each do |hash,val|
    val[:players].each do |key,value|
      len = key[:player_name].length
    
    arr_val << len
    new_arr << key
    end
  end
  large_size = arr_val.uniq.sort[-1]
  #pp new_arr
  new_arr.each do |key|
    if key[:player_name].length == large_size
      return key[:player_name]
      end
  end

end

def long_name_steals_a_ton?
  name = player_with_longest_name
  steal = player_steal(name)
   my_hash = game_hash
  new_arr = []
  arr_val = []
  my_hash.each do |hash,val|
    val[:players].each do |key,value|
      if key[:steals] > steal
        return false
      end
    end
  end
  return true
end

def player_steal (name)
  my_hash = game_hash
  my_hash.each do |hash,val|
    val[:players].each do |key,value|
      if key[:player_name] == name
        pts = key[:steals]
        return pts
    end
  end
  end
  return nil
end




