class Event < ApplicationRecord
  belongs_to :company
  belongs_to :user
  belongs_to :event_category

  validates :company_id, presence: true
  validates :user_id, presence: true
  validates :event_category_id, presence: true
  validates :event_name, presence: true, length: { maximum: 250 }
  validates :location, length: { maximum: 1000 }
  validates :meeting_url, length: { maximum: 3000 }
  validates :meeting_id, length: { maximum: 250 }
  validates :meeting_password, length: { maximum: 250 }
  validates :belongings, length: { maximum: 250 }
  validates :clothes, length: { maximum: 250 }
  validates :event_memo, length: { maximum: 1000 }
end
