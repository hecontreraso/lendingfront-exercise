class LendingApplicationController < ApplicationController
	def decide_if_approved
		requested_amount = lending_params[:requested_amount]
		msg = ''

		if requested_amount > 50000
			msg = 'Declined'
		elsif requested_amount == 50000
			msg = 'Undecided'
		elsif requested_amount > 0 && requested_amount < 50000
			msg = 'Approved'
		end

	end

	def lending_params
		params.permit(:requested_amount)
	end
end
