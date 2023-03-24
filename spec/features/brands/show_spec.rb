require 'rails_helper'

RSpec.describe "/brands", type: :feature do
  let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
  let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: false)}
  let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}
  let!(:arcane_18) {osprey.packs.create!(name: "Arcane Roll Top 18", liters: 18, waterproof: true)}
  
  let!(:gregory) {Brand.create!(name: "Gregory", founded: 1977, backpacks_only: false)}
  let!(:baltoro_65) {gregory.packs.create!(name: "Baltoro 65", liters: 65, waterproof: true)}
  let!(:resin_22) {gregory.packs.create!(name: "Resin 22", liters: 22, waterproof: false)}

  it "shows the names of all brands" do
    visit "/brands/#{osprey.id}"
    
    expect(page).to have_content(osprey.name)
    expect(page).to have_content(osprey.founded)
    expect(page).to have_content(osprey.backpacks_only)
  end

  #User Story 7
  it "shows the number of Packs associated with the Brand" do
    visit "/brands/#{osprey.id}"
    expect(page).to have_content("Number of packs: 3")
    
    visit "/brands/#{gregory.id}"
    
    expect(page).to have_content("Number of packs: 2")
  end

  #User Story 9
  it "Links to Brand's Pack Index page on Brand show page" do
    visit  "/brands/#{osprey.id}"
    expect(page).to have_link("Osprey's Packs", href: "/brands/#{osprey.id}/packs_table_name")
    
    visit  "/brands/#{gregory.id}"
    expect(page).to have_link("Gregory's Packs", href: "/brands/#{gregory.id}/packs_table_name")
    save_and_open_page
  end

end