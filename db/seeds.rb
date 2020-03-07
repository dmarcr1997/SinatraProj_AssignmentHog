require_relative '../config/environment'

Student.create(username: "Joe", password: "myNameisJoe", email:'jojo18@email.com')

Student.create(username: "Melissa", password: "myNameisMelissa", email:'melissa18@email.com')

Student.create(username: "Denise", password: "myNameisDenise", email:'denise18@email.com')

Student.create(username: "Patrick", password: "myNameisPat", email:'Patrick18@email.com')

Assignment.create(name: "calc ch2 derivatives", class_name: "Calculus", due_date: "01/12/20", student_id: 1)

Assignment.create(name: "History Columbus", class_name: "History", due_date: "02/12/20", student_id: 1)

Assignment.create(name: "Hamlet overview", class_name: "English", due_date: "01/24/20", student_id: 1)

Assignment.create(name: 'Intro to Cells', class_name: 'Biology', due_date: "01/30/20", student_id: 1)

Assignment.create(name: "History Columbus", class_name: "History", due_date: "02/12/20", student_id: 2)

Assignment.create(name: "Hamlet overview", class_name: "English", due_date: "01/24/20", student_id: 3)

Assignment.create(name: 'Intro to Cells', class_name: 'Biology', due_date: "01/30/20", student_id: 4)
