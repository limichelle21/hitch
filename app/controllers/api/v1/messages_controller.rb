class Api::V1::MessagesController < ApiController
  respond_to :json
    
  before_action :get_carpool
    
  def index
      @messages = @carpool.messages.all
      render json: @messages, status: 200
  end

  def show 
      @message = @carpool.messages.find(params[:id])
      render json: @message, status: 200
  end

  def create
      @message = @carpool.messages.build(message_params)
      
      if @message.save
          render json: @message, status: 200
        else
          render json: {message: "There was an error saving your message"}, status: 400
      end
      
      render json: @message
  end
    

  private
      
    def message_params
        params.require(:message).permit(:content, :user_id)
    end
      
    
    def get_carpool
        @carpool = Carpool.find(params[:carpool_id])
    end
    
end