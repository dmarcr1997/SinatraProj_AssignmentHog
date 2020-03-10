class MessageController < ApplicationController
    
    get '/messages' do
        # binding.pry
        if logged_in?
            @sent_messages = current_student.messages
            @recieved_messages = Message.all.select{|message| message.recipient == current_student.id }
            erb :'message/messages'
        else
            flash[:error] = 'Must be logged in to view messages.'
            redirect to  '/login'
        end
    end

    get '/messages/new' do
        if logged_in?
            erb :'message/new'
        else
            flash[:error] = 'Must be logged in to create messages.'
            redirect to  '/login'
        end
    end

    post '/messages' do
        # binding.pry
        if !valid?(params)
            flash[:error] = 'Fill out all message fields.'
            redirect to '/messages/new'
        else    
            if exists?(params[:recipient])
                @recipient = Student.find_by(username: params[:recipient])
                Message.create(message: params[:message], student_id: current_student.id, recipient: @recipient.id)
                current_student.save
                redirect to '/messages'
            else
                flash[:error] = 'No user by that name.'
                redirect to '/messages/new'
            end
        end
    end

    get '/messages/:id' do
        if logged_in?
            @message = Message.find_by(id: params[:id])
            if @message.nil?
                flash[:error] = "Cannot find message"
                redirect to '/messages'
            end
            if current_student.id == @message.student_id 
                @student = current_student
                @recipient = Student.find_by(id: @message.recipient)
                erb :'message/show'
            elsif current_student.id == @message.recipient
                @sender = Student.find_by(id: @message.student_id)
                erb :'message/show'   
            else
                flash[:error] = 'That message does not belong to you.'
                redirect to '/messages'
            end
        else
            flash[:error] = 'Must be logged in to view messages.'
            redirect to '/login'
        end
    end

    get '/messages/:id/new' do
        if logged_in?
            @recipient = Student.find_by(id: params[:id])
            erb :'message/new_to'
        else
            flash[:error] = 'Must be logged in to reply to messages.'
            redirect to '/login'
        end

    end
    
    delete '/messages/:id/delete' do
        @message = Message.find_by(id: params[:id])
        if logged_in? && current_student.id == @message.student_id
            @message.student_id = nil
            @message.save
            flash[:status] = 'Message Deleted'
        elsif logged_in? && current_student.id == @message.recipient
            @message.recipient = nil
            @message.save
            flash[:status] = 'Message Deleted'
        else
            flash[:error] = "Must be logged in to delete assignments."
            redirect to '/login'
        end
        if @message.student_id == nil && @message.recipient == nil
            @message.destroy
        end
        redirect to '/messages'
    end

end
