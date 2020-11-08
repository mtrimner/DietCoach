class RemoveEndDateColumnFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :end_date, :date
  end
end
