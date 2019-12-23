class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.string :document
      t.string :email
      t.date :birthdate

      t.timestamps
    end
  end
end
