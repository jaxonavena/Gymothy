class Membership < ApplicationRecord
  belongs_to :member
  belongs_to :Business

  # validates :member_id, presence: true
  # validates :business_id, presence: true
end