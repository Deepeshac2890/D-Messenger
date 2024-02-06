class MessagesController < ApplicationController

  before_action :require_login

  def groupChat
    @messages = Message.all
  end

  def create
    byebug
    message = Message.create(message: params[:message], user: current_user)
    if message
      redirect_back fallback_location: root_path
    else
      # Do Nothing
    end
  end
end