# Category.create(name: 'Art')
art = Category.create!(name: 'Art') #1
business = Category.create!(name: 'Business') #1
cooking = Category.create!(name: 'Cooking') #2
crafts = Category.create!(name: 'Crafts') #3
economics = Category.create!(name: 'Economics') #4
history = Category.create!(name: 'History') #5
languages = Category.create!(name: 'Languages') #6
life_sciences = Category.create!(name: 'Life Sciences') #7
literature = Category.create!(name: 'Literature') #8
martial_arts = Category.create!(name: 'Martial Arts') #13
miscellaneous = Category.create!(name: 'Miscellaneous') #8
math = Category.create!(name: 'Mathematics') #9
phys_sciences = Category.create!(name: 'Physical Sciences') #9
programming = Category.create!(name: 'Programming') #10
social_sciences = Category.create!(name: 'Social Sciences') #11
writing = Category.create!(name: 'Writing') #12
sports = Category.create!(name: 'Sports') #12


#Subjects
painting = art.subjects.create!(name: 'Painting')
photo = art.subjects.create!(name: 'Photography')
drawing = art.subjects.create!(name: 'Drawing')
comic = art.subjects.create!(name: 'Comic Book Sketching')
skuplting = art.subjects.create!(name: 'Skuplting')


water = sports.subjects.create!(name: 'Under-water aerobics')
soccer = sports.subjects.create!(name: 'Soccer')
football = sports.subjects.create!(name: 'Football')
rugby = sports.subjects.create!(name: 'Rugby')
tennis = sports.subjects.create!(name: 'Tennis')
track = sports.subjects.create!(name: 'Track')
volleyball = sports.subjects.create!(name: 'Volleyball')
yoga = sports.subjects.create!(name: 'Yoga')
weights = sports.subjects.create!(name: 'Weights')
hockey = sports.subjects.create!(name: 'Hockey')

knitting = crafts.subjects.create!(name: 'Knitting')
ornaments = crafts.subjects.create!(name: 'Ornaments')
glassblow = crafts.subjects.create!(name: 'Glassblowing')
beading = crafts.subjects.create!(name: 'Beading')
basket_weaving = crafts.subjects.create!(name: 'Basket Weaving')
leather = crafts.subjects.create!(name: 'Leather Carving')

marx = social_sciences.subjects.create!(name: 'Marxism')

french = languages.subjects.create!(name: 'French')
spanish = languages.subjects.create!(name: 'Spanish')
german = languages.subjects.create!(name: 'German')
asl = languages.subjects.create!(name: 'ASL')
norwegian = languages.subjects.create!(name: 'Norwegian')
portuguese = languages.subjects.create!(name: 'Portuguese')

#math subjects
fractal = math.subjects.create!(name: 'Fractal Geometry')
calc = math.subjects.create!(name: 'Calculus')
num_theory = math.subjects.create!(name: 'Number Theory')
prob = math.subjects.create!(name: 'Probability and Statistics')
logic = math.subjects.create!(name: 'Logic')
info_theory = math.subjects.create!(name: 'Information Theory')

#martial arts subjects
judo = martial_arts.subjects.create!(name: 'Judo')
calc = martial_arts.subjects.create!(name: 'Aikido')
kendo = martial_arts.subjects.create!(name: 'Kendo')
ninjutsu = martial_arts.subjects.create!(name: 'Ninjutsu')
sumo = martial_arts.subjects.create!(name: 'Sumo')
surma = martial_arts.subjects.create!(name: 'Surma stickfighting')

#business subjects
30.times do
  business.subjects.create!(name: Faker::Company.bs)
end

# #programming subjects

ruby = programming.subjects.create!(name: "Ruby")
python = programming.subjects.create!(name: "Python")
babbage = programming.subjects.create!(name: "Babbage")
c = programming.subjects.create!(name: "C")
javascript = programming.subjects.create!(name: "Javascript")
r = programming.subjects.create!(name: "R")
python = programming.subjects.create!(name: "MATLAB")
CSS = programming.subjects.create!(name: "CSS")

#cooking
thai = cooking.subjects.create!(name: "Thai")
chinese = cooking.subjects.create!(name: "Chinese")
italian = cooking.subjects.create!(name: "Italian")
indian = cooking.subjects.create!(name: "Indian")
mexican = cooking.subjects.create!(name: "Mexican")
bbq = cooking.subjects.create!(name: "BBQ")
cake = cooking.subjects.create!(name: "Cake Baking")
soup = cooking.subjects.create!(name: "Soup")

#literature
shakes = literature.subjects.create!(name: "Shakespeare")
greek = literature.subjects.create!(name: "Greek")
novel = literature.subjects.create!(name: "Novel")
poem = literature.subjects.create!(name: "Poem")
short_story = literature.subjects.create!(name: "Short Story")
drama = literature.subjects.create!(name: "Drama")

wendy = User.create!(first_name: 'Wendy', last_name: 'Darling', email: 'wendy@dar.ling', password: 'password', password_confirmation: 'password')
peter = User.create!(first_name: 'Peter', last_name: 'Pan', email: 'pete@pan.com', password: 'password', password_confirmation: 'password')

wendy_french = french.offerings.create!(teacher_id: wendy.id, hangout: true)
peter_french = french.offerings.create!(teacher_id: peter.id, hangout: true)
peter_asl = asl.offerings.create!(teacher_id: peter.id, hangout: true)


50.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", password_confirmation: "password") #make users
end

100.times do
  User.find(rand(1..50)).offerings << Offering.create!(subject_id: rand(1..92), teacher_id: rand(1..52), hangout: true, location: Faker::Address.state)
end


