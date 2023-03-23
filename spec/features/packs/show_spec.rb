require 'rails_helper'

RSpec.describe "/pack_table_name/:id" do

  let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
  let!(:farpoint_70) {osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: false)}
  let!(:raptor_14) {osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)}

  it "displays individual packs" do
    visit "/pack_table_name/#{farpoint_70.id}"
    expect(page).to have_content(farpoint_70.name)
    expect(page).to have_content("Capacity: #{farpoint_70.liters} Liters")
    expect(page).to have_content("Waterproof? #{farpoint_70.waterproof}")
    save_and_open_page
    
    visit "/pack_table_name/#{raptor_14.id}"
    expect(page).to have_content(raptor_14.name)
    expect(page).to have_content("Capacity: #{raptor_14.liters} Liters")
    expect(page).to have_content("Waterproof? #{raptor_14.waterproof}")
    save_and_open_page
  end

end
