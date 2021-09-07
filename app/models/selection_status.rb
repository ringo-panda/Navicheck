class SelectionStatus < ApplicationRecord
  belongs_to :user
  has_many :companies

  validates :status_name, presence: true, length: { in: 1..50 }
  validates :user_id, presence: true
  validates :edit_permission, inclusion: { in: [true, false] }
end
