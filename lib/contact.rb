class Contact
  attr_reader(:first_name, :last_name, :birthday, :id, :phone_numbers, :emails)

  @@contacts = []

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @birthday = attributes.fetch(:birthday)
    @id = @@contacts.length().+(1)
    @phone_numbers = []
    @emails = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:add_number) do |phone_number|
    @phone_numbers.push(phone_number)
  end

  define_method(:add_email) do |email|
    @emails.push(email)
  end
end
