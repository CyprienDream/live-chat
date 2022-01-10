class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @other_user = @chatroom.users.distinct.where.not(id: current_user.id)[0]
  end

  def create

  end
end
