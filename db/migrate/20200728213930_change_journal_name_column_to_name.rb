class ChangeJournalNameColumnToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :journals, :journal_name, :name
  end
end
