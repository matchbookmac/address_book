require('capybara/rspec')
require('pry')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add contact path', {:type => :feature}) do
  it('will add a contact to the contact list') do
    visit('/')
    click_link('Add Contact')
    fill_in('first_name', :with => 'John')
    fill_in('last_name', :with => 'Smith')
    fill_in('birthday', :with => 'July, 1, 1870')
    click_button('Add')
    expect(page).to have_content('John Smith has been added to your address book')
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
    click_link('first_name')
    click_link('Add Phone Number')
    fill_in('area_code', :with => '503')
    fill_in('number', :with => '555-1234')
    fill_in('type', :with => 'home')
    click_button('Add')
    expect(page).to have_content('Successfully saved')
  end
end
