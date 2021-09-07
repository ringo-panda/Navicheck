class WishDegree < ApplicationRecord
  belongs_to :user
  has_many :companies

  validates :wish_degree_name, presence: true, length: { in: 1..50 }
  validates :user_id, presence: true
  validates :edit_permission, inclusion: { in: [true, false] }
end
