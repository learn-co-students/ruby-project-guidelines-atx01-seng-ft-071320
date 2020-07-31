class ChangeUserNameColumnToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :user_name, :name
  end
end
