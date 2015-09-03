class AddNotNullConstraintToDraftersOnLeagueId < ActiveRecord::Migration
  def up
    Drafter.where(league_id: nil).find_each do |drafter|
      Drafter.transaction do
        league = League.create!(name: "#{drafter.user.first_name}'s default league")
        drafter.update!(league_id: league.id)
      end
    end
    change_column :drafters, :league_id, :integer, null: false
  end

  def down
    change_column :drafters, :league_id, :integer, null: true
  end
end
