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

get('/contact') do
  erb(:contact_form)
end

post('/contact') do
  @first_name = params.fetch('first_name')
  @last_name = params.fetch('last_name')
  @birthday = params.fetch('birthday')
  @contact = Contact.new({:first_name => @first_name, :last_name => @last_name, :birthday => @birthday})
  @contact.save()
  erb(:success)
end
