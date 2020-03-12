class AssignmentController < ApplicationController
    get '/assignments' do
        if logged_in?
            @assignments = current_student.assignments
            erb :'assignment/assignments'
        else
            flash[:error] = "Must be logged in to access assignments."
            redirect to '/login'
        end
    end

    get '/assignments/new' do
        if logged_in?
            erb :'assignment/new'
        else
            flash[:error] = "Must be logged in to create an assignments"
            redirect to '/login'
        end
    end

    post '/assignments' do
        if !valid?(params)
            flash[:error] = "Invalid assignment. Please fill out all fields."
            redirect to '/assignments/new'
        else
            @student_class = Stucla.find_by(name: params[:class_name])
            if @student_class.nil?
                @student_class = Stucla.create(name: params[:class_name])     
            end
            @assignment = Assignment.create(name: params[:name], due_date: params[:due_date], student_id: current_student.id, stucla_id: @student_class.id)
            @student_class.save
            redirect to '/assignments'
        end
    end

    get '/assignments/:id' do
        if logged_in?
            current_student.assignments.each{|assignment| @assignment = assignment if assignment.id == params[:id].to_i } 
            @student_class = Stucla.find_by(id: @assignment.stucla_id)
            if @assignment
                erb :'assignment/show'
            else
                flash[:error] = "Cannot find that assignment."
                redirect to '/assignments'
            end
        else
            flash[:error] = "Must be logged in to view assignments."
            redirect to '/login'
        end
    end

    get '/assignments/:id/edit' do
        @assignment = Assignment.find_by(id: params[:id])
        if logged_in? && current_student.id == @assignment.student_id
            erb :'assignment/edit'
        elsif logged_in? && current_student.id != @assignment.student_id
            flash[:error] = "Cannot edit other students assignments."
            redirect to '/assignments'
        else
            flash[:error] = "Must be logged in to edit assignments."
            redirect to '/login'
        end
    end

    patch '/assignments' do
        @assignment = Assignment.find_by(name: params[:name])
        if !valid?(params)
            flash[:error] = 'Must fill out form completely.'
            redirect to '/assignments/#{@assignment.id}/edit'
        else
            @student_class = Stucla.find_by(name: params[:class_name])
            @assignment.update(name: params[:name], due_date: params[:due_date], student_id: current_student.id, stucla_id: @student_class.id)
            redirect to '/assignments/#{@assignment.id}'
        end
    end

    get '/assignments/:id/delete' do
        if logged_in?
            flash[:error] = "Can only delete with delete button."
            redirect to '/assignments'
        else
            flash[:error] = "Must be logged in to delete."
            redirect to '/login'
        end
    end

    delete '/assignments/:id/delete' do
        @assignment = Assignment.find_by(id: params[:id])
        if logged_in? && current_student.id == @assignment.student_id
            @assignment.destroy
            redirect to '/assignments'
        elsif logged_in? && current_student.id != @assignment.student_id
            flag[:error] = "Cannot delete other students assignments."
            redirect to '/assignments'
        else
            flag[:error] = "Must be logged in to delete assignments."
            redirect to '/login'
        end
    end

end
