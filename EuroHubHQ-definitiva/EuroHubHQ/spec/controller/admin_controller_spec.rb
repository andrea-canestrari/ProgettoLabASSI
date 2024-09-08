require 'spec_helper'
require "rails_helper"

RSpec.describe AdminController, type: :controller do
  describe "#sign_in" do
    it "logs in a user with valid credentials" do
      userAdmin = Admin.create(email: "admin@example.com", password: "password")
      allow(controller).to receive(:authenticate_admin!).and_return(userAdmin)
      controller.sign_in(userAdmin)
    end
    it 'returns HTTP success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the search template' do
      expect(response).to render_template(:index)
    end
  end
end