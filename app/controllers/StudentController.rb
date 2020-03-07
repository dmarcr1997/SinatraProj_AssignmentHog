class StudentController < ApplicationController

    get '/signup' do
        if logged_in?
            puts 'signup logged in'
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
            puts 'invalid login haha'
            redirect to '/signup'
        else
            redirect to '/login'
        end
    end

    get '/login' do
        if logged_in?
            puts 'login logged in'
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
            puts 'invalid login from post'
            redirect to '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect to '/login'
        else
            redirect to '/'
        end
    end

end