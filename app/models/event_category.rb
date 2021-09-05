class EventCategory < ApplicationRecord
  belongs_to :user
  has_many :event

  validates :event_category_name, presence: true
  validates :event_category_name, length: { in: 1..50 }
  validates :user_id, presence: true
  validates :edit_permission, inclusion: { in: [true, false] }
end
