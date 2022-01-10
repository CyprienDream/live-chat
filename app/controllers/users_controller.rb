class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @previews = []
    preview = {}

    # set up chatroom preview
    @user.chatrooms.each do |room|
      other_user = room.users.reject { |user| user == current_user }[0]
      preview[:room] = room
      preview[:user] = other_user
      preview[:last_message] = room.messages.last
      @previews << preview
    end
    authorize @user
  end

  def new_chat

    # check if chatroom with same two users already exists
    # if not create chatroom and suscribe both users
    # redirect to chatroom or re render profile
  end
end
