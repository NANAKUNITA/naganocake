class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :admin, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
