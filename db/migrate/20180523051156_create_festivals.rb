class CreateFestivals < ActiveRecord::Migration[5.2]
  def change
    create_table :festivals do |t|
      t.string :title
      t.integer :rating
      t.string :description
      t.string :cost
      t.string :location
      t.string :coordinates

      t.timestamps
    end
  end
end
