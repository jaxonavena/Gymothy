class Membership < ApplicationRecord
  belongs_to :member
  belongs_to :business

  enum :status, { active: 0, deactivated: 1, frzn: 3 }
end