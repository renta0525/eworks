class Work < ApplicationRecord
  belongs_to :user
  belongs_to :report, optional: true
  validates :place, presence: true
end

