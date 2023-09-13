class CategoryPayment < ApplicationRecord
  belongs_to :payment
  belongs_to :category

  validates :category, presence: true
  validates :payment, presence: true
end
