class Industry < ApplicationRecord
  belongs_to :user
  has_many :companies

  validates :industry_name, presence: true,length: { in: 1..50 }
  validates :user_id, presence: true
end
