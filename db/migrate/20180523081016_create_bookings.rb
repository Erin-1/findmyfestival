class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :festival, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status
      t.integer :total_price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
