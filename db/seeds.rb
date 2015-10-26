# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.create(prompt: "What is the current year",
                possible1: "2012",
                possible2: "2013",
                possible3: "2015",
                possible4: "2014",
                correct: "2015",
                question_type: "multchoice")

Question.create(prompt: "What is the next year",
                possible1: "2012",
                possible2: "2013",
                possible3: "2016",
                possible4: "2014",
                correct: "2016",
                question_type: "multchoice")

Question.create(prompt: "Is def a reserved word in Python",
                possible1: "True",
                possible2: "False",
                correct: "True",
                question_type: "truefalse")

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
