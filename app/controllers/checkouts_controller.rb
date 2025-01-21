class CheckoutsController < ApplicationController
  def create
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: 'Gym Membership',
          },
          unit_amount: 5000, # in cents
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )

    redirect_to session.url, allow_other_host: true
  rescue Stripe::StripeError => e
    flash[:alert] = e.message
    redirect_to root_path
  end

  def success
  end

  def cancel
  end
end