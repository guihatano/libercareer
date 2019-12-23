class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :model
      t.string :color
      t.string :year
      t.string :license_plate
      t.string :type
      t.decimal :daily_rate, precision: 8, scale: 2

      t.timestamps
    end
  end
end
