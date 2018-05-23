class CreateFestivals < ActiveRecord::Migration[5.2]
  def change
    create_table :festivals do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
