# frozen_string_literal: true

module ApplicationHelper
  include SafeSend

  def resolve_attr(object, attr)
    if attr.is_a?(Proc)
      # attr = lambda
      # Ex.
      #   object = some_visit_object
      #   attr = lambda {|v| v.member.memberships.where(business_id: @site.business.id).first.status.upcase }

      # TODO: Figure this out for security
      # safe_lambda = SafeLambda.new(attr)
      # safe_lambda.call(object)

      attr.call(object)
    elsif attr.is_a?(String)
      # attr = string form dot notation to access on the object
      # Ex.
      #     object = some_membership_object
      #     attr = "business.name"
      #       -> some_membership_object.business.name

      attr.to_s.split('.').inject(object) do |accum, method|
        SafeSend.safe_send(accum, method)
      end&.to_s&.upcase
    else
      "N/A"
    end
  end
end
