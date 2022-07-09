class RoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @rooms = Room.all.order(:id)
    end

    def show
        if Room.find_by(id: params[:id]).nil?
            @room = Room.create!(id: params[:id])
        else 
            @room = Room.find(params[:id])
        end
        @messages = @room.messages
    end

    
end