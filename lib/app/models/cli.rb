class CLI

    @@main_menu = ["Team functions", "Player functions", "Game functions", "Exit the program"]
    @@team_menu = ["Get all teams", "Search team by name", "Search team by city", "Add team", "Delete team", "Get players on team"]
    @@player_menu = ["Get all players", "Get players by position", "Get all positions"]
    @@game_menu = ["Get all games"]

    def self.run
        prompt = TTY::Prompt.new

        self.welcome

        input = prompt.select("Select from the following?", @@main_menu)
        
        case input
        when "Team functions"
            input = prompt.select("Select from the following?", @@team_menu)
        
            case input
            when "Get all teams"
                get_all_teams
            when "Search team by name"
                search_team_by_name
            when "Search team by city"
                search_team_by_city
            when "Add team"
                add_team
            when "Delete team"
                delete_team
            when "Get players on team"
                get_players_on_team
            end
        
        when "Player functions"
            input = prompt.select("Select from the following?", @@player_menu)
        
            case input
            when "Get all players"
                get_all_players
            when "Get players by position"
                get_players_by_position
            when "Get all positions"
                get_all_positions
            end
        
        when "Game functions"
            input = prompt.select("Select from the following?", @@game_menu)
        
        when "Exit the program"
            exit_program
        end
    end

    def self.welcome
        puts "Welcome to the application!"
    end

    def self.exit_program
        puts "Thank you for using this application!"
    end

end