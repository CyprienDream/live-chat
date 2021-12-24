class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @other_user = @chatroom.users.reject { |user| user == current_user }[0]
  end

  def create

  end
end
