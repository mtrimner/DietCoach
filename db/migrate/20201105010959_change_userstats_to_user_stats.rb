class ChangeUserstatsToUserStats < ActiveRecord::Migration[6.0]
  def change
    rename_table :userstats, :user_stats
  end
end
