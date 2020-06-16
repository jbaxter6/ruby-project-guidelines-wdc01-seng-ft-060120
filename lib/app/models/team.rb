class Team < ActiveRecord::Base
    has_many :player_teams
    has_many :players, through: :player_teams

    def self.find_by_city(city)
        Team.find_by(city: city)
    end

    def self.find_by_name(name)
        Team.find_by(name: name)
    end

end