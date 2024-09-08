Given("I am an administrator") do
  userAdmin = Admin.create(email: "admin@example.com", password: "password")
    id = userAdmin.id
    visit "http://localhost:3000/admins/sign_in"
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit "http://localhost:3000/admin"
    expect(page).to have_content("Admin Home")
 end

 When("I create a new category item") do
  visit "http://localhost:3000/admin"
    expect(page).to have_content("Admin Home")
    visit "http://localhost:3000/admin/categories/new"
    fill_in "Name", with: "Categoria di prova"
    fill_in "Description", with: "Questo è una categoria di prova"
    click_button "commit"
    expect(page).to have_content("Category was successfully created.")
 end

 And("I create a new product") do
    visit "http://localhost:3000/admin/products/new"
    fill_in "product_name", with: "Prodotto di prova"
    fill_in "product_description", with: "Questo è un prodotto di prova"
    fill_in "product_price", with: "9999"
    select "Categoria di prova", :from => "product_category_id"
    click_button "commit"
    expect(page).to have_content("Product was successfully created.")
 end

 And("I add new stocks to the product") do
    visit "http://localhost:3000/admin/products/1/edit"
    click_link "Product Stock"
    click_link "New stock"
    fill_in "stock_size", with: "prova"
    fill_in "stock_amount", with: "10"
    click_button "commit"
    expect(page).to have_content("Stock was successfully created.")
end

Then("I should be able to add a new product.") do
    visit "http://localhost:3000/admin/products"
    expect(page).to have_content("Prodotto di prova")
end
