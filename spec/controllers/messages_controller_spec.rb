require 'rails_helper'
include RandomData

RSpec.describe MessagesController, type: :controller do
    
    let(:user) { create(:user) }
    let(:carpool) { create(:carpool) }
    let(:message) { create(:message, user: user, carpool: carpool) }
    

    
    describe "GET show" do
        it "returns http success" do
            get :show, carpool_id: carpool.id, id: message.id
            expect(response).to have_http_status(:success)
        end
    end
    
    describe "GET new" do 
        it "returns http success" do
            get :new, carpool_id: carpool.id
            expect(response).to have_http_status(:success)
        end
        
        it "renders the #new view" do
            get :new, carpool_id: carpool.id
            expect(response).to render_template :new
        end
        
        it "instantiates @message" do
            get :new, carpool_id: carpool.id
            expect(assigns(:message)).not_to be_nil
        end
        
    end
    
    describe "POST create" do
        
        it "returns http success" do 
            post :create, carpool_id: carpool.id, message: { content: "Can we change pick up time?", user_id: user.id }
            expect(response).to have_http_status(:success)
        end
        
        
        it "assigns the new message to @message" do
            post :create, carpool_id: carpool.id, message: { content: "Can we change pick up time?", user_id: user.id }
            expect(assigns(:message)).to eq Message.last
        end
    
        # how to test for how the message shows up in Angular?
        
        
    end
    
    

end
