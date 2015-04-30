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

describe('the add address contact path', {:type => :feature}) do
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
