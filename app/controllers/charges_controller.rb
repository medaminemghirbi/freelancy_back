require 'stripe'
class ChargesController < ApplicationController
  # include CurrentUserConcern
  def create
    Stripe.api_key = 'sk_test_51KsTRVAP0C7RxDT0mJJpEc8eA4yeTSgjgG4hKAsWNmXPtktzutArQTg6p5EUrC1saJ6RBawnkunRj7zYA3NbxgB600szFxwwdw'

    begin
      customer = Stripe::Customer.create({  

                                           card: params[:token][:id],
                                           email: params[:token][:email]
                                           #  description: 'My First Test Customer (created for API docs)'

                                         })

      charge = Stripe::Charge.create({
                                       customer: customer.id,
                                       amount: params[:amount],
                                       currency: 'eur',
                                       source: params[:token][:card][:id], # obtained with Stripe.js
                                       description: 'Freelancy mission payement'
                                     })
    end
  end
end
