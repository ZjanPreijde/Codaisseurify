# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Song.destroy_all
Artist.destroy_all

# Seed artists, keep values
meatloaf = Artist.create!(name: "MeatLoaf", image_url: "")
redhot   = Artist.create!(name: "Red Hot Chili Peppers", image_url: "")
jay      =  Artist.create!(name: "Screamin'Jay Hawkins", image_url: "")

# Seed songs
Song.create!(title: "Paradise by the Dashboard Light", artist: meatloaf)
Song.create!(title: "Heaven Can Wait", artist: meatloaf)
Song.create!(title: "All Revved Up With No Place To Go", artist: meatloaf)

Song.create!(title: "Californication", artist: redhot)
Song.create!(title: "Under the Bridge", artist: redhot)
Song.create!(title: "Give It Away", artist: redhot)

Song.create!(title: "Californication", artist: jay)
Song.create!(title: "Under the Bridge", artist: jay)
Song.create!(title: "Give It Away", artist: jay)
