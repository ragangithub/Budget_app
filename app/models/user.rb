class User < ApplicationRecord
  
  has_many :categories
  has_many :payments, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
end
