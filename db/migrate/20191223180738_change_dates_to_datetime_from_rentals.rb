class ChangeDatesToDatetimeFromRentals < ActiveRecord::Migration[5.2]
  def change
    change_column :rentals, :start_date, :datetime
    change_column :rentals, :end_date, :datetime
    change_column :rentals, :withdrawal_date, :datetime
    change_column :rentals, :return_date, :datetime
  end
end
