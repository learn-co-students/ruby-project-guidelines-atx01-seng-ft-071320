class AddCreatedOnColumnToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :created_on, :datetime
  end
end
