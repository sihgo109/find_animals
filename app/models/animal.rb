class Animal < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :rooms

  validates :name, presence: true
  validates :image, presence: true
  validates :genre, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
  validates :age, presence: true
  validates :prefecture, presence: true
  validates :charm_point, presence: true

  def self.search(search)
    if search != ""
      Animal.where('name LIKE(?)', "%#{search}%")
        .or(Animal.where('genre LIKE(?)', "%#{search}%"))
        .or(Animal.where('gender LIKE(?)', "%#{search}%"))
        .or(Animal.where('birthday LIKE(?)', "%#{search}%"))
        .or(Animal.where('age LIKE(?)', "%#{search}%"))
        .or(Animal.where('prefecture LIKE(?)', "%#{search}%"))
        .or(Animal.where('charm_point LIKE(?)', "%#{search}%"))  
        .or(Animal.where('user_id LIKE(?)', "%#{search}%"))  
    else
      Animal.all
    end
  end

end

