class MessagesController < ApplicationController
    before_action :authenticate_user!

    def destroy
        message = Message.find(params[:id])
        if message.user == current_user
            message.destroy!
            redirect_back(fallback_location: root_path)
        else
            redirect_to room_path(current_user), notice: '他人のメッセージは削除できません。'
        end
        
    end
end