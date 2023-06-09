require 'rails_helper'

RSpec.describe "/packs", type: :feature do
  describe "creation" do
    let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
    let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: true)}
    let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}
    
    it "#index" do
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

  describe "Pack edit and delete buttons on packs index page" do
    let!(:brand1) {Brand.create!(name:"brand1", founded: 1998, backpacks_only: true)}
    let!(:d) {brand1.packs.create!(name: "dx", liters: 10, waterproof: false)}
    let!(:j) {brand1.packs.create!(name: "jx", liters: 20, waterproof: false)}
    let!(:a) {brand1.packs.create!(name: "ax", liters: 30, waterproof: true)}
    let!(:g) {brand1.packs.create!(name: "gx", liters: 40, waterproof: true)}
    let!(:b) {brand1.packs.create!(name: "bx", liters: 50, waterproof: false)}
    let!(:e) {brand1.packs.create!(name: "ex", liters: 60, waterproof: true)}
    let!(:c) {brand1.packs.create!(name: "cx", liters: 70, waterproof: true)}
    let!(:i) {brand1.packs.create!(name: "ix", liters: 80, waterproof: true)}
    let!(:f) {brand1.packs.create!(name: "fx", liters: 90, waterproof: false)}
    let!(:h) {brand1.packs.create!(name: "hx", liters: 100, waterproof: false)}

    it "has edit links next to each pack" do
      visit "/pack_table_name"
 
      expect(page.all(:link, "Edit Pack").count).to eq(Pack.where(waterproof: true).length)
    end

    it "has a delete link next to every pack" do
      visit "/pack_table_name"
  
      expect(page.all(:link, "Delete Pack").count).to eq(Pack.where(waterproof: true).count)
  
      expect(page).to have_link("Delete Pack", id: "Delete #{a.id}")
      expect(page).to have_link("Delete Pack", id: "Delete #{g.id}")
    end
  
    it "delete link works" do
      visit "/pack_table_name"
  
      expect(page).to have_content(a.name)
      expect(page).to have_content(g.name)
  
      click_link("Delete #{a.id}")
      click_link("Delete #{g.id}")
      
      expect(page).to have_no_content(a.name)
      expect(page).to have_no_content(g.name)
    end
  end
  
end