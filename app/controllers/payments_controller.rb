class PaymentsController < ApplicationController
  before_action :set_compensation

  def new
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @compensation.amount_cents,
    description:  "Payment for trip #{@compensation.trips.first.start_address} - #{@compensation.trips.first.start_address} for compensation #{@compensation.id}",
    currency:     @compensation.amount.currency
  )

  @compensation.update(payment: charge.to_json, state: 'paid')
  redirect_to compensation_path(@compensation)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_compensation_payment_path(@compensation)
  end

  private

  def set_compensation
    @compensation = Compensation.where(state: "pending").find(params[:compensation_id])
  end
end
