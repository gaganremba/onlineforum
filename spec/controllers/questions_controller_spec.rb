require 'rails_helper'
RSpec.describe QuestionsController, type: :controller do
  let(:valid_attributes) {
    { :title => "Test title!", :description => "This is a test description", :user_id => 1 }
  }

  let(:valid_session) { {} }

  describe "Questions POST #create" do
    it "returns a success response" do
      Question.create valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end
end