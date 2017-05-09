class PaymentsController < ApplicationController
    
    def show
    end
    
    
    # create charge to passenger by calling Stripe API
    def create
        @amount = # carpool.total_payment (ride seats x price per seat plus fee)
        
        charge_params = {
            amount: @amount,
            description: 'Hitch Passenger',
            currency: 'usd'
            }
        
        carpool_params = {
            user_id: current_user.id,
            total_payment: @amount,
            created_at: Date.today.to_s
            }
        
     
        
        if current_user.present?
            if current_user.stripe_id.present?
                user = Stripe::Customer.retrieve(current_user.stripe_id)
            else
                user = Stripe::Customer.create(
                    email: current_user.email,
                    source: params[:stripeToken]
                    )
                current_user.assign_attributes(stripe_id: user_id)
            end
            charge_params[:user] = user["id"]
        else
            # redirect to user sign in page
        end
        
        charge = Stripe::Charge.create(charge_params)
        
        @carpool = Carpool.build(carpool_params)
        @carpool.save!
        
    rescue Stripe::CardError => e
        flash[:error] = e.message
        flash[:notice] = "Please try again"
        # alerts should happen in Angular controller
            
    end
    
    
end
