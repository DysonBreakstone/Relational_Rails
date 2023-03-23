class CreatePacks < ActiveRecord::Migration[5.2]
  def change
    create_table :packs do |t|
      t.string :name
      t.integer :liters
      t.boolean :waterproof
      t.references :brand, foreign_key: true
      t.timestamps
    end
  end
end
