class AssignmentController < ApplicationController
    get '/assignments' do
        if logged_in?
            @assignments = current_student.assignments
            erb :'assignment/assignments'
        else
            redirect to '/login'
        end
    end

    get '/assignments/new' do
        if logged_in?
            erb :'assignment/new'
        else
            puts "not logged in cannot create assignment"
            redirect to '/login'
        end
    end

    post '/assignments' do
        if !valid?(params)
            redirect to '/assignments/new'
        else
            Assignment.create(name: params[:name], class_name: params[:class_name], due_date: params[:due_date], student_id: current_student.id)
            redirect to '/assignments'
        end
    end

    get '/assignments/:id' do
        if logged_in?
            # binding.pry
            current_student.assignments.each{|assignment| @assignment = assignment if assignment.id == params[:id].to_i } 
            if @assignment
                erb :'assignment/show'
            else
                redirect to '/assignments'
            end
        else
            redirect to '/login'
        end
    end

    get '/assignments/:id/edit' do
        @assignment = Assignment.find_by(id: params[:id])
        if logged_in? && current_student.id == @assignment.student_id
            erb :'assignment/edit'
        elsif logged_in? && current_student.id != @assignment.student_id
            puts "cannot edit other students assignments"
            redirect to '/assignments'
        else
            puts "must be logged in to edit assignments"
            redirect to '/login'
        end
    end

    patch '/assignments' do
        @assignment = Assignment.find_by(name: params[:name])
        if !valid?(params)
            puts 'must fill out forms completely'
            redirect to '/assignments/#{@assignment.id}/edit'
        else
            @assignment.update(name: params[:name], class_name: params[:class_name], due_date: params[:due_date], student_id: current_student.id)
            redirect to '/assignments/#{@assignment.id}'
        end
    end

    get '/assignments/:id/delete' do
        if logged_in?
            puts "can only delete with delete button"
            redirect to '/assignments'
        else
            puts "cannot delete"
            redirect to '/login'
        end
    end
    
    delete '/assignments/:id/delete' do
        @assignment = Assignment.find_by(id: params[:id])
        if logged_in? && current_student.id == @assignment.student_id
            @assignment.destroy
            redirect to '/assignments'
        elsif logged_in? && current_student.id != @assignment.student_id
            puts "cannot delete other students assignments"
            redirect to '/assignments'
        else
            puts "must be logged in to delete assignments"
            redirect to '/login'
        end
    end



end
