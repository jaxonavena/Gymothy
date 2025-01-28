# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  name         :string
#  phone_number :string
#  email        :string
#  birthday     :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Member < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :businesses, through: :memberships, source: :business

  has_many :visits
  has_many :sites, through: :visits

  has_many :interests
  has_many :interested_events, through: :interests, source: :event

  validates :name, presence: true
  validates :email, presence: true, unless: -> { phone_number.present? }
  validates :phone_number, presence: true, unless: -> { email.present? }

  def set_interest_in_event(event, status = "Interested")
    interested_events << event unless interested_events.include?(event)

    interest = find_event_interest(event)
    interest&.status = status
  end

  def update_interest_in_event(event, status)
    interest = find_event_interest(event)
    interest.update_column(:status, status)
  end

  def reset_interest_in_event(event)
    update_interest_in_event(event, "Interested")
  end

  def destroy_interest_in_event(event)
    find_event_interest(event)&.destroy
  end

  def find_event_interest(event)
    Interest.find_by(event_id: event.id, member_id: id)
  end

  def visit(site)
    visit = Visit.find_or_create_by!(member: self, site: site)
    visit.count += 1
    visit.save!
  end
end
