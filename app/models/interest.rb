class Interest < ApplicationRecord
  # Members can be interested in events
  belongs_to :member
  belongs_to :event
end
