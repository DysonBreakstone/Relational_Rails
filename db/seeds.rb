# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

osprey = Brand.create!(name: "Osprey", founded: 1974, backpacks_only: true)
gregory = Brand.create!(name: "Gregory", founded: 1977, backpacks_only: false)
osprey.packs.create!(name: "Farpoint 70", liters: 70, waterproof: false)
osprey.packs.create!(name: "Raptor 14", liters: 14, waterproof: true)
osprey.packs.create!(name: "Arcane Roll Top 18", liters: 18, waterproof: true)
gregory.packs.create!(name: "Baltoro 65", liters: 65, waterproof: true)
gregory.packs.create!(name: "Resin 22", liters: 22, waterproof: false)