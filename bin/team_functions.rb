def get_all_teams
    puts "-Team Name------City-"
    Team.all.each do |team|
        puts "#{team.name} -- #{team.city}"
    end
end

def search_team_by_name
    puts "Please enter the team name you want to find: "
    # get user input and return the team we find
    input = gets.chomp()
    team = Team.find_by_name(input)

    # printing team obj to the terminal
    puts "-Team Name------City-"
    puts "#{team.name} -- #{team.city}"
end

def search_team_by_city
    puts "Please enter the city the team you want plays at"
    #get input
    input = gets.chomp()
    team = Team.find_by_city(input)

    puts "-Team Name------City-"
    puts "#{team.name} -- #{team.city}"
end

def add_team
    puts "Please enter your new teams name."
    name_input = gets.chomp()

    puts "Please enter your new teams city."
    city_input = gets.chomp()

    team = Team.find_by(name: name_input, city: city_input)
    if !team.nil?
        puts "This team already exists"
    else 
        Team.create(name: name_input, city: city_input)
        puts "New team created"
    end
end

def delete_team
    puts "Please enter the name of the team you want to delete."
    name_input = gets.chomp()
    puts "Please enter the city of the team you want to delete."
    city_input = gets.chomp()

    team = Team.find_by(name: name_input, city: city_input)
    if !team.nil?
        Team.destroy(team.id)
        puts "Team deleted"
    else 
        puts "This team does not exist!"
    end
end

def get_players_on_team
    puts "Please enter the name of the team you want to see the list of players."
    name_input = gets.chomp()
    puts "Please enter the city of the team you want to see if the list of players."
    city_input = gets.chomp()

    team = Team.find_by(name: name_input, city: city_input)

    if !team.nil?
        team.players.each do |player|
            puts "#{player.name} -- #{player.position}"
        end
    else
        puts "This team does not exist!"
    end
end
