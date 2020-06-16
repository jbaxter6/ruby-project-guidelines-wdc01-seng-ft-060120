class RemoveYearFromPlayerTeamsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :player_teams, :year
  end
end
