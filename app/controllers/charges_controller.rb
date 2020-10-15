class ChargesController < ApplicationController
    
    
    def new
    end
    
    def create

            # Amount in cents
      @amount = (current_place.cost * 100).to_i
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'RV Park',
        currency: 'usd',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

    Charge.create(charge_params)

    private
    def charge_params
        params.require(:charge).permit(:place_id, :user_id)

    end

    def current_place
        @current_place ||= Place.find(params[:place_id])

    end

end
