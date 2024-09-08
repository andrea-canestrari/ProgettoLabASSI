require 'rails_helper'

RSpec.feature "Administration", type: :feature do
  # Test no. 1: Admin logs in and access admin panel #
  scenario "Admin register an account and sign in" do
    userAdmin = Admin.create(email: "admin@example.com", password: "password")
    id = userAdmin.id
    visit "http://localhost:3000/admins/sign_in"
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit "http://localhost:3000/admin"
    expect(page).to have_content("Admin Home")
  end


  # Test no.2: Admin logs in, access admin panel, creates a new category and then deletes it #
  scenario "Admin register an account, sign in and create a new category" do
    userAdmin = Admin.create(email: "admin@example.com", password: "password")
    id = userAdmin.id
    visit "http://localhost:3000/admins/sign_in"
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit "http://localhost:3000/admin"
    expect(page).to have_content("Admin Home")
    visit "http://localhost:3000/admin/categories/new"
    fill_in "Name", with: "Categoria di prova"
    fill_in "Description", with: "Questo è una categoria di prova"
    click_button "commit"
    expect(page).to have_content("Category was successfully created.")
    click_button "Delete this category"
    expect(page).to have_content("Category was successfully destroyed.")
  end

    # Test no.3: Admin logs in, access admin panel, creates a new order and then deletes it #
    scenario "Admin register an account, sign in and creates a new order" do
      userAdmin = Admin.create(email: "admin@example.com", password: "password")
      id = userAdmin.id
      visit "http://localhost:3000/admins/sign_in"
      fill_in "Email", with: "admin@example.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      visit "http://localhost:3000/admin"
      expect(page).to have_content("Admin Home")
      visit "http://localhost:3000/admin/orders/new"
      fill_in "Email", with: "testprova@example.com"
      fill_in "Total", with: "10500"
      fill_in "Address", with: "Viale di Villa Belardi 37, Roma"
      click_button "Create Order"
      expect(page).to have_content("Order was successfully created.")
      click_link "Edit this order"
      page.check('Completed')
      click_button "Update Order"
      expect(page).to have_content("Order was successfully updated.")
      click_button "Destroy this order"
      expect(page).to have_content("Order was successfully destroyed.")
    end


  # Test no.4: Admin logs in, access admin panel, creates a new product, adds some stocks, deletes them and finally deletes the product #
  scenario "Admin register an account, sign in and creates a new product" do
    userAdmin = Admin.create(email: "admin@example.com", password: "password")
    id = userAdmin.id
    visit "http://localhost:3000/admins/sign_in"
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit "http://localhost:3000/admin"
    expect(page).to have_content("Admin Home")
    visit "http://localhost:3000/admin/categories/new"
    fill_in "Name", with: "Categoria di prova"
    fill_in "Description", with: "Questo è una categoria di prova"
    click_button "commit"
    expect(page).to have_content("Category was successfully created.")
    visit "http://localhost:3000/admin/products/new"
    fill_in "product_name", with: "Prodotto di prova"
    fill_in "product_description", with: "Questo è un prodotto di prova"
    fill_in "product_price", with: "9999"
    select "Categoria di prova", :from => "product_category_id"
    click_button "commit"
    expect(page).to have_content("Product was successfully created.")
    click_link "Edit this product"
    click_link "Product Stock"
    click_link "New stock"
    fill_in "stock_size", with: "prova"
    fill_in "stock_amount", with: "10"
    click_button "commit"
    expect(page).to have_content("Stock was successfully created.")
    click_button "Destroy this stock"
    expect(page).to have_content("Stock was successfully destroyed.")
    visit "http://localhost:3000/admin/products/1"
    click_button "Destroy this product"
    expect(page).to have_content("Product was successfully destroyed.")
    visit "http://localhost:3000/admin/categories/1"
    click_button "Delete this category"
    expect(page).to have_content("Category was successfully destroyed.")
  end
end
  

