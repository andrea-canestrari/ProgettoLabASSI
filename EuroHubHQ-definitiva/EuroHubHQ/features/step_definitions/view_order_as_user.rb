Given("I have an admin account and a user account") do
    userHandler = Handler.create(email: "user@example.com", password: "password")
    id_handler = userHandler.id
    userAdmin = Admin.create(email: "admin@example.com", password: "password")
    id = userAdmin.id
    visit "http://localhost:3000/admins/sign_in"
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit "http://localhost:3000/admin"
    expect(page).to have_content("Admin Home")
end

When("I create a new order made by the user") do
  visit "http://localhost:3000/admin/orders/new"
  fill_in "Email", with: "user@example.com"
  fill_in "Total", with: "10500"
  fill_in "Address", with: "Viale di Villa Belardi 37, Roma"
  click_button "Create Order"
  expect(page).to have_content("Order was successfully created.")
end

And("I access the user dashboard") do
  visit "http://localhost:3000/handlers/sign_in"
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit "http://localhost:3000/handler"
end

Then("I should be able to see my order") do
  visit "http://localhost:3000/handler/show"
  expect(page).to have_content("1")
end

    

