class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def stripe
    event = nil
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    endpoint_secret = ENV['STRIPE_WEBHOOK_SECRET']

    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue JSON::ParserError, Stripe::SignatureVerificationError => e
      render json: { error: e.message }, status: 400
      return
    end

    case event['type']
    when 'checkout.session.completed'
      # Fulfill the purchase, update the database
      puts 'Payment successful!'
    end

    Rails.logger.info "Received event: #{event['type']}"

    render json: { message: 'Success' }
  end
end