class AddPhotoToFestivals < ActiveRecord::Migration[5.2]
  def change
    add_column :festivals, :photo, :string
  end
end
