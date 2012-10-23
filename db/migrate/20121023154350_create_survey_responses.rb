class CreateSurveyResponses < ActiveRecord::Migration
  def up
    create_table :survey_responses do |t|
      t.belongs_to :platform
      t.belongs_to :genre
      t.string :person_name
      t.integer :min_price
      t.integer :max_price
      t.timestamps
    end

    add_index :survey_responses, :platform_id
    add_index :survey_responses, :genre_id
  end

  def down
    drop_table :survey_responses
  end
end
