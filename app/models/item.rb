class Item < ApplicationRecord
  belongs_to :account
  validates :title, :amt, :deposit, presence: true
end
