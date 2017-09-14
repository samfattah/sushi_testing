require 'rails_helper'

RSpec.describe SushiRollsController, type: :controller do
  login_user

  let(:valid_attributes) {
    { name: 'Vegas Roll', fish_type: 'Salmon', spicy: true, price: 200 }
  }

  let(:invalid_attributes) {
    { name: '', fish_type: '', spicy: true, price: 200 }
  }

  describe "GET #index" do
    it "returns http success" do
      FactoryGirl.create(:sushi_roll, user: @user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      sushi_roll = FactoryGirl.create(:sushi_roll, user: @user)
      get :show, params: { id: sushi_roll.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      sushi_roll = FactoryGirl.create(:sushi_roll, user: @user)
      get :show, params: { id: sushi_roll.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'creates a new sushi roll' do
      post :create, params: { sushi_roll: valid_attributes }
      expect(@user.sushi_rolls.count).to eq(1)
    end

    it 'does not create a new sushi roll' do
      post :create, params: { sushi_roll: invalid_attributes }
      expect(@user.sushi_rolls.count).to eq(0)
    end
  end

  describe 'PATCH #update' do
    let(:new_attributes) {
      { fish_type: 'Tuna'}
    }

    before(:each) do 
      @sushi_roll = FactoryGirl.create(:sushi_roll, user: @user)
    end

    it 'updates the sushi roll with valid attributes' do
      put :update, params: { id: @sushi_roll.id, sushi_roll: new_attributes }
      # stale variable situation - only time reload is needed is in update
      @sushi_roll.reload
      expect(@sushi_roll.fish_type).to eq(new_attributes[:fish_type])
    end

    it 'does not update the sushi with invalid attributes' do
      put :update, params: { id: @sushi_roll.id, sushi_roll: new_attributes }
      @sushi_roll.reload
      expect(@sushi_roll.fish_type).to_not eq(invalid_attributes[:fish_type])
    end 
  end

  # describe 'DELETE #destroy' do
  #   before(:each) do 
  #     @sushi_roll = FactoryGirl.create(:sushi_roll, user: @user)
  #   end
    
  #   it 'deletes the sushi roll' do
  #     binding.pry
  #     put :destroy, params: { id: @sushi_roll }
  #   end
    
  #   it 'does not delete the sushi roll'
    
  # end

  describe "DELETE #destroy" do
    it "destroys the selected sushi roll" do
      sushi_roll = @user.sushi_rolls.create! valid_attributes
      expect {
        delete :destroy, params: {id: sushi_roll.id}
      }.to change(SushiRoll, :count).by(-1)
    end

    it "redirects to the sushi rolls list" do
      sushi_roll = @user.sushi_rolls.create! valid_attributes
      delete :destroy, params: {id: sushi_roll.id}
      expect(response).to redirect_to(sushi_rolls_path)
    end
  end

end
