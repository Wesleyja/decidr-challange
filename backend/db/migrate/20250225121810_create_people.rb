class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :species
      t.integer :gender
      t.string :weapon
      t.string :vehicle
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
