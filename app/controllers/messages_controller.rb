class MessagesController < ApplicationController
    
  before_action :get_carpool
    
  def index
      @messages = @carpool.messages.all
  end

  def show 
      @message = @carpool.messages.find(params[:id])
  end

  def new
      @message = Message.new
  end

  def create
      @message = Message.new
      @message = @carpool.messages.build(message_params)
      
      # need to auto reflect in screen - Angular? 
  end
    
    
    
  private
      
    def message_params
        params.require(:message).permit(:content, :user_id)
    end
      
    
    def get_carpool
        @carpool = Carpool.find(params[:id])
    end
    
end
