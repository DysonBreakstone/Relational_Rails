require 'rails_helper'

RSpec.describe 'brands packs index', type: :feature do
  describe "/brands/:brand_id/packs_table_name exists" do
    let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
    let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: false)}
    let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}

    let!(:gregory) {Brand.create!(name: "Gregory", founded: 1977, backpacks_only: false)}
    let!(:baltoro_65) {gregory.packs.create!(name: "Baltoro 65", liters: 65, waterproof: true)}
    let!(:resin_22) {gregory.packs.create!(name: "Resin 22", liters: 22, waterproof: false)}
    
    it "/brands/:brand_id/packs_table_name" do
      visit "/brands/#{osprey.id}/packs_table_name"
      
      expect(page).to have_content(osprey.name)
      expect(page).to have_content(farpoint_70.name)
      expect(page).to have_content(farpoint_70.liters)
      expect(page).to have_content(farpoint_70.waterproof)
      expect(page).to have_content(raptor_14.name)
      expect(page).to have_content(raptor_14.liters)
      expect(page).to have_content(raptor_14.waterproof)
      
      visit "/brands/#{gregory.id}/packs_table_name"

      expect(page).to have_content(gregory.name)
      expect(page).to have_content(baltoro_65.name)
      expect(page).to have_content(baltoro_65.liters)
      expect(page).to have_content(baltoro_65.waterproof)
      expect(page).to have_content(resin_22.name)
      expect(page).to have_content(resin_22.liters)
      expect(page).to have_content(resin_22.waterproof)
    end
  
  end
  # User Story 13
  describe "Parent Child creation" do
    let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
    let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: true)}
    let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}

    let!(:gregory) {Brand.create!(name: "Gregory", founded: 1977, backpacks_only: false)}
    let!(:baltoro_65) {gregory.packs.create!(name: "Baltoro 65", liters: 65, waterproof: true)}
    let!(:resin_22) {gregory.packs.create!(name: "Resin 22", liters: 22, waterproof: false)}

    it "has a create child button" do
      visit "/brands/#{osprey.id}/packs_table_name"
      expect(page).to have_link("Create Pack", href: "/brands/#{osprey.id}/pack_table_name/new")      
    end

    
  end
end