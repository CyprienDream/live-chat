class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @other_user = @chatroom.users.distinct.where.not(id: current_user.id)[0]
  end

  def create
    other_user = User.where(username: params[:username])[0]
    # if valid user and room does not exist already
    if other_user.valid? && Chatroom.all.select { |room| room.users.include?(current_user) && room.users.include?(other_user) }.empty?
      room = Chatroom.new
      room.users << current_user
      room.users << other_user
      room.save
      redirect_to chatroom_path(room)
    else
      redirect_to user_path(current_user)
    end
    # check if chatroom with same two users already exists
    # if not create chatroom and suscribe both users
    # redirect to chatroom or re render profile
  end
end
