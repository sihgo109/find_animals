class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.string :genre, null: false
      t.string :gender, null: false
      t.datetime :birthday, null: false
      t.integer :age, null: false
      t.string :prefecture, null: false
      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end

