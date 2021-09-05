class Event < ApplicationRecord
  belongs_to :company
  belongs_to :user
  belongs_to :event_category
  has_many :job_categories
end
