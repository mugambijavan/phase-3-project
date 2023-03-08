require "rails_helper"

RSpec.describe UsersController, type: :controller do
  
  describe "Users#new" do
    it "renders the correct view" do
      get :new
      expect(response).to render_template "users/new"
    end
  end

  describe "Users#create" do
    context "with valid params" do
      it "creates a new User record" do
        expect {
          post :create, params: { 
            user: { 
              name: "Foosta", 
              email: "foosta@bubba.com", 
              password: "foosta", 
              password_confirmation: "foosta" 
              } 
          }
        }.to change{ User.count }
      end
      it "redirects to the user welcome page"
    end 
    
    context "with invalid params" do
      it "does NOT create a new User record" do
        expect { 
          post :create, params: {
            user: {
              name: "Foosta",
              email: " ",
              password: " ",
              password_confirmation: " ",
            }
          }
        }.to_not change{ User.count }
      end
       
      it "renders the new template" do
        get :new
        expect(response).to render_template "users/new"
      end 

      it "returns a status of 422" do
        
        post :create, params: {
            user: {
              name: "Foosta",
              email: " ",
              password: " ",
              password_confirmation: " ",
            }
          }
        
        expect(response).to have_http_status(422)
      end

    end
  end
end
