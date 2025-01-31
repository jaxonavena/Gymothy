# frozen_string_literal: true

module ApplicationHelper
  include SafeSend

  def resolve_attr(object, attr)
    # attr = string form dot notation to access on the object
    # Ex.
    #     object = some_membership_object
    #     attr = "business.name"
    #       -> some_membership_object.business.name
    #
    attr.to_s.split('.').inject(object) do |accum, method|
      SafeSend.safe_send(accum, method)
    end&.to_s&.upcase
  end
end
