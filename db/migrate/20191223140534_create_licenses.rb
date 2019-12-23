class CreateLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :licenses do |t|
      t.references :person, foreign_key: true
      t.string :number
      t.string :modalities
      t.date :expiration_date

      t.timestamps
    end
  end
end
