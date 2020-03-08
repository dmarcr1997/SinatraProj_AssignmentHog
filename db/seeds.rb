require_relative '../config/environment'

Student.create(username: "Joe", password: "myNameisJoe", email:'jojo18@email.com')

Student.create(username: "Melissa", password: "myNameisMelissa", email:'melissa18@email.com')

Student.create(username: "Denise", password: "myNameisDenise", email:'denise18@email.com')

Student.create(username: "Patrick", password: "myNameisPat", email:'Patrick18@email.com')

Assignment.create(name: "calc ch2 derivatives", class_name: "Calculus", due_date: "01/12/20", student_id: 1, stucla_id: 1)

Assignment.create(name: "History Columbus", class_name: "History", due_date: "02/12/20", student_id: 1, stucla_id: 2)

Assignment.create(name: "Hamlet overview", class_name: "English", due_date: "01/24/20", student_id: 1, stucla_id: 3)

Assignment.create(name: 'Intro to Cells', class_name: 'Biology', due_date: "01/30/20", student_id: 1, stucla_id: 4)

Assignment.create(name: "History Columbus", class_name: "History", due_date: "02/12/20", student_id: 2, stucla_id: 2)

Assignment.create(name: "Hamlet overview", class_name: "English", due_date: "01/24/20", student_id: 3, stucla_id: 3)

Assignment.create(name: 'Intro to Cells', class_name: 'Biology', due_date: "01/30/20", student_id: 4, stucla_id: 4)

Stucla.create(name: 'Calculus')

Stucla.create(name: 'English')

Stucla.create(name: 'History')

Stucla.create(name: 'Biology')

Message.create(message: "Hi Melissa", student_id: 1, recipient: 2)

Message.create(message: "Hi Denise", student_id: 2, recipient: 3)

Message.create(message: "Hi Patrick", student_id: 3, recipient: 4)

Message.create(message: "Hi Joe", student_id: 4, recipient: 1)



