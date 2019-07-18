class MessagesController < ApplicationController

  def show
  	@messages = Message.all
  end

  def create
  	
  end

  def destroy
  end
end
