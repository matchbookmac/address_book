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
