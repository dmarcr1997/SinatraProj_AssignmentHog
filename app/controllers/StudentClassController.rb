class StudentClassController < ApplicationController 
    get '/studentclasses' do 
        if logged_in?
            @studentclasses = current_student.studentclasses.all
            erb :'studentclass/studentclasses'
        else
            puts 'must be logged in to view classes'
            redirect to '/assignments'
        end
    end

    get '/studentclasses/:id' do
        if logged_in? 
            @studentclass = Stucla.find_by(id: params[:id])
            if @studentclass
                erb :'studentclass/classshow'
            else
                puts "You are not apart of that class"
                redirect to '/studentclasses'
            end
        else
            puts "must be logged in to view classes"
            redirect to '/login'
        end
    end

end