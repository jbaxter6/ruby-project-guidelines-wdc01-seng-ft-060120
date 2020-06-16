class Team < ActiveRecord::Base
    has_many :player_teams
    has_many :players, through: :player_teams

    def self.prompt
        return TTY::Prompt.new
    end

    def self.find_by_city(city)
        Team.find_by(city: city)
    end

    def self.find_by_name(name)
        Team.find_by(name: name)
    end

    def self.get_all_teams
        rows = []
        Team.all.each do |team|
            rows << [team.name, team.city]
        end
        table = Terminal::Table.new :headings => ['Team Name', 'City'], :rows => rows
        puts table
    end

    def self.search_team_by_name
        puts "Please enter the team name you want to find: "
        # get user input and return the team we find
        input = gets.chomp()
        team = Team.find_by_name(input)
    
        # printing team obj to the terminal
        puts "-Team Name------City-"
        puts "#{team.name} -- #{team.city}"
    end

    def self.search_team_by_city
        puts "Please enter the city the team you want plays at"
        #get input
        input = gets.chomp()
        team = Team.find_by_city(input)
    
        puts "-Team Name------City-"
        puts "#{team.name} -- #{team.city}"
    end

    def self.add_team
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

    def self.delete_team
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

    def self.get_players_on_team
        team_id = self.prompt.select("Select from the following?", Team.all.map {|team| [team.name, team.id]}.to_h)
        team = Team.find(team_id)
        
        rows = []
        team.players.each do |player|
            rows << [player.name, player.position]
        end
        table = Terminal::Table.new :headings => ['Player Name', 'Position'], :rows => rows
        puts table
    end

end