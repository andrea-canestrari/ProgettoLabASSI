Given("I am a logged-in admin") do
  userAdmin = Admin.create(email: "admin@example.com", password: "password")
    id = userAdmin.id
    visit "http://localhost:3000/admins/sign_in"
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit "http://localhost:3000/admin"
    expect(page).to have_content("Admin Home")
 end

 When("I visit the category page") do
  click_link "Categories"
end

And("I create a new category") do
  visit "http://localhost:3000/admin/categories/new"
end

And ("I fill the form with valid information") do
  fill_in "Name", with: "Categoria di prova"
  fill_in "Description", with: "Questo è una categoria di prova"
end

And("I confirm the info") do
  click_button "commit"
end

Then ("I should be able to add a new category") do
  expect(page).to have_content("Categoria di prova")
end



