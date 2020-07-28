class Journals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.string :journal_name
    end
  end
end
