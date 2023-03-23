require 'rails_helper'

RSpec.describe "/brands", type: :feature do
  let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
  let!(:gregory) {Brand.create!(name: "Gregory", founded: 1977, backpacks_only: false)}
  it "shows the names of all brands" do
    visit "/brands/#{osprey.id}"

    save_and_open_page
    
    expect(page).to have_content(osprey.name)
    expect(page).to have_content(osprey.founded)
    expect(page).to have_content(osprey.backpacks_only)
  end

end