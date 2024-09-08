require 'rails_helper'

RSpec.feature "Authentication", type: :feature do
  describe "Invalid Login", type: :feature do
    it "logs in with invalid credentials" do
      userHandler = Handler.create(email: "user@example.com", password: "password")
      userAdmin = Admin.create(email: "admin@example.com", password: "password")
      visit "http://localhost:3000/handlers/sign_in"
      fill_in "Email", with: "invalid@example.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to have_content("Invalid email or password.")
      fill_in "Email", with: "admin@example.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to have_content("Invalid email or password.")
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      visit "http://localhost:3000/handler"
      expect(page).to have_content("User Home")
    end
  end

  describe "Modify User", type: :feature do
    it "modifies user name and password" do
      userHandler = Handler.create(email: "user@example.com", password: "password")
      visit "http://localhost:3000/handlers/sign_in"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      visit "http://localhost:3000/handler"
      expect(page).to have_content("User Home")
      click_link "Settings"
      expect(page).to have_content("Edit Handler")
      fill_in "Email", with: "user@example.com"
      fill_in "handler_password", with: "password!"
      fill_in "handler_password_confirmation", with: "password!"
      fill_in "handler_current_password", with: "password"
      click_button "commit"
      visit "http://localhost:3000/handler"
      click_link "Sign out"
      visit "http://localhost:3000/handler"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password!"
      click_button "Log in"
      expect(page).to have_content("User Home")
    end
  end

  


  
end
