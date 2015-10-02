require "rails_helper"

describe UsersController do

  context "POST create" do

    before do
      request.env['omniauth.auth'] = mock_auth_hash
    end

    it "redirects to root page" do
      post :create
      expect(response).to redirect_to(root_path)
    end

  end

  context "GET display" do

    let(:user) { create(:user) }

    it "displays the user" do
      session[:user_id] = user.id

      get :show, {id: user.id}
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).to eq(user)
    end

    it "notifies for user can see own profile" do
      session[:user_id] = user.id

      get :show, {id: "#{user.id + 1}"}
      expect(flash[:info]).to eq("Currently you may only visit your own profile.")
      expect(response).to redirect_to(user_path(user))
    end

    it "requires the user login" do
      get :show, {id: user.id}
      expect(flash[:notice]).to eq("You must be logged in to view that resource.")
      expect(response).to redirect_to(root_path)
    end

  end

  context "PUT update" do

    let(:user) { create(:user) }

    let(:user_id) { user.id }

    let(:params) do
      {
        id: user_id,
        user: {
          first_name: "John",
          last_name: "Doe"
        }
      }
    end

    before do
      put :update, params
    end

    it "updates the user" do
      expect(User.find(user_id).first_name).to eq("John")
      expect(User.find(user_id).last_name).to eq("Doe")
    end

    it "displays the success message and return users path" do
      expect(flash[:success]).to eq("Profile updated.")
      expect(response).to redirect_to(user_path)
    end

  end

  context "DELETE destroy" do
    let(:user) { create(:user) }

    it "sign out successfully" do
      session[:user_id] = user.id
      delete :destroy, {id: user.id}

      expect(flash[:success]).to eq("See you soon!")
      expect(session[:user_id]).to be_nil
    end
  end

end
