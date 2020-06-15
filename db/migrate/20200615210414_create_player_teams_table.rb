class CreatePlayerTeamsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :player_teams do |t|
      t.integer :team_id
      t.integer :player_id
      t.integer :year
      t.boolean :is_current_team
    end
  end
end
