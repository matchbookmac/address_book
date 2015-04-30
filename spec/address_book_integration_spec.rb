require('capybara/rspec')
require('pry')
require('./app')
require('contact')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# before() do
#   Contact.clear()
# end

describe('the add contact path', {:type => :feature}) do
  it('will add a contact to the contact list') do
    visit('/')
    click_link('Add Contact')
    fill_in('first_name', :with => 'Ian')
    fill_in('last_name', :with => 'MacDonald')
    fill_in('birthday', :with => 'July, 1, 1870')
    click_button('Add')
    expect(page).to have_content('Ian MacDonald has been added to your address book')
  end
end

describe('the add phone contact path', {:type => :feature}) do
  it('will click on a contact and lead to the contact information page. the user can then add a phone number for that contact') do
    visit('/')
    click_link('Add Contact')
    fill_in('first_name', :with => 'John')
    fill_in('last_name', :with => 'Smith')
    fill_in('birthday', :with => 'July, 1, 1870')
    click_button('Add')
    click_link('Home')
    click_link('John Smith')
    click_link('Add a New Phone Number')
    fill_in('area_code', :with => '503')
    fill_in('number', :with => '555-1234')
    fill_in('type', :with => 'home')
    click_button('Add')
    expect(page).to have_content('John\'s phone number : (503) 555-1234 has been added to your address book')
  end
end

describe('the add email contact path', {:type => :feature}) do
  it('will click on a contact and lead to the contact information page. the user can then add an email for that contact') do
    visit('/')
    click_link('Add Contact')
    fill_in('first_name', :with => 'Kim')
    fill_in('last_name', :with => 'Dang')
    fill_in('birthday', :with => 'July, 1, 1870')
    click_button('Add')
    click_link('Home')
    click_link('Kim Dang')
    click_link('Add a New E-mail')
    fill_in('user_name', :with => 'kim')
    fill_in('domain', :with => 'gmail.com')
    click_button('Add')
    expect(page).to have_content('Kim\'s E-mail : kim@gmail.com has been added to your address book')
  end
end

describe('the add address contact path', {:type => :feature}) do
  it('will click on a contact and lead to the contact information page. the user can then add an address for that contact') do
    visit('/')
    click_link('Add Contact')
    fill_in('first_name', :with => 'Jane')
    fill_in('last_name', :with => 'Doe')
    fill_in('birthday', :with => 'July, 1, 1870')
    click_button('Add')
    click_link('Home')
    click_link('Jane Doe')
    click_link('Add a New Address')
    fill_in('street', :with => '123 N Main St')
    fill_in('city', :with => 'Portland')
    fill_in('state', :with => 'OR')
    fill_in('zip_code', :with => '97124')
    click_button('Add')
    expect(page).to have_content('Jane\'s Address : 123 N Main St, Portland, OR 97124 has been added to your address book')
  end
end
