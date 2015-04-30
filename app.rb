require('pry')
require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/phone')
require('./lib/email')
require('./lib/address')
also_reload('lib/**/*.rb')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

get('/contact/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact)
end

get('/add/contact') do
  erb(:contact_form)
end

post('/add/contact') do
  @first_name = params.fetch('first_name')
  @last_name = params.fetch('last_name')
  @birthday = params.fetch('birthday')
  @contact = Contact.new({:first_name => @first_name, :last_name => @last_name, :birthday => @birthday})
  @contact.save()
  erb(:contact_success)
end

get('/contact/:id/add/phonenumber') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:phone_number_form)
end

post('/contact/:id/add/phonenumber') do
  @contact = Contact.find(params.fetch('id').to_i())
  @area_code = params.fetch('area_code')
  @number = params.fetch('number')
  @type = params.fetch('type')
  @phone_number = Phone.new({:area_code => @area_code, :number => @number, :type => @type})
  @phone_number.save()
  @contact.add_number(@phone_number)
  erb(:phone_success)
end

get('/contact/:id/add/email') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:email_form)
end

post('/contact/:id/add/email') do
  @contact = Contact.find(params.fetch('id').to_i())
  @user_name = params.fetch('user_name')
  @domain = params.fetch('domain')
  @email = Email.new({:user_name => @user_name, :domain => @domain})
  @email.save()
  @contact.add_email(@email)
  erb(:email_success)
end

get('/contact/:id/add/address') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:address_form)
end

post('/contact/:id/add/address') do
  @contact = Contact.find(params.fetch('id').to_i())
  @street = params.fetch('street')
  @city = params.fetch('city')
  @state = params.fetch('state')
  @zip_code = params.fetch('zip_code')
  @address = Address.new({:street => @street, :city => @city, :state => @state, :zip_code => @zip_code})
  @contact.add_address(@address)
  erb(:address_success)
end
