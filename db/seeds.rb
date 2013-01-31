puts "Creating Users..."
users = [
  ["Jorge", "Almeyda", "nash2609@gmail.com", "fishringcandle"],
  ["Steve", "Crespo", "stephencrespo9@gmail.com", "charliebrowntree"],
  ["Lee", "Quarella", "leequarella@gmail.com", "im1coolguy"]
]
users.each do |user|
  User.create({
    first_name: user[0],
    last_name: user[1],
    email: user[2],
    password: user[3],
    password_confirmation: user[3]
    })
end


puts "Creating Issues..."
Issue.create({
  name: "Things",
  description: "LOTS OF TEXT"
})
puts "Creating Disciplines..."
Discipline.create({
  name: "Computers",
  description: "01100011 01101111 01101101 01110000 01110101 01110100 01100101 01110010 01110010"
})
puts "Creating Questions..."
Question.create({
  name: "Questions of the keeper of the Bridge of Death",
  text:  "Stop!  Who would cross the Bridge of Death must answer me
    these questions three, 'ere the other side he see.",
  discipline_id: 1
})
puts "Creating Answers..."
Answer.create({
  text: "I don't know that! Aaaaaagh!",
  question_id: 1
})
