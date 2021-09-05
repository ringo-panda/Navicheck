class JobCategory < ApplicationRecord
  belongs_to :company
  belongs_to :event
  belongs_to :user
end
