require('rspec')
require('phone')

describe(Phone) do

  describe('#area_code') do
    it('returns an area code') do
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      expect(test_phone_number.area_code()).to(eq('503'))
    end
  end

  describe('#number') do
    it('returns a phone number') do
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      expect(test_phone_number.number()).to(eq('555-1234'))
    end
  end

  describe('#type') do
    it('returns the type of phone number it is') do
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      expect(test_phone_number.type()).to(eq('home'))
    end
  end
end
