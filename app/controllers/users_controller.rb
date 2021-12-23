class UsersController < ApplicationController
  def chatrooms

  end

  def show
    @user = User.find(params[:id])
    @previews = []
    # set up chatroom preview
    @user.chatrooms.each do |room|
      other_user = room.reject{ |user| user == current_user }[0]
      preview[:room] = room
      preview[:user] = other_user
      preview[:last_message] = room.messages.last
      @previews << preview
    end
  end
end
