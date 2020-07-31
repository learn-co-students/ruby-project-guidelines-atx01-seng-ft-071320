class AddJournalNameColumnToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :journal_name, :string
  end
end
