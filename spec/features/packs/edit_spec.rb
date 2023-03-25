require 'rails_helper'

RSpec.describe "/pack_table_name/edit" do
  let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
  let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: true)}
  let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}

  it "allows one to edit pack" do
    visit "/pack_table_name/#{raptor_14.id}"

    expect(page).to have_no_content("bacon")
    expect(page).to have_no_content(101)
    expect(page).to have_no_content(false)
    
    visit "/pack_table_name/#{raptor_14.id}/edit"
    # require 'pry'; binding.pry
    fill_in("Name", with: "bacon")
    fill_in("Liters", with: 101)
    choose("Waterproof", option: true)
    click_button("Update Pack")
    # require 'pry'; binding.pry
    visit "/pack_table_name"
    save_and_open_page
    expect(page).to have_content("bacon")
    expect(page).to have_content(101)
    expect(page).to have_content(true)
  end
end