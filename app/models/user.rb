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
    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy

    
    def self.search(search)
      if search != ""
        User.where('nickname LIKE(?)', "%#{search}%")
      else
        Animal.all
      end
    end
         
end


     