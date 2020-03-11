class StudentController < ApplicationController

    get '/signup' do
        if logged_in?
            flash[:error] = "You already have an account."
            redirect to '/assignments'
        else
            erb :'student/signup'
        end
    end

    post '/signup' do
        if valid?(params) && exists?(params[:username]).nil?
            @student = Student.create(username: params[:username], password: params[:password], email: params[:email])
            session[:user_id] = @student.id
            redirect to '/assignments'
        elsif !valid?(params)
            flash[:error] = 'Invalid Sign up. Fill out all forms.'
            redirect to '/signup'
        else
            flash[:error] = "There is already a student with that username."
            redirect to '/login'
        end
    end

    get '/login' do
        if logged_in?
            flash[:error] = 'You are already logged in.'
            redirect to '/assignments'
        else
            erb :'student/login'
        end
    end

    post '/login' do
        @student = Student.find_by(email: params[:email])
        # binding.pry
        if @student && @student.authenticate(params[:password])
            session[:user_id] = @student.id
            redirect to '/assignments'
        else
            flash[:error] = 'Wrong Combination of Username and Password.'
            redirect to '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect to '/login'
        else
            flash[:error] = "You are not logged in."
            redirect to '/'
        end
    end
end