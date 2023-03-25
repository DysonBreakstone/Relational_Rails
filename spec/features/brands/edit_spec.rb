require 'rails_helper'

RSpec.describe '/parents/:id/edit' do
  let!(:brand1) {Brand.create!(name:"Packs-R-Us", founded: 2000, backpacks_only: true)}
  it "has an edit button" do
    visit "/brands/#{brand1.id}"

    expect(page).to have_link("Update Brand", href: "/brands/#{brand1.id}/edit")
  end

  it "/brands/:brand_id/edit" do
    visit "/brands/#{brand1.id}"

    expect(page).to have_content("Packs-R-Us")
    expect(page).to have_content(2000)
    expect(page).to have_content(true)

    visit "/brands/#{brand1.id}/edit"

    fill_in("Name", with: "Packs-Aren't-Us")
    fill_in("Founded", with: 1998)
    choose("Backpacks_Only", option: false)
    click_button("Update")

    visit "/brands/#{brand1.id}"

    expect(page).to have_content("Packs-Aren't-Us")
    expect(page).to have_content(1998)
    expect(page).to have_content(false)

   
  end
end
