class JobCategory < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates :company_id, presence: true
  validates :user_id, presence: true
  validates :job_name, presence: true, length: { maximum: 250 }
  validates :salary, length: { maximum: 250 }
  validates :base_salary, length: { maximum: 250 }
  validates :allowance, length: { maximum: 1000 }
  validates :annual_holiday, length: { maximum: 250 }
  validates :bonus, length: { maximum: 250 }
  validates :salary_increase, length: { maximum: 250 }
  validates :overtime_hours, length: { maximum: 1000 }
  validates :paid_leave, length: { maximum: 1000 }
  validates :working_place, length: { maximum: 1000 }
  validates :jobcategories_memo, length: { maximum: 1000 }
end
