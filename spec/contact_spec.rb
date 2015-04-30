require('rspec')
require('contact')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#first_name') do
    it('returns a first name') do
      test_contact = Contact.new({:first_name => 'John', :last_name => 'Smith', :birthday => 'July 1, 1870'})
      expect(test_contact.first_name()).to(eq('John'))
    end
  end

  describe('#last_name') do
    it('returns a last name') do
      test_contact = Contact.new({:first_name => 'John', :last_name => 'Smith', :birthday => 'July 1, 1870'})
      expect(test_contact.last_name()).to(eq('Smith'))
    end
  end

  describe('#birthday') do
    it('returns a birthday') do
      test_contact = Contact.new({:first_name => 'John', :last_name => 'Smith', :birthday => 'July 1, 1870'})
      expect(test_contact.birthday()).to(eq('July 1, 1870'))
    end
  end

  describe('.all') do
    it('returns an empty array of contacts') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a contact object to an array of contacts') do
      test_contact = Contact.new({:first_name => 'John', :last_name => 'Smith', :birthday => 'July 1, 1870'})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('.clear') do
    it('clears the array of contacts') do
      test_contact = Contact.new({:first_name => 'John', :last_name => 'Smith', :birthday => 'July 1, 1870'})
      test_contact.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of the given contact') do
      test_contact = Contact.new({:first_name => 'John', :last_name => 'Smith', :birthday => 'July 1, 1870'})
      test_contact.save()
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns a contact given its id') do
      test_contact = Contact.new({:first_name => 'John', :last_name => 'Smith', :birthday => 'July 1, 1870'})
      test_contact.save()
      test_contact_2 = Contact.new({:first_name => 'John', :last_name => 'Smith', :birthday => 'July 1, 1870'})
      test_contact_2.save()
      expect(Contact.find(2)).to(eq(test_contact_2))
    end

  end

  describe('#phone_numbers') do
    it('returns an empty array of phone numbers for that contact') do
      test_contact = Contact.new({:first_name => 'John', :last_name => 'Smith', :birthday => 'July 1, 1870'})
      test_contact.save()
      expect(test_contact.phone_numbers()).to(eq([]))
    end
  end

  describe('#add_number') do
    it('adds a phone number to a contact') do
      test_contact = Contact.new({:first_name => 'John', :last_name => 'Smith', :birthday => 'July 1, 1870'})
      test_contact.save()
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      test_phone_number.save()
      test_contact.add_number(test_phone_number)
      expect(test_contact.phone_numbers()).to(eq([test_phone_number]))
    end
  end

  # describe('#add_email') do
  #
  # end
  #
  # describe('#add_address') do
  #
  # end
end
