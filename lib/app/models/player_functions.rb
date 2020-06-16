def get_all_players
    puts "-Player Name-------Position-"
    Player.all.each do |player|
        puts "#{player.name} -- #{player.position}"
    end
end

def get_players_by_position
    puts "Please enter the position: "
    input = gets.chomp()

    players = Player.get_by_position(input)

    if !players.empty?
        puts "-Player Name-------Position-"
        players.each do |player|
            puts "#{player.name} -- #{player.position}"
        end
    else 
        puts "There are no players at this position!"
    end
end

def get_all_positions
    puts "-Position-"
    Player.get_all_positions.each do |position|
        puts "#{position}"
    end
end