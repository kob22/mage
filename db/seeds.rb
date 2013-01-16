# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(title: 'admin', name: 'admin', surname: 'admins', email: 'kob2222@gmail.com', password: '12345', password_confirmation: '12345')
user.admin = true
user.save

