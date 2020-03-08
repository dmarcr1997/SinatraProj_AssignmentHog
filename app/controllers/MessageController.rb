class MessageController < ApplicationController
    
    get '/messages' do
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
            if exists(params[:recipient])
                @recipient = Student.find_by(username: params[:recipient])
                Message.create(message: params[:message], student_id: current_student, recipient: @recipient.id)
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
            if current_student.id == @message.student_id || current_student.id == @message.recipient
                erb :'message/show'
            else
                puts 'message does not belong to you'
            end
        else
            puts 'must be logged in to view messages'
            redirect to '/login'
        end
    end
            


end
