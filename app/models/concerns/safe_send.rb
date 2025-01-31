module SafeSend
  module_function

  SAFE_METHODS = %w[
    business
    email
    name
    subscription
    status
    member
    memberships
    count
  ].freeze

  BLOCKED_METHODS = %w[
    destroy
    delete
    drop
  ].freeze

  def safe_send(object, method)
    return method.to_s unless SAFE_METHODS.include?(method) && BLOCKED_METHODS.exclude?(method)

    object.public_send(method)
  end
  class SafeLambda
    def initialize(&block)
      @block = block
    end

    def call(*args)
      if args.any? { |arg| BLACKLISTED_METHODS.map(&:to_i).include?(arg) }
        raise ArgumentError, "Forbidden method call detected: #{args & BLACKLISTED_METHODS}"
      end

      # ensure correct arg count
      if @block.arity != -1 && @block.arity != args.size
        raise ArgumentError, "wrong number of arguments (given #{args.size}, expected #{@block.arity})"
      end

      @block.call(*args)
    end
  end
end
