class Work < ApplicationRecord
  belongs_to :user
  belongs_to :report 
  validates :place, presence: true
end

