class ChatroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_chatroom, only: [:show, :destroy]

  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
  end

  def show
    authorize @chatroom
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :index
    end
  end

  def destroy
    authorize @chatroom
  end

  private

  def find_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
