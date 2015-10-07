# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Question.delete_all
Usertest.delete_all

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
