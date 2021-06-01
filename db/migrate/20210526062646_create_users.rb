class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :vehicle
      t.string :gender
      t.string :species
      t.string :weapon
      t.string :search_text

      t.timestamps
    end
  end
end
