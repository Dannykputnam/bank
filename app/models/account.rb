class Account < ApplicationRecord
  belongs_to :user
  validates :name, :balance, presence: true 

  validates :balance, numericality: {
    greater_than_or_equal_to: 25.00,
    message: "Must be at least $25"
  }
end
