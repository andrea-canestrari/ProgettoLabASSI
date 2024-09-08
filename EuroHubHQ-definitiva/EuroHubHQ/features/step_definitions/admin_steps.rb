Given("I visit the admin sign up page") do
  visit "/admins/sign_up"
end

When ("I fill in the registration form with valid information") do
  fill_in "Email", with: "test@example.it"
  fill_in "Password", with: "password"
  fill_in "admin_password_confirmation", with: "password"
end

And ("I sign up") do
  click_button "commit"
end

Then ("I should be successfully logged in") do
   visit "http://localhost:3000/admin"
   fill_in "Email", with: "test@example.it"
   fill_in "Password", with: "password"
   click_button "commit"
  expect(page).to have_content("Admin Home")
end


