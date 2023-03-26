require 'rails_helper'

RSpec.describe "/pack_table_name/:id" do
  describe "existence and features" do

    let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
    let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: false)}
    let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}

    it "displays individual packs" do
      visit "/pack_table_name/#{farpoint_70.id}"
      expect(page).to have_content(farpoint_70.name)
      expect(page).to have_content("Capacity: #{farpoint_70.liters} Liters")
      expect(page).to have_content("Waterproof? #{farpoint_70.waterproof}")
      
      visit "/pack_table_name/#{raptor_14.id}"
      expect(page).to have_content(raptor_14.name)
      expect(page).to have_content("Capacity: #{raptor_14.liters} Liters")
      expect(page).to have_content("Waterproof? #{raptor_14.waterproof}")
    end

    it "has update button" do
      visit "/pack_table_name/#{raptor_14.id}"

      expect(page).to have_link("Update Pack", href: "/pack_table_name/edit")
    end
  end

  describe "delete button" do
    let!(:brand1) {Brand.create!(name: "Brand1", founded: 1500, backpacks_only: true)}
    let!(:pack1) {Pack.create!(name: "Pack1", liters: "10", waterproof: true, brand_id: brand1.id)}
    let!(:pack2) {Pack.create!(name: "Pack2", liters: "20", waterproof: true, brand_id: brand1.id)}
    let!(:pack3) {Pack.create!(name: "Pack3", liters: "30", waterproof: true, brand_id: brand1.id)}
    let!(:pack4) {Pack.create!(name: "Pack4", liters: "40", waterproof: true, brand_id: brand1.id)}
    let!(:pack5) {Pack.create!(name: "Pack5", liters: "50", waterproof: true, brand_id: brand1.id)}
    
    it "delete button exists" do
      visit "/pack_table_name/#{pack1.id}"

      expect(page).to have_selector(:link_or_button, "Delete")
      
      visit "/pack_table_name/#{pack2.id}"

      expect(page).to have_selector(:link_or_button, "Delete")
    end

    it "delete button deletes" do
      visit "/pack_table_name"
      expect(page).to have_content(pack1.name)
      expect(page).to have_content(pack2.name)
      expect(page).to have_content(pack1.liters)
      expect(page).to have_content(pack2.liters)

      visit "/pack_table_name/#{pack1.id}"
      click_button("Delete")

      visit "/pack_table_name"
      expect(page).to have_no_content(pack1.name)
      expect(page).to have_no_content(pack1.liters)

      visit "/pack_table_name/#{pack2.id}"
      click_button("Delete")

      visit "/pack_table_name"
      expect(page).to have_no_content(pack2.name)
      expect(page).to have_no_content(pack2.liters)
    end
  end

end
