class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :phone_number, presence: true
         validates :nickname, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :age, presence: true
         validates :job, presence: true
         validates :profile, presence: true
         validates :prefecture, presence: true


    has_many :animals
    has_many :comments
         
end


      # t.string :email,              null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""
      # t.string :phone_number,      null: false
      # t.string :nickname,           null: false
      # t.string :last_name,          null: false
      # t.string :first_name,         null: false
      # t.integer :age,                null: false
      # t.string :job,                null: false
      # t.text :profile,              null: false
      # t.string :prefecture,         null:false   