module SafeSend
  module_function

  SAFE_METHODS = %w[
    business
    email
    name
    subscription
    status
    member
    count
  ].freeze

  BLOCKED_METHODS = %w[
    destroy
  ].freeze

  def safe_send(object, method)
    return "#{method}" \
      unless SAFE_METHODS.include?(method) && BLOCKED_METHODS.exclude?(method)

    object.public_send(method)
  end
end
