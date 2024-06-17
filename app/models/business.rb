class Business < ApplicationRecord
  has_many :sites
  has_many :members
end