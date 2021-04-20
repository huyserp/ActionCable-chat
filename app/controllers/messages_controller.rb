class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    authorize @chatroom
    @message = Message.new(message_params)
    authorize @message
    @message.user = current_user
    @message.chatroom = @chatroom
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render 'chatrooms/show'
    end
  end

  def edit
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
