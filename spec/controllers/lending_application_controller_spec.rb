require 'rails_helper'

RSpec.describe LendingApplicationController, type: :controller do
  describe 'GET #index' do
  	it 'render the template 'do
  		expect(get :index).to render_template(:index)
  	end
  end

  describe 'POST #decide_if_approved' do
    it 'returns correct status' do
   	  xhr :post, :decide_if_approved, { requested_amount: '1000' }
  		expect(response.code).to eq('200')
  	end
  end
end
