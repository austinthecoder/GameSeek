class CreateGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.belongs_to :platform
      t.belongs_to :genre
      t.string :title
      t.integer :price
      t.timestamps
    end

    add_index :games, :platform_id
    add_index :games, :genre_id
    add_index :games, [:platform_id, :genre_id]
  end

  def down
    drop_table :games
  end
end
