# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Response.delete_all
Usertest.delete_all
Notification.delete_all
Question.delete_all
Testversion.delete_all
User.delete_all

User.create!(email: 'tyler.p.walker@wsu.edu',
             password: 'password1234',
             password_confirmation: 'password1234',
             firstname: 'Tyler',
             lastname: 'Walker',
             role: 'admin',
             studentid: '11348007')

Testversion.create!(title: "Summer 2015",
                    isopen: true,
                    startdate:  DateTime.parse("09/01/2015 17:00"),
                    enddate:  DateTime.parse("09/01/2016 17:00"))
