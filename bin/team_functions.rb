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
    new_team = Team.find_or_create_by(name: name_input)

    puts "Please enter your new teams city."
    city_input = gets.chomp()
    
    new_team = Team.find_or_create_by(name: name_input, city: city_input) do |team| 
        return "New team created!"
    end

    return "This team already exists."

end