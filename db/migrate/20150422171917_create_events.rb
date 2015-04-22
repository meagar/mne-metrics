class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamp :starts_at
      t.integer :team
      t.string :description
      t.string :description_link
      t.string :metrics_impact
      t.string :results

      t.timestamps null: false
    end
  end
end
