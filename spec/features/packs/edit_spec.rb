require 'rails_helper'

RSpec.describe "/pack_table_name/edit" do
  let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
  let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: true)}
  let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}

  it "allows one to edit pack" do
    visit "/packs_table_name/#{osprey.id}"

    expect(page).to have_no_content("bacon")
    expect(page).to have_no_content(101)
    expect(page).to have_no_content(false)
    
    visit "/packs_table_name/#{osprey.id}/edit"

    fill_in("Name", with: "bacon")
    fill_in("Liters", with: 101)
    choose("Waterproof", option: false)
    click_button("Update Pack")

    visit "/packs_table_name"
    # save_and_open_page
    expect(page).to have_content("bacon")
    expect(page).to have_content(101)
    expect(page).to have_content(false)
  end
end