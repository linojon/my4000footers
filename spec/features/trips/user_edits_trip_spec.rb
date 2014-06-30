require 'rails_helper'

feature 'User edits trip' do

  let(:trip)        { create :trip, :with_hiker }
  let(:other_hiker) { create :hiker, :with_user }

  background do
    sign_in other_hiker
  end

  scenario "any hiker on trip can edit" do
    trip.hikers << other_hiker
    trip.save
    visit "/trips/#{trip.to_param}/edit"
    expect(page).to have_content "Editing Trip"
  end

  scenario "non hikers cannot edit" do
    visit "/trips/#{trip.to_param}/edit"
    expect(page).to have_content "not allowed"
  end

end
