Assignment Hog Pseudo Code

enviroment.rb
	ENV['SINATRA_ENV] || = "development"
	set up connection to Database
	require 'bundler/setup'
	Bundler.require(:default, ENV['SINATRA_ENV'])
	require all in app folder
end

config.ru
	require './config/environment'
	set up Rack Method Override
	use Studetns Controller
	use Assignments Controller
	run ApplicationController
end

Rakefile
	ENV["SINATRA_ENV] || = "development"
	require relative './config/environment'
	require 'sinatra/activerecord/rake'
end

Database
	create migration to make students table
	with columns Username, Password Digest, Email

	create migration to make assignments table
	with columns Name, Class, Due Date, Student_id
end

Application Controller
	 configure do
    		set :public_folder, 'public'
    		set :views, 'app/views'
    		enable :sessions
    		set :session_secret, random_number secret
	end

	get index page

	Helpers
		logged_in?
			checks if session has user_id	
		end
		
		current_user
			searches all students to find student with id that matches session Id
		end
		
		valid?
			for now just checks if sign up is valid
			later will add checks for user changes 		
		end
	end

end


Student Controller 
	get signup 
		if user logged_in?
			redirect to '/assignments'
		otherwise
			open student sign up form
		end
	end
	
	post signup 	
		if !valid_signup?
			redrirect to '/signup'
		if student already exists
			print student already exists
			redirect to login			
		otherwise
			create a new student
			save to database
			set session user_id = student's id
			redirect to '/assignments'
		end
	end

	get login
		if student logged_in?
			redirect to '/assignments'
		otherwise
			open login.erb login form	
		end
	end

	post login
		find student by username
		if student found and password is authenticated
			set session user_id = student id
			redirect to '/assignments'
		otherwise
			output invalid login 
			redirect to '/login'
		end
	end

	get logout
		if student logged_in?
			clear session
			redirect to '/login'
		otherwise
			redirect to index
		end
	end
end

Student model 
	student has_many assignments
end

Assignment Controller
	
	get assignments
		redirects to assignments.erb to show all student assignments if user is logged_in?
		if user not logged_in? redirects to login page 
	end

	get new assignments
		redirects to new.erb for new assignment form if user logged_in?
		if user not logged_in? redirects to login page
	end
	
	post new asignments
		if assignment content is empty redirect back to form
		otherwise create a new assignment and redirect to all assignments page
	end
	
	get specific assignment
		redirects to show.erb to show assignment if user logged_in?
		if user not logged_in? redirects to login page	
	end

	get edit assignment
		if user is logged_in? and their user id matches the assignment user_id
			find assignment
			open edit.erb edit form
		otherwise 
			redirect to assignments
		end
	end

	patch edit assignment
		find assignment with id from edit form
		if edit is empty redirect to edit form
		otherwise save changes to assignment
		redirect to assignment page
	end

	delete assignment
		find assignemt with id sent
		if user logged_in?
			and users id = assignment's user id
			destroy assignment
		otherwise
			output you do not own this assignment
			redirect to assignments
		end
	end
end

Assignment model
	belongs to a student
end



		
	
	
	


	