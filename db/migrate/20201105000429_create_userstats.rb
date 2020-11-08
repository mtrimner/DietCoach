class CreateUserstats < ActiveRecord::Migration[6.0]
  def change
    create_table :user_stats do |t|
      t.string :sex
      t.integer :height_inches
      t.date :birthday
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
