class AddUserToFestival < ActiveRecord::Migration[5.2]
  def change
    add_reference :festivals, :user, foreign_key: true
  end
end
