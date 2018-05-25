class AddCoordinatesToFestivals < ActiveRecord::Migration[5.2]
  def change
    add_column :festivals, :latitude, :float
    add_column :festivals, :longitude, :float
  end
end
