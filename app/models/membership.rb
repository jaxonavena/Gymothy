class Membership < ApplicationRecord
  belongs_to :member
  belongs_to :Business
end