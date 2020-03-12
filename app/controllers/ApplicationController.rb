require './config/environment'
class ApplicationController < Sinatra::Base
    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
       
        enable :sessions
        set :session_secret, "#{ENV['SESSION_SECRET']}"
        register Sinatra::Flash
    end

    get '/' do
        if logged_in?
            flash[:error] = "You are already logged in"
            redirect to '/assignments'
        else
            erb :index
        end
    end

    helpers do
        def logged_in?
            !!session[:user_id]
        end

        def current_student
            @student = Student.find(session[:user_id])
        end

        def valid? (params)
            params.each do |param|
                if param.empty?
                    return false
                end
            end
            true
        end

        def exists?(username)
            @student = Student.find_by(username: username)
        end

    end

end