class ChangeColumnCodeToStringFromPhones < ActiveRecord::Migration[5.2]
  def change
    change_column :phones, :code, :string
  end
end
