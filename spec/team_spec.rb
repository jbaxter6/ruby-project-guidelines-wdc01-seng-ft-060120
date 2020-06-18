require_relative 'spec_helper'

describe Team do

    describe ".add_team" do
        it "make sure team name is all strings" do
        expect(Team.add_team).to eq(String)
        end
    end

end