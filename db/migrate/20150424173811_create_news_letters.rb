class CreateNewsLetters < ActiveRecord::Migration
  def change
    create_table :news_letters do |t|

      t.timestamps null: false
    end
  end
end
