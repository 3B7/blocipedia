class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.string :name
      t.references :wiki
      t.string :index

      t.timestamps
    end
    add_index :collaborators, :wiki_id
  end
end
