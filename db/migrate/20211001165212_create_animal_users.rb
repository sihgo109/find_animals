class CreateAnimalUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :animal_users do |t|
      t.references :animal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
