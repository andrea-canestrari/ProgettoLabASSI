class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.string :team1
      t.string :team2
      t.integer :score1
      t.integer :score2
      t.string :marker1
      t.string :marker2
      t.string :details
      t.string :caution1
      t.string :caution2

      t.timestamps
    end
  end
end
