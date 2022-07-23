class MessagesController < ApplicationController
    before_action :authenticate_user!

    def destroy
        message = Message.find(params[:id])
        message.destroy!
        redirect_back(fallback_location: root_path)
    end
end