class ChangeColumnsTypeFromPhonesAndVehicles < ActiveRecord::Migration[5.2]
  def change
    rename_column :phones, :type, :phone_type
    rename_column :vehicles, :type, :vehicle_type
  end
end
