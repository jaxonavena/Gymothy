class Membership < ApplicationRecord
  belongs_to :member
  belongs_to :business

  enum :status,
  {
    active: 0,
    deactivated: 1,
    frzn: 3
  }

  enum :subscription,
  {
    trial: 0,
    basic: 1,
    premium: 2
  }
end