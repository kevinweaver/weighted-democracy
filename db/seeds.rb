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
