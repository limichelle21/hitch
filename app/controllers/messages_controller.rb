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
      
      if @message.save
          render json: @message, status: 200
        else
          render json: {message: "There was an error saving your message"}, status: 400
      end
      
      # need to auto reflect in screen - Angular? 
  end
    

  private
      
    def message_params
        params.require(:message).permit(:content, :user_id)
    end
      
    
    def get_carpool
        @carpool = Carpool.find(params[:carpool_id])
    end
    
end
