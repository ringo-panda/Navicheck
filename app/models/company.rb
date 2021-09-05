class Company < ApplicationRecord
  belongs_to :industry
  belongs_to :user
  belongs_to :selection_status
  belongs_to :wish_degree
  has_many :events, dependent: :destroy
  has_many :job_categories, dependent: :destroy

  validates :user_id, presence: true
  validates :industry_id, presence: true
  validates :wish_degree_id, presence: true
  validates :selection_status_id, presence: true
  validates :company_name, presence: true
end
