require_relative 'spec_helper'

describe Player do

    describe ".add_player" do
        it "make sure player name is all strings" do
        expect(Player.add_new_player).to eq(String)
        end
    end

end