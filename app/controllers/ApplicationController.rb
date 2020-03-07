require './config/environment'
class ApplicationController < Sinatra::Base
    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, '7951421369402092809452156185262943623267768116687709700779886'
    end

    get '/' do
        erb :index
    end

    helpers do
        def logged_in?
            !!session[:user_id]
        end

        def current_student
            @student = Student.find(session[:user_id])
        end
    end

end