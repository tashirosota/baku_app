# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Administrator.create(name: '運営アカウント', password: 'password', password_confirmation: 'password')

10.times do |i|
  var = "@user#{i}"
  user = User.create!(name: "テストユーザ-#{i}", profile: 'テストアカウントです')
  eval("var = user")
end
 @user#{i}