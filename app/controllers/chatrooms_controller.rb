class ChatroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_chatroom, only: :show

  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
    @new_chatroom = Chatroom.new
  end

  def show
    @new_chatroom = Chatroom.new
    authorize @chatroom
    @message = Message.new
  end

  def create
    @new_chatroom = Chatroom.new(chatroom_params)
    authorize @new_chatroom
    @new_chatroom.user = current_user
    if @new_chatroom.save
      redirect_to chatrooms_path
    else
      render :index
    end
  end

  private

  def find_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
