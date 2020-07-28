class Entries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :journal_id
      t.integer :user_id
      t.string :entry_text
  end
end
