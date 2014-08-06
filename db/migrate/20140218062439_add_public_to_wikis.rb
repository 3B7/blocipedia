class AddPublicToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :public
  end
end
