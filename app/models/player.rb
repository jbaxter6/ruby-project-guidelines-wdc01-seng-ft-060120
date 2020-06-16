class Player < ActiveRecord::Base
    has_many :player_teams
    has_many :teams, through: :player_teams

    def self.get_by_position(position)
        Player.where(position: position)
    end

    def self.get_all_positions
        Player.all.map{|position| player.position}.uniq
    end

end