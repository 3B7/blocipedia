class RemoveBodyFromWikis < ActiveRecord::Migration
  def up
    remove_column :wikis, :body
  end

  def down
    add_column :wikis, :body, :text
  end
end
