class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable

  
  has_many :categories
  has_many :payments, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
end
