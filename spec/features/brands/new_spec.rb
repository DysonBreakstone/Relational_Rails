require 'rails_helper'

RSpec.describe "/new", type: :feature do
  it "has a link to a Brand creation page in brands index" do
    visit "/brands"

    expect(page).to have_link("New Brand", href: "/brands/new")
  end

  it "allows one to create a new brand" do
    visit "/brands/new"

    fill_in("Name", with: "flrgdrg")
    fill_in("Founded", with: 2000)
    choose("Backpacks_Only", option: true)

    expect(page).to have_field("Name", with: "flrgdrg")
    click_button("Create Brand")
    
    expect(page).to have_content("flrgdrg")
    expect(current_path).to have_content("/brands")
  end

  it "has successfully created the new brand" do
    visit "/brands"
    expect(page).to have_no_content("hamburger")
    expect(page).to have_no_content(1810)
    expect(page).to have_no_content(true)

    visit "/brands/new"

    fill_in("Name", with: "hamburger")
    fill_in("Founded", with: 1810)
    choose("Backpacks_Only", option: true)
    click_button("Create Brand")

    visit "/brands/new"

    fill_in("Name", with: "gravy_fries")
    fill_in("Founded", with: 2020)
    choose("Backpacks_Only", option: false)
    click_button("Create Brand")
    
    visit "/brands"

    expect(page).to have_content("hamburger")
    expect(page).to have_content(1810)
    expect(page).to have_content(true)

    expect(page).to have_content("gravy_fries")
    expect(page).to have_content(4040)
    expect(page).to have_content(false)
  end
end