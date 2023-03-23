class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :founded
      t.boolean :backpacks_only
      t.timestamps
    end
  end
end
