require 'rails_helper'

RSpec.describe "/brands", type: :feature do
  describe "display" do
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
    end
  end

  describe "Delete button" do
    let!(:brand1) {Brand.create!(name: "Brand1", founded: 1901, backpacks_only: true)}
    let!(:brand2) {Brand.create!(name: "Brand2", founded: 1902, backpacks_only: true)}
    let!(:brand3) {Brand.create!(name: "Brand3", founded: 1903, backpacks_only: true)}
    let!(:brand4) {Brand.create!(name: "Brand4", founded: 1904, backpacks_only: true)}
    let!(:brand5) {Brand.create!(name: "Brand5", founded: 1905, backpacks_only: true)}
    let!(:brand6) {Brand.create!(name: "Brand6", founded: 1906, backpacks_only: true)}
    
    # User story 19
    it "has a delete button" do
      visit "/brands/#{brand1.id}"

      expect(page).to have_selector(:link_or_button, "Delete")
    end

    it "delete button deletes Brand" do
      visit "/brands"
      expect(page).to have_content(brand1.name)
      expect(page).to have_content(brand2.name)
      expect(page).to have_content(brand1.founded)
      expect(page).to have_content(brand2.founded)

      visit "/brands/#{brand1.id}"
      click_button("Delete")

      visit "/brands"
      expect(page).to have_no_content(brand1.name)
      expect(page).to have_no_content(brand1.founded)

      visit "/brands/#{brand2.id}"
      click_button("Delete")

      visit "/brands"
      expect(page).to have_no_content(brand2.name)
      expect(page).to have_no_content(brand2.founded)
    end
  end
end

