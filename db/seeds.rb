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
Administrator.create(name: '運営アカウント', role: 'viewer', password: 'password', password_confirmation: 'password')


10.times do |i|
  eventer = Eventer.create!(name: "テストユーザ-#{i}", profile: 'テストアカウントです')
  10.times {eventer.artists.create!(name: Faker::Artist.name, genre: Faker::Music.genre)}
  10.times {eventer.events.create!(title: Faker::Artist.name)}
  eventer.events.each do |event|
    3.times {event.offers.create!(artist: eventer.artists.sample)}
  end
end

Eventer.all.each do |i|
  3.times {Friend.create!(to_user: i, from_user: Eventer.all.sample)}
end

Event.all.each do |i|
  i.collaborators.create(eventer: Eventer.all.sample)
end