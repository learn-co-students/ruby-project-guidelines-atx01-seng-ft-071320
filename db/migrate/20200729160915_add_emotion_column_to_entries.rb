class AddEmotionColumnToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :emotion, :string
  end
end
