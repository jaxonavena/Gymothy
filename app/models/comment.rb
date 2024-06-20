class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  # All of the below status stuff is now coming from the "include Visible" at the top of the model
  # VALID_STATUSES = ['public', 'private', 'archived']

  # validates :status, inclusion: { in: VALID_STATUSES }

  # def archived?
  #   status == 'archived'
  # end
end
