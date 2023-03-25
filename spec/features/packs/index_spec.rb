require 'rails_helper'

RSpec.describe "/packs", type: :feature do
  describe "creation" do
    let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
    let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: false)}
    let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}
    
    xit "#index" do
      visit "/pack_table_name"

      expect(page).to have_content(farpoint_70.name)
      expect(page).to have_content("Capacity: #{farpoint_70.liters} Liters")
      expect(page).to have_content("Waterproof? #{farpoint_70.waterproof}")
      
      expect(page).to have_content(raptor_14.name)
      expect(page).to have_content("Capacity: #{raptor_14.liters} Liters")
      expect(page).to have_content("Waterproof? #{raptor_14.waterproof}")
    end
  end

  describe "filtering" do
    let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
    let!(:pack1) {osprey.packs.create!(name: "pack1", liters: 70, waterproof: false)}
    let!(:pack2) {osprey.packs.create!(name: "pack2", liters: 14, waterproof: true)}
    let!(:pack3) {osprey.packs.create!(name: "pack3", liters: 14, waterproof: false)}
    let!(:pack4) {osprey.packs.create!(name: "pack4", liters: 70, waterproof: false)}
    let!(:pack5) {osprey.packs.create!(name: "pack5", liters: 14, waterproof: true)}
    # User story 15
    it "shows only waterproof packs" do
      visit "/pack_table_name" 

      expect(page).to have_content(pack2.name)
      expect(page).to have_content(pack5.name)
      expect(page).to have_no_content(pack1.name)
      expect(page).to have_no_content(pack3.name)
      expect(page).to have_no_content(pack4.name)
    end
  end
  
end