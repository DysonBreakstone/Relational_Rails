require 'rails_helper'

RSpec.describe "layout" do
  let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
  let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: false)}
  let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}
  let!(:arcane_18) {osprey.packs.create!(name: "Arcane Roll Top 18", liters: 18, waterproof: true)}
  
  let!(:gregory) {Brand.create!(name: "Gregory", founded: 1977, backpacks_only: false)}
  let!(:baltoro_65) {gregory.packs.create!(name: "Baltoro 65", liters: 65, waterproof: true)}
  let!(:resin_22) {gregory.packs.create!(name: "Resin 22", liters: 22, waterproof: false)}

  it "displays a link to the packs index page at the top of every other page" do
    visit "/brands"
    expect(page).to have_link("All Packs", href: "/pack_table_name")
    visit "/brands/#{osprey.id}"
    expect(page).to have_link("All Packs", href: "/pack_table_name")
    visit "/pack_table_name"
    expect(page).to have_link("All Packs", href: "/pack_table_name")
    visit "/pack_table_name/#{raptor_14.id}"
    expect(page).to have_link("All Packs", href: "/pack_table_name")
    visit "/brands/#{gregory.id}/packs_table_name"
    expect(page).to have_link("All Packs", href: "/pack_table_name")
  end

  it "displays a link to the brands index page at the top of every other page" do
    visit "/brands"
    expect(page).to have_link("All Brands", href: "/brands")
    visit "/brands/#{osprey.id}"
    expect(page).to have_link("All Brands", href: "/brands")
    visit "/pack_table_name"
    expect(page).to have_link("All Brands", href: "/brands")
    visit "/pack_table_name/#{raptor_14.id}"
    expect(page).to have_link("All Brands", href: "/brands")
    visit "/brands/#{gregory.id}/packs_table_name"
    expect(page).to have_link("All Brands", href: "/brands")
    save_and_open_page
  end


end