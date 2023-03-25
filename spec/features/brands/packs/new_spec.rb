require 'rails_helper'

RSpec.describe '/brands/:parent_id/packs_table_name/new' do
  let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
  let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: true)}
  let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}

  let!(:gregory) {Brand.create!(name: "Gregory", founded: 1977, backpacks_only: false)}
  let!(:baltoro_65) {gregory.packs.create!(name: "Baltoro 65", liters: 65, waterproof: true)}
  let!(:resin_22) {gregory.packs.create!(name: "Resin 22", liters: 22, waterproof: false)}
  
  it "button brings user to form to create new Pack" do
    visit "/brands/#{osprey.id}/packs_table_name/"

    expect(page).to have_no_content("bacon")
    expect(page).to have_no_content(101)
    expect(page).to have_no_content(false)
    
    visit "/brands/#{osprey.id}/packs_table_name/new"

    fill_in("Name", with: "bacon")
    fill_in("Liters", with: 101)
    choose("Waterproof", option: false)
    click_button("Create Pack")

    visit "/brands/#{osprey.id}/packs_table_name"
    save_and_open_page
    expect(page).to have_content("bacon")
    expect(page).to have_content(101)
    expect(page).to have_content(false)
  end

end