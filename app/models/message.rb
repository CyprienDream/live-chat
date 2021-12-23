class Message < ApplicationRecord
  # define databse relationships
  belongs_to :user
  belongs_to :chatroom
end
