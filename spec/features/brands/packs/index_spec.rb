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
      expect(page).to have_link("Create Pack", href: "/brands/#{osprey.id}/packs_table_name/new")      
    end
  end

  describe "alphabetization" do 
    let!(:brand1) {Brand.create!(name:"brand1", founded: 1998, backpacks_only: true)}
    let!(:d) {brand1.packs.create!(name: "dxe", liters: 10, waterproof: false)}
    let!(:j) {brand1.packs.create!(name: "jxe", liters: 20, waterproof: false)}
    let!(:a) {brand1.packs.create!(name: "axe", liters: 30, waterproof: true)}
    let!(:g) {brand1.packs.create!(name: "gxe", liters: 40, waterproof: true)}
    let!(:b) {brand1.packs.create!(name: "bxe", liters: 50, waterproof: false)}
    let!(:e) {brand1.packs.create!(name: "exe", liters: 60, waterproof: true)}
    let!(:c) {brand1.packs.create!(name: "cxe", liters: 70, waterproof: true)}
    let!(:i) {brand1.packs.create!(name: "ixe", liters: 80, waterproof: true)}
    let!(:f) {brand1.packs.create!(name: "fxe", liters: 90, waterproof: false)}
    let!(:h) {brand1.packs.create!(name: "hxe", liters: 100, waterproof: false)}

    it "has an alphabetize link" do
      visit "/brands/#{brand1.id}/packs_table_name"

      expect(page).to have_link("Alphabetize")
    end

    it "appears in alphabetical order when button is clicked" do 
      visit "/brands/#{brand1.id}/packs_table_name"

      expect(d.name).to appear_before(j.name)
      expect(j.name).to appear_before(a.name)
      expect(a.name).to appear_before(g.name)
      expect(g.name).to appear_before(b.name)
      expect(b.name).to appear_before(e.name)
      expect(e.name).to appear_before(c.name)
      expect(c.name).to appear_before(i.name)
      expect(i.name).to appear_before(f.name)
      expect(f.name).to appear_before(h.name)

      click_link("Alphabetize")

      expect(a.name).to appear_before(b.name)
      expect(b.name).to appear_before(c.name)
      expect(c.name).to appear_before(d.name)
      expect(d.name).to appear_before(e.name)
      expect(e.name).to appear_before(f.name)
      expect(f.name).to appear_before(g.name)
      expect(g.name).to appear_before(h.name)
      expect(h.name).to appear_before(i.name)
      expect(i.name).to appear_before(j.name)
  
    end
  end

  # User Story 18
  describe "Child edit button on child index page" do
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

    it "has edit links next to each child" do
      visit "/brands/#{brand1.id}/packs_table_name/"
 
      expect(page.all(:link, "Edit Pack").count).to eq(Pack.where(brand_id: brand1.id).length)
    end
  end

  # User Story 21
  describe "filter by user input" do
    let!(:brand1) {Brand.create!(name: "brand1", founded: 1979, backpacks_only: false)}
    let!(:pack1) {brand1.packs.create!(name: "pack1", liters: 50, waterproof: true)}
    let!(:pack2) {brand1.packs.create!(name: "pack2", liters: 40, waterproof: true)}
    let!(:pack3) {brand1.packs.create!(name: "pack3", liters: 30, waterproof: true)}
    let!(:pack4) {brand1.packs.create!(name: "pack4", liters: 20, waterproof: true)}
    let!(:pack5) {brand1.packs.create!(name: "pack5", liters: 10, waterproof: true)}

    it "has a filter button and a text input" do
      visit "/brands/#{brand1.id}/packs_table_name"

      expect(page).to have_selector(:link_or_button, "Filter")
      find('input[type="number"][name="liter_threshold"]')
    end

    it "can filter using user input" do
      visit "/brands/#{brand1.id}/packs_table_name"
    
      expect(page).to have_content(pack1.name)
      expect(page).to have_content(pack2.name)
      expect(page).to have_content(pack3.name)
      expect(page).to have_content(pack4.name)
      expect(page).to have_content(pack5.name)

      fill_in("liter_threshold", with: 30)
      click_button("Filter")

      expect(page).to have_no_content(pack4.name)
      expect(page).to have_no_content(pack5.name)
    end

    it "has a delete link next to every pack" do
      visit "/brands/#{brand1.id}/packs_table_name"
  
      expect(page.all(:link, "Delete Pack").count).to eq(Pack.where(brand_id: brand1.id).count)
  
      expect(page).to have_link("Delete Pack", id: "Delete #{pack1.id}")
      expect(page).to have_link("Delete Pack", id: "Delete #{pack3.id}")
    end
  
    it "delete link works" do
      visit "/brands/#{brand1.id}/packs_table_name"
  
      expect(page).to have_content(pack1.name)
      expect(page).to have_content(pack2.name)
  
      click_link("Delete #{pack1.id}")
      click_link("Delete #{pack2.id}")
      
      expect(page).to have_no_content(pack1.name)
      expect(page).to have_no_content(pack2.name)
    end
  end
end