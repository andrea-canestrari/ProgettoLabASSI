require 'spec_helper'
require "rails_helper"

RSpec.describe HandlerController, type: :controller do
  describe "#sign_in" do
    it "logs in a user with valid credentials" do
      userHandler = Handler.create(email: "user@example.com", password: "password")
      allow(controller).to receive(:authenticate_handler!).and_return(userHandler)
      controller.sign_in(userHandler)
    end
  end
  it 'returns HTTP success' do
    expect(response).to have_http_status(:success)
  end
end