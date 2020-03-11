class StudentClassController < ApplicationController 
    get '/studentclasses' do 
        if logged_in?
            @studentclasses = current_student.stuclas.all
            erb :'studentclass/studentclasses'
        else
            flash[:error] = 'Must be logged in to view classes.'
            redirect to '/assignments'
        end
    end

    get '/studentclasses/:id' do
        if logged_in? 
            @studentclass = Stucla.find_by(id: params[:id])
            if @studentclass
                @students = @studentclass.students.all
                erb :'studentclass/classshow'
            else
                flash[:error] = "You are not apart of that class."
                redirect to '/studentclasses'
            end
        else
            flash[:error] = "Must be logged in to view classes."
            redirect to '/login'
        end
    end

end