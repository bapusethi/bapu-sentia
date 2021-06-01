class CreateUserAffiliations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_affiliations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :affiliation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
