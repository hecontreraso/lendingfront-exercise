require 'rails_helper'

RSpec.feature 'application process', js: true do

  describe 'submit an application' do
    def submit_application(requested_amount)
      visit '/'
      fill_in 'form-first-name', with: '12345678'
      fill_in 'form-business-name', with: 'My small business'
      fill_in 'form-business-address', with: '750 howard street'
      fill_in 'form-business-city', with: 'San Francisco'
      fill_in 'form-business-state', with: 'California'
      fill_in 'form-business-postal-code', with: '94122'
      fill_in 'form-requested-amount', with: requested_amount
      click_button 'Next'

      fill_in 'form-social-security-number', with: '87654321'
      fill_in 'form-owner-name', with: 'Juliancho'
      fill_in 'form-email', with: 'Juliancho@gmail.com'
      fill_in 'form-owner-address', with: '1392 7th Avenue'
      fill_in 'form-owner-city', with: 'San Francisco'
      fill_in 'form-owner-state', with: 'California'
      fill_in 'form-owner-postal-code', with: '94100'
      
      click_button 'Sign me up!'
    end

    it 'approves requests if 0 < requested_amount < 50000' do
      submit_application(20000)
      expect(find('.form-top .form-top-left p')).to have_content('Approved')
    end

    it 'denies requests if requested_amount > 50000' do
      submit_application(80000)
      expect(find('.form-top .form-top-left p')).to have_content('Declined')
    end

    it 'shows undecided if requested_amount = 50000' do
      submit_application(50000)
      expect(find('.form-top .form-top-left p')).to have_content('Undecided')
    end
  end

end
