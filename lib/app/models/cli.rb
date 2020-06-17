class CLI

    @@main_menu = ["Team functions", "Player functions", "Exit the program"]
    @@team_menu = ["Get all teams", "Search team by name", "Search team by city", "Add team", 
        "Delete team", "Get players on team", "Main menu"]
    @@player_menu = ["Get all players", "Get players by position", "Get all positions",
        "Add new player", "Delete player", "Change players current team", "Main menu"]
    # @@game_menu = ["Get all games"]

    def self.run
        prompt = TTY::Prompt.new

        self.welcome

        input = prompt.select("Select from the following?", @@main_menu)
        
        case input
        when "Team functions"
            message = Artii::Base.new :font => 'slant'
            puts message.asciify('Team Functions')
            input = prompt.select("Select from the following?", @@team_menu)
        
            case input
            when "Get all teams"
                Team.get_all_teams
                self.run
            when "Search team by name"
                Team.search_team_by_name
                self.run
            when "Search team by city"
                Team.search_team_by_city
                self.run
            when "Add team"
                Team.add_team
                self.run
            when "Delete team"
                Team.delete_team
                self.run
            when "Get players on team"
                Team.get_players_on_team
                self.run
            when "Main menu"
                self.run
            end
        
        when "Player functions"
            message = Artii::Base.new :font => 'slant'
            puts message.asciify('Player Functions')
            input = prompt.select("Select from the following?", @@player_menu)
        
            case input
            when "Get all players"
                Player.get_all_players
                self.run
            when "Get players by position"
                Player.get_players_by_position
                self.run
            when "Get all positions"
                Player.get_all_positions
                self.run
            when "Add new player"
                Player.add_new_player
                self.run
            when "Delete player"
                Player.delete_player
                self.run
            when "Change players current team"
                Player.change_players_current_team
                self.run
            when "Main menu"
                self.run
            end
        
        when "Exit the program"
            exit_program
        end
    end

    def self.welcome
        message = Artii::Base.new :font => 'slant'
        puts message.asciify('Main Menu')
    end

    def self.exit_program
        message = Artii::Base.new :font => 'slant'
        puts message.asciify('Goodbye!')
    end

end