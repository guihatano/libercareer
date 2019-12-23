class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :number
      t.integer :code
      t.string :type
      t.boolean :preferential

      t.timestamps
    end
  end
end
