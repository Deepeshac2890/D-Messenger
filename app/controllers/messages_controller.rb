class MessagesController < ApplicationController

  before_action :require_login

  def groupChat
    @messages = Message.custom_display
  end

  def create
    message = Message.new(message: params[:message], user: current_user)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", message: message_render(message)
    else
      # Do Nothing
    end
  end

  private
  def message_render(message)
    render(partial: 'chat', locals: {messageObj: message})
  end
end