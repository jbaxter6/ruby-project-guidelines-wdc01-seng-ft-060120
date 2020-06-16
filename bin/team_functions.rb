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