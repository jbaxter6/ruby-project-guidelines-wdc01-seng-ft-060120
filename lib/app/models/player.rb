class Player < ActiveRecord::Base
    has_many :player_teams
    has_many :teams, through: :player_teams

    def self.positions
        return Player.all.map {|player| player.position}.uniq
    end

    def self.prompt
        return TTY::Prompt.new
    end

    def self.get_by_position(position)
        Player.where(position: position)
    end

    def self.get_all_players
        rows = Player.all.map do |player|
            [player.name, player.position]
        end
        table = Terminal::Table.new :headings => ['Player Name', 'Position'], :rows => rows
        puts table
    end

    def self.get_players_by_position
        position = self.prompt.select("Select from the following positions?", self.positions)
        players = self.get_by_position(position)
    
        rows = players.map {|player| [player.name, player.position]}
        table = Terminal::Table.new :headings => ['Player Name', 'Position'], :rows => rows
        puts table
    end

    def self.get_all_positions
        self.positions.each {|position| puts position}
    end

    def self.add_new_player
        player_name = prompt.ask("What is the players name?")
        position = prompt.ask("What is the players position?")

        team_id = self.prompt.select("Select from the following?", Team.all.map {|team| [team.name, team.id]}.to_h)
        team = Team.find(team_id)

        new_player = Player.create(name: player_name, position: position)
        PlayerTeam.create(team: team, player: new_player, is_current_team: true)

        puts "New player created!"
    end

    def self.delete_player
        player_id = self.prompt.select("Select which player you want to delete?", self.all.map {|player| [player.name, player.id]}.to_h)
        Player.destroy(player_id)
        
        player_teams = PlayerTeam.where(player_id: player_id).map {|pt| pt.id}
        PlayerTeam.destroy(player_teams)

        puts "Player deleted!"
    end

    def self.change_players_current_team
        player_id = self.prompt.select("Select which player you want to change teams?", self.all.map {|player| [player.name, player.id]}.to_h)
        team_id = self.prompt.select("Select the new team?", Team.all.map {|team| [team.name, team.id]}.to_h)

        old_team = PlayerTeam.find_by({player_id: player_id, is_current_team: true})
        old_team.is_current_team = false
        old_team.save

        PlayerTeam.create({player_id: player_id, team_id: team_id, is_current_team: true})

        puts "Player's team changed!"
    end

end