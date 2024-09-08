Given("I visit the user sign up page") do
  visit "/handlers/sign_up"
end

When ("I enter the valid information into the form") do
  fill_in "Email", with: "test@example.it"
  fill_in "Password", with: "password"
  fill_in "handler_password_confirmation", with: "password"
end

And ("I try to sign up") do
  click_button "commit"
end

Then ("I should be successfully logged into the user home") do
  visit "http://localhost:3000/handler"
  fill_in "Email", with: "test@example.it"
  fill_in "Password", with: "password"
  click_button "commit"
  expect(page).to have_content("User Home")
end


