# frozen_string_literal: true

module AccessibleByUser
  extend ActiveSupport::Concern

  class_methods do
    def default_scope_for_accessible_by_user(user)
      return none unless user
      return all if user.admin?
      return yield if block_given?
    end
  end

  included do
    if self == Site
      scope :accessible_by_user, ->(user) {
        default_scope_for_accessible_by_user(user) || user.sites
      }
    elsif self == Business
      scope :accessible_by_user, ->(user) {
        default_scope_for_accessible_by_user(user) || user.businesses
      }
    else
      # This is for stuff belonging to a site
      scope :accessible_by_user, ->(user) {
        default_scope_for_accessible_by_user(user) || where(site: Site.accessible_by_user(user))
      }
    end
  end
end
