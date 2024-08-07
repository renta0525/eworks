class Report < ApplicationRecord
  belongs_to :user
  belongs_to :work

  with_options presence: true , format: { with: /\A[0-9]+\z/, message: "only allows numbers" } do
    validates :negotiation
    validates :negotiation_obtain
    validates :negotiation_lost
  end 
  validates :introspection, presence: true
end
