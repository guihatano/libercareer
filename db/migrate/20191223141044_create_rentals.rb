class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :person, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.string :value
      t.date :start_date
      t.date :end_date
      t.date :withdrawal_date
      t.date :return_date

      t.timestamps
    end
  end
end
