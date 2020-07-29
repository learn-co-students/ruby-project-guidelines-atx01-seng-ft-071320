class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :abstract
      t.string :category
      t.string :author
      t.string :url
    end
  end
end
