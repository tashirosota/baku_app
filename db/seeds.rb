# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Administrator.create(name: 'root', role: 'root', password: 'password', password_confirmation: 'password')
Administrator.create(name: 'tashiro', role: 'admin', password: 'password', password_confirmation: 'password')
Administrator.create(name: '運営アカウント', role: 'operator', password: 'password', password_confirmation: 'password')


30.times do |i|
  eventer = Eventer.create!(name: "テストユーザ-#{i}", profile: 'テストアカウントです')
  20.times {eventer.artists.create!(name: Faker::Artist.name, genre: Faker::Music.genre)}
  20.times do |i|
    e = eventer.events.create!(title: Faker::Artist.name, house: Faker::Pokemon.location)

    e.aasm.fire!(:list) if i%2 == 0
    e.aasm.fire!(:offer) if i%4 == 0
    e.aasm.fire!(:fix) if i%8 == 0

    if i%5 == 0 && !(i == 10||20)
      e.aasm.fire!(:list)
      e.aasm.fire!(:offer)
      e.aasm.fire!(:fix)
      e.aasm.fire!(:finish)
    end
  end

  eventer.events.each do |event|
    10.times do |i|
      e = event.offers.create!(artist: eventer.artists.sample)
      e.aasm.fire!(:offer) if i%2==0
      e.aasm.fire!(:approve) if i%4==0
      e.aasm.fire!(:cancel) if i%12==0
      e.aasm.fire!(:reject) if i == (6 || 18)
    end
  end
end

Event.all.each do |i|
  c_e = i.collaborators.create(eventer: Eventer.all.sample)
  c_e_a = i.offers.create(artist: c_e.artists.sample,eventer: c_e)
end