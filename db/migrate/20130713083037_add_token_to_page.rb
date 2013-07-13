class AddTokenToPage < ActiveRecord::Migration
  def change
    add_column :pages, :token, :string

    add_index :pages, :token, :unique => true
  end
end
