class AddWikiToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :wiki_identification, :integer
  end
end
