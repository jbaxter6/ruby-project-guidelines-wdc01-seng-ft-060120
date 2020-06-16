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

end