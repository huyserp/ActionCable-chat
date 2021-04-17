class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
  end

end
