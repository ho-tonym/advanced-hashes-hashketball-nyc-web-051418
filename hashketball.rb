require "pry"


def game_hash
  hash = {
    home:{
      team_name:"Brooklyn Nets",
      colors:["Black","White"],
      players:{
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
        "Reggie Evans" =>{
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          },
          "Brook Lopez" =>{
              number: 11,
              shoe: 17,
              points: 17,
              rebounds: 19,
              assists: 10,
              steals: 3,
              blocks: 1,
              slam_dunks: 15
            },
          "Mason Plumlee" =>{
              number: 1,
              shoe: 19,
              points: 26,
              rebounds: 12,
              assists: 6,
              steals: 3,
              blocks: 8,
              slam_dunks: 5
            },
          "Jason Terry" =>{
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
    away:{
      team_name:"Charlotte Hornets",
      colors:["Turquoise","Purple"],
      players:{
            "Jeff Adrien" =>{
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2
              },
            "Bismak Biyombo" =>{
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 7,
                blocks: 15,
                slam_dunks: 10
              },
            "DeSagna Diop" =>{
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5
              },
            "Ben Gordon" =>{
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0
              },
            "Brendan Haywood" =>{
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 22,
                blocks: 5,
                slam_dunks: 12
              }
            }
        }
      }
end


def num_points_scored(player_name)

    game_hash.each { |team, data|
          data.each { |description, info|
              if description == :players
                info.each { |players, stats|
                    if players == player_name
                      stats.each { |shot, integer|
                        if shot == :points
                          return integer
                        end
                      }
                    end
                }
              end
          }
    }

end

def shoe_size(player_name)
  game_hash.each { |team, data|
        data.each { |description, info|
            if description == :players
              info.each { |players, stats|
                  if players == player_name
                    stats.each { |shot, integer|
                      if shot == :shoe
                        return integer
                      end
                    }
                  end
              }
            end
        }
  }
end

def team_colors(team_name)
  game_hash.each { |team, data|
        data.each { |description, info|
            if description == :team_name
              if info == team_name
                return game_hash[team][:colors]
              end
            end
        }
  }
end

def team_names
  new_array =[]
  game_hash.each { |team, data|
        data.each { |description, info|
            if description == :team_name
                new_array << info
            end
        }
  }
  new_array
end

def player_numbers(team_name)
  new_variable = game_hash.values.find do |team|
    team.fetch(:team_name) == team_name
  end

  new_variable

  new_variable[:players].map do |players, stats|
    stats[:number]
  end
end

def player_stats(player_name)

  game_hash.each do |key, value|
    value.each do |key1, value1|
      if key1 == :players
        value1.each do |key2, value2|
          if key2 == player_name
            return value2
          end
        end
      end
    end
  end
end

def big_shoe_rebounds

  biggest_shoe = 0
  num_rebounds = 0

  game_data = game_hash.values.find do |team|
    team.fetch(:players)
  end

    game_data[:players].each do |player, game_stats|
      if game_stats[:shoe] > biggest_shoe
        biggest_shoe = game_stats[:shoe]
        num_rebounds = game_stats[:rebounds]

      end
    end
    num_rebounds
 end


=begin
 def big_shoe_rebounds


   game_hash.each do |key, value|
     value.each do |key1, value1|
       if key1 == :players
         value1.each do |players, stat|
           stat.each do |k,v|
             if k == :shoe
               k.values.max
               binding.pry
             end
           end
         end
       end
     end
   end

 biggest_foot = ["Default Name", 0, 0] # player, shoe, rebounds

 game_hash.each do ||

 end



 end

 def rebounds_for_bigfoot(game)
   biggest_foot = ["Default Name", 0, 0] # [Player, Shoe, Rebounds]

   game.each_value do |team|
     team[:players].each do |name, player_hash|

       if player_hash[:shoe] > biggest_foot[1]
         biggest_foot[0] = name
         biggest_foot[1] = player_hash[:shoe]
         biggest_foot[2] = player_hash[:stats][:rebounds]
       end

     end
   end

   bigfoot_name = biggest_foot[0]
   bigfoot_shoe = biggest_foot[1]
   bigfoot_rebounds = biggest_foot[2]

   puts "#{bigfoot_name} has the biggest foot (size #{bigfoot_shoe}!) and has made #{bigfoot_rebounds} rebounds. Yowzahz! Mad rigorous."

 end
=end