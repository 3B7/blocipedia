class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :body
      t.references :wiki

      t.timestamps
    end
    add_index :articles, :wiki_id
  end
end
