# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :string
#  body       :text
#  article_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string
#
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
