class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        @tasks= current_user.tasks
        @notifications = Notification.all.order(id: :DESC).last(2)

        if Room.find_by(id: current_user.id).nil?
            @room = Room.create!(id: current_user.id)
        else 
            @room = Room.find_by(id: current_user.id)
        end
        @messages = @room.messages.last(3)

    end
end
