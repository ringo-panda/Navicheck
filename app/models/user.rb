class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :events, dependent: :destroy
  has_many :industries, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_many :job_categories, dependent: :destroy
  has_many :event_categories, dependent: :destroy
  has_many :wish_degrees, dependent: :destroy
  has_many :selection_statuses, dependent: :destroy

    validates :name, presence: true, length: { in: 1..50 }
end
