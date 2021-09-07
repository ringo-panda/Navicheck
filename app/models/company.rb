class Company < ApplicationRecord
  belongs_to :industry
  belongs_to :user
  belongs_to :selection_status
  belongs_to :wish_degree
  has_many :events, dependent: :destroy
  has_many :job_categories, dependent: :destroy

  validates :industry_id, presence: true
  validates :user_id, presence: true
  validates :company_name, presence: true, length: { maximum: 250 }
  validates :company_memo, length: { maximum: 1000 }
  validates :company_cite_url, length: { maximum: 3000 }
  validates :recruit_cite_url, length: { maximum: 3000 }
  validates :recruit_cite_username, length: { maximum: 250 }
  validates :recruit_cite_password, length: { maximum: 250 }
  validates :selection_status_id, presence: true
  validates :wish_degree_id, presence: true
  validates :location, length: { maximum: 250 }
end
