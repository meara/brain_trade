# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Category.create(name: 'Art')
art = Category.create!(name: 'Art')
cooking = Category.create!(name: 'Cooking')
crafts = Category.create!(name: 'Crafts')
economics = Category.create!(name: 'Economics')
history = Category.create!(name: 'History')
languages = Category.create!(name: 'Languages')
life_sciences = Category.create!(name: 'Life Sciences')
literature = Category.create!(name: 'Literature')
miscellaneous = Category.create!(name: 'Miscellaneous')
math = Category.create!(name: 'Mathematics')
phys_sciences = Category.create!(name: 'Physical Sciences')
programming = Category.create!(name: 'Programming')
social_sciences = Category.create!(name: 'Social Sciences')
writing = Category.create!(name: 'Writing')


french = languages.subjects.create!(name: 'French')
spanish = languages.subjects.create!(name: 'Spanish')
german = languages.subjects.create!(name: 'German')
asl = languages.subjects.create!(name: 'ASL')
norwegian = languages.subjects.create!(name: 'Norwegian')
portuguese = languages.subjects.create!(name: 'Portuguese')

meara = User.create!(first_name: 'Wendy', last_name: 'Darling', email: 'wendy@dar.ling', password: 'password', password_confirmation: 'password')
peter = User.create!(first_name: 'Peter', last_name: 'Pan', email: 'pete@pan.com', password: 'password', password_confirmation: 'password')

meara_french = french.offerings.create!(teacher_id: 1, hangout: true)
peter_french = french.offerings.create!(teacher_id: 2, hangout: true)
peter_asl = asl.offerings.create!(teacher_id: 2, hangout: true)
