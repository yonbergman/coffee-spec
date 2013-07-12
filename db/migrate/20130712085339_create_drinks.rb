class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.integer :page_id
      t.string :name
      t.string :kind
      t.hstore :drink_attributes

      t.timestamps
    end
  end
end
