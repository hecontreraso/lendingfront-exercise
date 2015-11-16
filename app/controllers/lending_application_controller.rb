class LendingApplicationController < ApplicationController
	def decide_if_approved
		requested_amount = lending_params[:requested_amount].to_i
		result = ''

		if requested_amount > 50000
			result = 'Declined'
		elsif requested_amount == 50000
			result = 'Undecided'
		elsif requested_amount > 0 && requested_amount < 50000
			result = 'Approved'
		else
			head 400
			return
		end

    respond_to do |format|
    	format.js {
    		render 'index',
    		locals: {
    			result: result
    		}
  		}
    end
	end

	def lending_params
		params.permit(:requested_amount)
	end
end
