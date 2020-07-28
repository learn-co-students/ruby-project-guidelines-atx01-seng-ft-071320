class ChangeDatatypeInEntryTextColmn < ActiveRecord::Migration[6.0]
  def change
    change_column :entries, :entry_text, :text
  end
end
