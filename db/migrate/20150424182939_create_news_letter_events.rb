class CreateNewsLetterEvents < ActiveRecord::Migration
  def change
    create_table :news_letter_events do |t|
      t.references :news_letter, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
