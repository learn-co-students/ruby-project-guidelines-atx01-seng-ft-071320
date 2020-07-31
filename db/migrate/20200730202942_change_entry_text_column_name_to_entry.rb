class ChangeEntryTextColumnNameToEntry < ActiveRecord::Migration[6.0]
  def change
    rename_column :entries, :entry_text, :entry
  end
end
