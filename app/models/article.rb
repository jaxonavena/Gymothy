# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string
#
class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy # if an article gets destroyed, so will its comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  # All of the below status stuff is now coming from the "include Visible" at the top of the model
  # VALID_STATUSES = ['public', 'private', 'archived']

  # validates :status, inclusion: { in: VALID_STATUSES }

  # def archived?
  #   status == 'archived'
  # end
end
