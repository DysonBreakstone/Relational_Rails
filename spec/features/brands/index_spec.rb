require 'rails_helper'

RSpec.describe "/brands", type: :feature do
  let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
  let!(:gregory) {Brand.create!(name: "Gregory", founded: 1977, backpacks_only: false)}

  it "shows the names of all brands" do
    visit "/brands"
    
    expect(page).to have_content(osprey.name)
    expect(page).to have_content(gregory.name)
  end
  
  
  let!(:d) {Brand.create!(name: "d", founded: 1977, backpacks_only: false)}
  let!(:j) {Brand.create!(name: "j", founded: 1977, backpacks_only: false)}
  let!(:a) {Brand.create!(name: "a", founded: 1974, backpacks_only: true)}
  let!(:g) {Brand.create!(name: "g", founded: 1974, backpacks_only: true)}
  let!(:b) {Brand.create!(name: "b", founded: 1977, backpacks_only: false)}
  let!(:e) {Brand.create!(name: "e", founded: 1974, backpacks_only: true)}
  let!(:c) {Brand.create!(name: "c", founded: 1974, backpacks_only: true)}
  let!(:i) {Brand.create!(name: "i", founded: 1974, backpacks_only: true)}
  let!(:f) {Brand.create!(name: "f", founded: 1977, backpacks_only: false)}
  let!(:h) {Brand.create!(name: "h", founded: 1977, backpacks_only: false)}
  
  it "shows brands in alphabetical order" do
    visit "/brands"
    expect(page).to have_content(d.name)
    expect(page).to have_content(i.name)
    expect(page).to have_content(j.name)
    expect(page).to have_content(h.name)

    save_and_open_page

    expect(h.name).to appear_before(f.name)
    expect(f.name).to appear_before(i.name)
    expect(i.name).to appear_before(c.name)
    expect(c.name).to appear_before(e.name)
    expect(b.name).to appear_before(g.name)
    expect(g.name).to appear_before(a.name)
    expect(a.name).to appear_before(j.name)
  end

end