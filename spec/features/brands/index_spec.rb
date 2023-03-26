require 'rails_helper'

RSpec.describe "/brands", type: :feature do
  let!(:osprey) {Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)}
  let!(:gregory) {Brand.create!(name: "Gregory", founded: 1977, backpacks_only: false)}

  it "shows the names of all brands" do
    visit "/brands"
    
    expect(page).to have_content(osprey.name)
    expect(page).to have_content(gregory.name)
  end
  
  
  let!(:d) {Brand.create!(name: "dx", founded: 1977, backpacks_only: false)}
  let!(:j) {Brand.create!(name: "jx", founded: 1977, backpacks_only: false)}
  let!(:a) {Brand.create!(name: "ax", founded: 1974, backpacks_only: true)}
  let!(:g) {Brand.create!(name: "gx", founded: 1974, backpacks_only: true)}
  let!(:b) {Brand.create!(name: "bx", founded: 1977, backpacks_only: false)}
  let!(:e) {Brand.create!(name: "ex", founded: 1974, backpacks_only: true)}
  let!(:c) {Brand.create!(name: "cx", founded: 1974, backpacks_only: true)}
  let!(:i) {Brand.create!(name: "ix", founded: 1974, backpacks_only: true)}
  let!(:f) {Brand.create!(name: "fx", founded: 1977, backpacks_only: false)}
  let!(:h) {Brand.create!(name: "hx", founded: 1977, backpacks_only: false)}
  
  it "shows brands in reverse order of creation" do
    visit "/brands"
    expect(page).to have_content(d.name)
    expect(page).to have_content(i.name)
    expect(page).to have_content(j.name)
    expect(page).to have_content(h.name)
    
    expect(h.name).to appear_before(f.name)
    expect(f.name).to appear_before(i.name)
    expect(i.name).to appear_before(c.name)
    expect(c.name).to appear_before(e.name)
    expect(e.name).to appear_before(b.name)
    expect(b.name).to appear_before(g.name)
    expect(g.name).to appear_before(a.name)
    expect(a.name).to appear_before(j.name)
    expect(j.name).to appear_before(d.name)
  end

  it "has an edit next to every brand" do
    visit "/brands"
    
    expect(page.all(:link, "Edit Brand").count).to eq(Brand.all.length)
  end

  it "has a delete link next to every brand" do
    visit "/brands"

    expect(page.all(:link, "Delete Brand").count).to eq(Brand.all.length)

    expect(page).to have_link("Delete Brand", id: "Delete #{a.id}")
  end

end