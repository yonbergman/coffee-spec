class RenamePageToPoster < ActiveRecord::Migration
  def change
    rename_table :pages, :posters
    rename_column :drinks, :page_id, :poster_id
  end
end
