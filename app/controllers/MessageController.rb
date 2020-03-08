class MessageController < ApplicationController
    
    get '/messages' do
        # binding.pry
        if logged_in?
            @sent_messages = current_student.messages
            @recieved_messages = Message.all.select{|message| message.recipient == current_student.id }
            erb :'message/messages'
        else
            puts 'must be logged in to view messages'
            redirect to  '/login'
        end
    end

    get '/messages/new' do
        if logged_in?
            erb :'message/new'
        else
            puts 'must be logged in to create messages'
            redirect to  '/login'
        end
    end

    post '/messages' do
        if !valid?(params)
            puts 'invalid message'
            redirect to '/messages/new'
        else    
            if exists?(params[:recipient])
                @recipient = Student.find_by(username: params[:recipient])
                Message.create(message: params[:message], student_id: current_student.id, recipient: @recipient.id)
                current_student.save
                redirect to '/messages'
            else
                puts 'no user by that name'
                redirect to
                '/messages/new'
            end
        end
    end

    get '/messages/:id' do
        if logged_in?
            @message = Message.find_by(id: params[:id])
            if current_student.id == @message.student_id 
                @student = current_student
                @recipient = Student.find_by(id: @message.recipient)
                erb :'message/show'
            elsif current_student.id == @message.recipient
                @sender = Student.find_by(id: @message.student_id)
                erb :'message/show'   
            else
                puts 'message does not belong to you'
                redirect to '/messages'
            end
        else
            puts 'must be logged in to view messages'
            redirect to '/login'
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

    delete '/messages/:id/delete' do
        @message = Message.find_by(id: params[:id])
        if logged_in? && current_student.id == @message.student_id
            @message.student_id = nil
            puts 'student deleted messsage'
        elsif logged_in? && current_student.id == @message.recipient
            @message.recipient = nil
            puts 'recipient deleted message'
        else
            puts "must be logged in to delete assignments"
            redirect to '/login'
        end
        if @message.student_id == nil && @message.recipient == nil
            @message.destroy
            puts 'message deleted'
        end
        redirect to '/messages'
    end

end
