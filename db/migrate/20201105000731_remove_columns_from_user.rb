class RemoveColumnsFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :sex, :string
    remove_column :users, :height_inches, :integer
    remove_column :users, :birthday, :date

  end
end
